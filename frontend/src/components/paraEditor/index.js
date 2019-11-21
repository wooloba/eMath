import React from "react";
import {connect} from 'react-redux';
import {
	loadPage,
	loadPageError,
	openNewWindow,
	paraOnChange,
	popQueue,
	fetchPage,

} from '../../actions'
import {Input, message, Button, Icon, Tooltip} from 'antd';
import _ from "lodash";
import contentProcessor from './../splitView/pageCreator/pageRenderer/index'
import {Scrollbars} from 'react-custom-scrollbars';
import EditorToolBar from './editorBar'
import postPara from "../../requests/postPara";
import updatePara from "../../requests/updatePara";
import MathJax from "../mathDisplay";
import MathJaxConfig from "../../constants/MathJax_config";


//this.props.data
const mapStateToProps = state => {
	return {
		data: state.paras.paras,
		status: state.paras.status,
		uploadingQueue: state.paras.uploadingQueue,
		title: state.paras.title,
		id: state.paras.id,
	}
};

const mapDispatchToProps = dispatch => ({
	fetchPage:(id,title)=>dispatch(fetchPage(id,title)),
	loadPage: (id) => dispatch(loadPage(id)),
	loadPageError: (error) => dispatch(loadPageError(error)),
	onWindowOpen: (pageId) =>
		dispatch(openNewWindow(pageId)),
	paraOnChange: (para, id) => dispatch(paraOnChange(para, id)),
	popQueue: (id) => dispatch(popQueue(id)),

});


const {TextArea} = Input;


class ParaEditor extends React.Component {
	constructor(props) {
		super(props);

		this.state = {
			uploading: false,
			sideAlign: true,
		};

		this.uploadingData = this.uploadingData.bind(this);
	}

	//save para periodically
	async componentDidMount() {
		setInterval(this.uploadingData, 10000)
	}

	async uploadingData() {
		if (!_.isEmpty(this.props.uploadingQueue)) {
			try {
				this.setState({
					uploading: true
				});
				console.log(this.props.uploadingQueue);

				for (let key in this.props.uploadingQueue) {
					if (!this.props.uploadingQueue.hasOwnProperty(key)) continue;

					if (this.props.uploadingQueue[key]) {
						if (this.props.uploadingQueue[key].status === "update") {

							let request_body = JSON.stringify({
								"content": this.props.uploadingQueue[key]["content"],
								"caption": this.props.uploadingQueue[key]["caption"],
							}, key);

							await updatePara(request_body, key).then(data => {
								if (!data || data.status !== 200) {
									if (data.status === 400) {
										message.error(data.data);
									}
									console.error("Update Para error", request_body, data);

								}
							});
							this.props.popQueue(key);
						}
					}

				}
				this.setState({
					uploading: false
				})
			} catch (error) {
				console.log(error);
			}
		}
	};

	setContent = (e, id) => {
		// console.log(e.target.value);
		// console.log(id);
		try {
			JSON.parse(e.target.value);
			this.props.paraOnChange(e.target.value, id);
		} catch (err) {
			message.warning('There might be an error in your content!');
		}
	};

	switchView = () => {
		this.setState(prevState => ({
			sideAlign: !prevState.sideAlign
		}))
	};

	addPara = () => {
		//this.props.id
		let request_body;
		request_body = JSON.stringify({
			"content": {
				"data": {
					"content":"",
					"textAlign":"",
				},
				"type": "text"
			},

			"caption": "",
			"para_parent": this.props.id
		});

		postPara(request_body).then(data => {
			if (!data || data.status !== 200) {
				console.error("Failed to add para", data);
			}
			else {
				console.log(data);
				this.props.fetchPage(this.props.id,this.props.title);
			}
		})
	};

	render() {
		return (
			<div>
				{(this.props.status === null) ? (
					<div style={{display: 'flex', justifyContent: 'center', marginTop: '35%', background: '#FFF933'}}>
						<p style={{fontSize: '25px'}}> Double click a page to edit.</p>
					</div>) : (

					<div>

						<EditorToolBar switchView={this.switchView}/>
						<div style={{backgroud: "white"}}>
							{<Button type="primary" icon="upload" loading={this.state.uploading}
							         onClick={() => this.uploadingData()}/>}
						</div>
						<h3 align={"center"}>
							{this.props.title}
						</h3>
						<Scrollbars
							style={{
								width: '83vw',
								height: "80vh",
								paddingBottom: '20px',
								margin: '10px',
								"textAlign":"center",
							}}
						>
							{_.map(this.props.data, (item, i) => {
								let defaultValue;
								if (Array.isArray(item)) {
									defaultValue = item.map(obj => {
										return obj.content.data.content
									});
								} else {
									defaultValue = item.content.data.content
								}

								return (
									<div
										key={item.id}
										style={{
											display: this.state.sideAlign ? 'flex' : 'block'
										}}
									>

										<TextArea
											defaultValue={JSON.stringify(defaultValue)}
											autosize={!this.state.sideAlign}
											style={{
												width: this.state.sideAlign ? '40vw' : '80vw',
												margin: '10px'
											}}
											onChange={(e) => this.setContent(e, item.id)}
										/>

										<MathJax.Provider
											{...MathJaxConfig}
											onError={(MathJax, error) => {
												console.warn(error);
												console.log("Encountered a MathJax error, re-attempting a typeset!");
												MathJax.Hub.Queue(
													MathJax.Hub.Typeset()
												);
											}}
										>
											<div
												style={{
													width: this.state.sideAlign ? '40vw' : '80vw',
													margin: '10px',
													padding: '10px',
													background: "#FFFBE6",
												}}>
												{contentProcessor(this.props.data[i], this.props.onWindowOpen)}
											</div>

										</MathJax.Provider>

									</div>

								)
							})}

							<Tooltip placement="bottom" title={"Add one para"}>
								<Button onClick={this.addPara} size={"large"} style={{width:"30vw"}}>
									<Icon type="plus"/>
								</Button>
							</Tooltip>

						</Scrollbars>
						
					</div>
				)}

			</div>
		)
	}

}

export default connect(mapStateToProps, mapDispatchToProps)(ParaEditor)