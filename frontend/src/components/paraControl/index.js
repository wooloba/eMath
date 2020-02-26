import React from "react";
import {Button, Icon, Dropdown, Menu, } from "antd";
import AddIndex from "./addIndex";
import {getIndexTree} from "../../requests/getTree";

const valueMap = {};

export default class ParaControl extends React.Component {
	state = {
		visible: false,
		title: '',
	};

	showModal = (title) => {
		this.setState({
			visible: true,
			title: title,
			indexTree : null,
		})
	};

	toggleModal = () => {
		this.setState(prevState => ({visible: !prevState.visible}));
	};

	loops = (list, parent) => {
			return (list || []).map(({children, value,title}) => {
				const node = (valueMap[value] = {
					parent,
					value,
					title,
				});
				node.children = this.loops(children, node);
				return node;
			});
		};

	fetchIndexTree = (type) =>{
		getIndexTree(this.props.parentId, type).then(
				data => {
					if (!data || data.status !== 200) {
						console.error("FETCH_Glossary_FAILED", data);
					} else {
						this.setState({
								indexTree: data.data.treeData
							});
						this.loops(this.state.indexTree);
						console.log(valueMap);
					}
				}
		);
	};

	render() {
		const {visible, title} = this.state;

		const menu = <Menu>
			<Menu.Item key="1" onClick={() => {
				this.showModal('Glossary');
				this.fetchIndexTree('glossary');
			}}>Glossary</Menu.Item>

			<Menu.Item key="2" onClick={() => {
				this.showModal('Symbol Index');
				this.fetchIndexTree('symbol_index');
			}}>Symbol Index</Menu.Item>

			<Menu.Item key="3" onClick={() => {
				this.showModal('Author Index');
				this.fetchIndexTree('author_index');
			}}>Author Index</Menu.Item>
		</Menu>;


		return (
			<div style={{
				height: "100%",
			}}>
				<div>
					<Button>
						<Icon type="up"/>
					</Button>
				</div>

				<div>
					<Button type={"danger"} onClick={() => this.props.delete(this.props.id)}>
						<Icon type="delete"/>
					</Button>
				</div>

				<Dropdown overlay={menu}>
					<Button>
						<Icon type="link" />
					</Button>
				</Dropdown>
				<AddIndex
						title={title}
						visible={visible}
						id={this.props.id}
						toggleModal={this.toggleModal}
						indexTree = {this.state.indexTree}
						valueMap = {valueMap}
				/>


				<div>
					<Button>
						<Icon type="down"/>
					</Button>
				</div>

			</div>
		)

	}

}