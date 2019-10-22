from rest_framework.status import HTTP_400_BAD_REQUEST
from presentation.models import Para, Level
from rest_framework import viewsets
from presentation.Serializers.para_serializers import ParaSerializers, ParaReadSerializers
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from django.core.exceptions import ObjectDoesNotExist
from itertools import chain


class ParaViewSet(viewsets.ModelViewSet):
	serializer_class = ParaSerializers
	queryset = Para.objects.all()

	# GET http://localhost:8000/para/
	def list(self, request, *args, **kwargs):
		return Response(ParaReadSerializers(self.queryset, many=True).data)

	# GET http://localhost:8000/para/**/
	def retrieve(self, request,*args, **kwargs):

		para = get_object_or_404(self.queryset, pk=self.kwargs["pk"])
		return Response(ParaReadSerializers(para).data)

	# POST http://localhost:8000/para/
	# with body
	def create(self, request,*args, **kwargs):
		request_data = request.data.copy()
		try:
			id = request.data['para_parent']
		except:
			return Response('Paragraph parent id is needed', HTTP_400_BAD_REQUEST)

		try:
			parent = Level.objects.get(id=id)
		# self.serializer_class(data=request.data).is_valid(raise_exception=True)
		# self.perform_create(self.serializer_class(data=request.data))
		except ObjectDoesNotExist:
			return Response("Level id(" + id + ") is not found", 404)

		# automated add position
		# append
		children_list = parent.get_children().order_by('position')
		children_para_list = parent.para_set.all().order_by('position')
		try:
			# get last position.
			last_position = max(
				i for i in [children_list.last().position, children_para_list.last().position] if i is not None)
		except:
			# empty node (max(none,none)), add one level child with position of -1 + 1 = 0
			last_position = -1

		if request_data.get('position') is None:
			request_data['position'] = last_position + 1

		# insert
		# Update children position when insert between nodes. Mainly implemented by reserving position for new level
		elif int(request_data['position']) <= last_position:
			cached_list = list(chain(children_list, children_para_list))
			for child in cached_list:
				if child.position >= last_position:
					child.position += 1
					child.save()

		serializer = self.serializer_class(data=request_data)
		serializer.is_valid(raise_exception=True)

		serializer.save()
		return Response(serializer.data, 200)

	# DELETE http://localhost:8000/para/**/
	def destroy(self, request,*args, **kwargs):
		try:
			para = Para.objects.get(pk=self.kwargs["pk"])

		except ObjectDoesNotExist:
			return Response("Para id(" + self.kwargs["pk"] + ") is not found", 404)

		para.delete()
		self._updatePosition(para.para_parent)

		return Response("Para is successfully deleted.", 204)

	# PUT http://localhost:8000/para/**/
	# PATCH http://localhost:8000/para/**/
	def update(self, request, *args, **kwargs):
		response = super().update(request, *args, **kwargs)
		if request.data.get("position") is not None:
			self._updatePosition(Para.objects.get(pk=self.kwargs["pk"]).para_parent,int(request.data["position"]))

		response.data = {'status': 'successfully update'}
		return response

	def _updatePosition(self,parent,position=None):
		children_list = parent.get_children().order_by('position')
		children_para_list = parent.para_set.all().order_by('position')

		#merge two list
		cached_list = list(chain(children_list, children_para_list))
		cached_list = sorted(cached_list, key=lambda instance: instance.position)

		index = 0
		if position == None:
			for child in cached_list:
				if child.position != index:
					child.position = index
					child.save()
			index += 1
			return

		for child in cached_list:
			if child.position >= position:
				child.position += 1
				child.save()
		return