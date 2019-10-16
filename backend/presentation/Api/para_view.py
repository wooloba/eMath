from rest_framework.status import HTTP_400_BAD_REQUEST

from presentation.models import Para,Level
from rest_framework import viewsets
from presentation.Serializers.para_serializers import ParaSerializers,ParaReadSerializers
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from django.core.exceptions import ObjectDoesNotExist



class ParaViewSet(viewsets.ModelViewSet):
	serializer_class = ParaSerializers
	queryset = Para.objects.all()

	# GET http://localhost:8000/para/
	def list(self, request, *args, **kwargs):
		return Response(ParaReadSerializers(self.queryset,many=True).data)

	# GET http://localhost:8000/para/**/
	def retrieve(self, request, pk=None):

		para = get_object_or_404(self.queryset, pk= pk)
		return Response(ParaReadSerializers(para).data)


	#POST http://localhost:8000/para/
	#with body
	def create(self, request):
		try:
			id =  request.data['para_parent']
		except:
			return Response('Paragraph parent id is needed', HTTP_400_BAD_REQUEST)

		try:
			Level.objects.get(id =id)
			# self.serializer_class(data=request.data).is_valid(raise_exception=True)
			# self.perform_create(self.serializer_class(data=request.data))
		except ObjectDoesNotExist:
			return Response("Level id(" + id +") is not found", 404)

		serializer = self.serializer_class(data=request.data)
		serializer.is_valid(raise_exception=True)

		serializer.save()
		return Response(serializer.data, 200)


	#DELETE http://localhost:8000/para/**/
	def destroy(self, request,pk=None):
		try:
			para = Para.objects.get(pk=pk)

		except ObjectDoesNotExist:
			return Response("Para id(" + pk +") is not found", 404)

		para.delete()
		return Response("Para is successfully deleted.", 204)

	#PUT http://localhost:8000/para/**/
	#PATCH http://localhost:8000/para/**/
	def update(self, request,*args, **kwargs):
		response = super().update(request,*args, **kwargs)
		response.data = {'status': 'successfully update'}
		return response

