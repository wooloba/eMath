import React from 'react'
import styles from "../styles/style";
import Scrollbars from 'react-custom-scrollbars';

import TitleBar from '../../titleBar';
import {connect} from "react-redux";
import {closeWindow, minimizeWindow, onLayoutChange, openNewWindow} from "../../../actions";
import getPage from "../../../requests/getPage";
import getPara from "../../../requests/getPara";
import _ from "lodash";
import paraRenderer from "../../../pageRenderer";
import {Tabs} from 'antd';
import getNextLevel from "../../../requests/getNextLevel";

const {TabPane} = Tabs;

const mapStateToProps = state => {
	return {items: state.windows.items}
};

const mapDispatchToProps = dispatch => ({
	onWindowOpen: (pageId,isPage) =>
		dispatch(openNewWindow(pageId,isPage)),
	onCloseWindow: (id) =>
		dispatch(closeWindow(id)),
	minimizeWindow: (id, title, pageId) =>
		dispatch(minimizeWindow(id, title, pageId)),
	onLayoutChange: (layout) =>
		dispatch(onLayoutChange(layout)),
});

class CreateElement extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			paraText: [],
			pageTitle: null,
			context: null
		};
	}

	async componentDidMount() {
		//this.props['data-grid'] stores this window's information
		let pageContent;
		let context;

		let id = this.props['data-grid'].pageId;
		if (this.props['data-grid'].isPage) {
			pageContent = await getPage({id: id, page: null});
		} else {
			pageContent = await getPara({id: id});
			pageContent.data = [pageContent.data];
			context = await getNextLevel({id:id});
		}

		console.log(pageContent,context);

		if (typeof (context) !== 'undefined' && context.data.context.length !== 0 ) {
			this.setState({
				context:context.data.context
			});
		}

		if (typeof (pageContent) !== 'undefined' && pageContent.data.length !== 0) {
			this.setState({
				pageTitle: pageContent.data.flat(Infinity)[0].para_parent.title,
				paraText: pageContent.data,
			});
		} else {
			this.setState({
				pageTitle: ['This page is under construction.'],
				paraText: null,
			});
		}
	}

	render() {
		let i = this.props['data-grid'].i;
		const {minimizeWindow, onWindowOpen, onCloseWindow, onLayoutChange, ...rest} = this.props;
		return (
			<div {...rest}
			     className={`wrapper ${this.props.className}`}
			     style={{...styles.window, ...this.props.style}}
			>
				<TitleBar
					className='windowHeader'
					title={this.state.pageTitle}
					controls
					background={this.props.color}
					onCloseClick={() => {
						this.props.onCloseWindow(i)
					}}
					onMinimizeClick={() => {
						this.props.minimizeWindow(i, this.state.pageTitle, this.props['data-grid'].pageId)
					}}
				/>
				<Scrollbars>
					{this.props.children}
					{/*content will not show if put scrollbars inside a div*/}
					<div style={{
						background: '#F7F7EE',
						borderRadius: '2px',
						boxShadow: '0 0 0 1px rgba(0,0,0,0.1), 0 1px 10px rgba(0,0,0,0.35)',
						margin: '1em .9em',
						padding: '.25em 1.25em .1em'
					}}>
						<Tabs defaultActiveKey={"1"}>
							<TabPane tab={"Reference"} key={"1"}>
								{
									_.map(this.state.paraText, para => {
										return paraRenderer(para, this.props)
									})
								}
							</TabPane>
							<TabPane tab={"Context"} key={"2"}>
								{
									_.map(this.state.context, para => {
										return paraRenderer(para, this.props)
									})
								}
							</TabPane>
						</Tabs>

					</div>

				</Scrollbars>
			</div>
		)
	}
}

export default connect(mapStateToProps, mapDispatchToProps)(CreateElement)