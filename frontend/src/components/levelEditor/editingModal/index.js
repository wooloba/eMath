import React from 'react'
import {Menu, Dropdown, Button, Modal, Form, Input, Checkbox} from 'antd';
import postLevel from '../../../requests/postLevel';

const LevelForm = Form.create({name: 'form_in_modal'})(
	class extends React.Component {
		constructor(props) {
			super(props);
		};

		render() {
			const {visible, onCancel, onCreate, form, parent, modifyState,loading} = this.props;
			const {getFieldDecorator} = form;
			return (
				<Modal
					visible={visible}
					title="Create a new collection"
					okText="Create"
					onCancel={onCancel}
					onOk={onCreate}
					footer={[
						<Button key="back" onClick={onCancel}>
							Return
						</Button>,
						<Button key="submit" type="primary" onClick={onCreate} loading={loading}>
							Submit
						</Button>,
					]}
				>
					<Form layout="vertical">
						<Form.Item label="Title">
							{getFieldDecorator('title', {
								rules: [{required: true, message: 'Please input the title of collection!'}],
								initialValue: modifyState === "New" ? '' : parent.title,
							})(<Input/>)}
						</Form.Item>

						<Form.Item label="Table of content Title" extra="Leave it empty if same as title">
							{getFieldDecorator('tocTitle', {
								initialValue: modifyState === "New" ? '' : parent.tocTitle,
							})(<Input/>)}
						</Form.Item>

						<Form.Item>
							{getFieldDecorator('isPage', {
								initialValue: modifyState === "New" ? '' : parent.isPage,
							})(<Checkbox>It will be a page</Checkbox>)}
						</Form.Item>
					</Form>
				</Modal>
			);
		}
	},
);

export default class EditingModal extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			visible: false,
			modifyState: '',
			loading: false,
		};
	}

	showModal = (state) => {
		this.setState({
			visible: true,
			modifyState: state,
		});
	};

	handleCancel = () => {
		this.setState({visible: false});
	};

	saveFormRef = formRef => {
		this.formRef = formRef;
	};

	handleCreate = () => {
		const {form} = this.formRef.props;

		this.setState({loading: true});

		form.validateFields((err, values) => {
			if (err) {
				return;
			}

			if(values.tocTitle === '' && values.title !== ''){
				values.tocTitle = values.title;
			}

			let request_body = JSON.stringify({...values, parent: this.props.parent.id});

			if (this.state.modifyState === 'New') {
				postLevel(request_body).then(data => {
					if (!data || data.status !== 200) {
						console.error("Submit failed", data);
					}
					else {
						this.props.updateTree();
					}
				})
			}

			form.resetFields();
			this.setState({
				visible: false,
				modifyState: '',
				loading:false
			});
		});
	};

	render() {
		const menu = this.props.parent.isPage ? (
			<Menu>
				<Menu.Item key="1" onClick={() => {
					this.showModal('Edit')
				}}>Edit</Menu.Item>
				<Menu.Item key="2">Remove</Menu.Item>
			</Menu>
		) : (
			<Menu>
				<Menu.Item key="1" onClick={() => {
					this.showModal('New')
				}}>New...</Menu.Item>
				<Menu.Item key="2" onClick={() => {
					this.showModal('Edit')
				}}>Edit</Menu.Item>
				<Menu.Item key="3">Remove</Menu.Item>
			</Menu>
		);

		return (
			<div>
				<Dropdown overlay={menu} trigger={['contextMenu']}>
					<span style={{userSelect: 'none'}}>{this.props.title}</span>
				</Dropdown>
				<LevelForm
					wrappedComponentRef={this.saveFormRef}
					visible={this.state.visible}
					onCancel={this.handleCancel}
					onCreate={this.handleCreate}
					modifyState={this.state.modifyState}
					parent={this.props.parent}
					loading={this.state.loading}
				/>

			</div>
		);
	}
};