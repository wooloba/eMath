import React from 'react'
import {Form, Button, Modal, Input, Checkbox, Icon, message} from "antd";
import updateBook from "../../../requests/updateBook";

const LevelForm = Form.create({name: 'form_in_modal'})(
	class extends React.Component {
		state = {
			deleteButton: true
		};

		matchCheck = (e) => {
			if (e.target.value === this.props.parent.tocTitle) {
				this.setState({
					deleteButton: false,
				})
			} else {
				this.setState({
					deleteButton: true,
				})
			}
		};
		cancelInput = () => {
			this.setState({
				deleteButton: true,
			});
			this.props.onCancel();
		};


		onAdd = () => {
			const {modifyState, form, parent, onCancel} = this.props;

			form.validateFields((err, values) => {
				if (err) {
					return;
				}

				let request_body;

				request_body = JSON.stringify({
					add: modifyState,
					path: values["path"],
					referredId: parent.id

				});

				updateBook(request_body, parent.id).then(data => {
					if (!data || data.status !== 200) {
						if (data.status === 400) {
							message.error(data.data);
						}
						console.error("Update error", request_body, data);
					}
				});

				onCancel();

			});
		};

		render() {
			console.log(this.props);

			const {visible, onCancel, onCreate, form, parent, modifyState, loading, onDelete} = this.props;
			const {getFieldDecorator} = form;
			let title;
			if (modifyState === "New") {
				title = "Create a new branch under " + parent.tocTitle
			} else if (modifyState === "Edit") {
				title = "Edit " + parent.tocTitle
			} else if (modifyState === "Remove") {
				return (
					<Modal
						visible={visible}
						title="Are you absolutely sure?"
						okText="Remove"
						onOk={onDelete}
						onCancel={this.cancelInput}
						footer={[
							<Button key="delete" type={"danger"} disabled={this.state.deleteButton} onClick={onDelete}
							        block={true}>

								I understand the consequences, delete this branch
							</Button>
						]}
					>
						<p>
							<Icon type="warning" theme="filled"/>
							{"  This action cannot be undone. This will permanently delete the "}
							<b> {parent.tocTitle} </b>
							{" branch and all the content belongs to it."}
						</p>

						<p>
							Please type in the name of the branch to confirm.
						</p>


						<Form layout="vertical">
							<Form.Item>
								{getFieldDecorator('title', {
									initialValue: ''
								})(<Input onChange={this.matchCheck}/>)}
							</Form.Item>
						</Form>

					</Modal>
				)
			} else {
				return (
					<Modal
						visible={visible}
						title={"Enter Path of " + modifyState}
						footer={[
							<Button key="back" onClick={onCancel}>
								Cancel
							</Button>,
							<Button key="submit" type="primary" onClick={() => this.onAdd()} loading={loading}>
								Submit
							</Button>,
						]}
					>
						<Form layout="vertical">
							<Form.Item>
								{getFieldDecorator('path', {
									initialValue: ''
								})(<Input/>)}
							</Form.Item>
						</Form>
					</Modal>
				)
			}

			return (
				<Modal
					visible={visible}
					title={title}
					okText="Create"
					onCancel={onCancel}
					onOk={onCreate}
					footer={[
						<Button key="back" onClick={onCancel}>
							Cancel
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

						<Form.Item extra={"You will not be able to create a new branch under a page."}>
							{getFieldDecorator('isPage', {
								valuePropName: 'checked',
								initialValue: modifyState === "New" ? false : parent.isPage,
							})(<Checkbox>It will be a page</Checkbox>)}

						</Form.Item>
					</Form>
				</Modal>
			);
		}
	},
);

export default LevelForm;