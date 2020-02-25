import React from 'react'
import {Form, Button, Modal, Input} from "antd";
import CaptionOptions from "./SubLevelCaptionOptions";

const AddSubLevel = Form.create({name: 'form_in_modal'})(
	class extends React.Component {

		render() {
			const {visible, onCancel, onCreate, form, loading} = this.props;
			const {getFieldDecorator} = form;

			return (
				<Modal
					visible={visible}
					title={"Add a content block"}
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
						<Form.Item label="Caption">
							<CaptionOptions form={form}/>
						</Form.Item>

						<Form.Item label="Title" extra="You could put Latex code here.">
							{getFieldDecorator('title', {
								initialValue: '<Math inline="true"></Math>',
							})(<Input/>)}
						</Form.Item>

					</Form>
				</Modal>
			);
		}
	},
);

export default AddSubLevel;