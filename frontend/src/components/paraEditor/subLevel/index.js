import React from "react";
import _ from "lodash";
import { Button, Col, Icon, Modal, Row } from "antd";
import InputBox from "../../InputBox";
import DisplayArea from "../../displayArea";
import ParaControl from "../../paraControl";
import removeLevel from "../../../requests/removeLevel";
import { connect } from "react-redux";
import { fetchPage } from "../../../actions";
import paraRenderer from "../../../pageRenderer";

const { confirm } = Modal;

const mapStateToProps = (state) => {
  return {
    title: state.paras.title,
  };
};

const mapDispatchToProps = (dispatch) => ({
  fetchPage: (id, title) => dispatch(fetchPage(id, title)),
});

class SubLevel extends React.Component {
  deleteLevel = (id) => {
    confirm({
      title: "Are you sure delete this Level?",
      okText: "Yes",
      okType: "danger",
      cancelText: "No",
      onOk: () => {
        removeLevel(id).then((data) => {
          if (data.status !== 200) {
            console.error("Delete error", data);
          } else {
            console.log(data);
            this.props.fetchPage(this.props.id, this.props.title);
          }
        });
      },
      onCancel() {},
    });
  };

  render() {
    const { children, alignment, deletePara } = this.props;

    let left_title = children[0].para_parent.tocTitle;
    let right_title =
      children[0].para_parent.title === null
        ? ""
        : paraRenderer(children[0].para_parent.title);

    let boxHeader;
    if (left_title || right_title) {
      boxHeader = (
        <div
          style={{
            background: "linear-gradient(#fdf5e8,#EAE7DC)",
            borderRadius: "2px 2px 0 0",
            padding: "2px 4px 2px 4px",
          }}
        >
					<Col span={12}>
						<b>{left_title}</b>
					</Col>
					<Col span={12}>
						{right_title}
					</Col>
        </div>
      );
    }

    let content = _.map(children, (item) => {
      // true: RL
      if (alignment) {
        return (
          <div className="paraWrapper" key={item.id}>
            <div className="inputDiv">
              <InputBox
                id={item.id}
                setFocusArea={this.props.setFocusArea}
                boxValue={item.content.data}
              />
            </div>
            <div className="displayDiv">
              <DisplayArea id={item.id} />
            </div>
            <div className="controlDiv">
              <ParaControl
                id={item.id}
                delete={deletePara}
                parentId={item.para_parent.id}
              />
            </div>
          </div>
        );
      } else {
        return (
          <Row key={item.id}>
            <Col span={23}>
              <InputBox
                id={item.id}
                boxValue={item.content.data}
                setFocusArea={this.props.setFocusArea}
                TBview="true"
              />

              <DisplayArea id={item.id} />
            </Col>

            <Col span={1}>
              <ParaControl
                id={item.id}
                delete={deletePara}
                parentId={item.para_parent.id}
              />
            </Col>
          </Row>
        );
      }
    });

    let subLevelControl = (
      <div>
        <Button>
          <Icon type="up" />
        </Button>

        <Button
          type={"danger"}
          onClick={() => this.deleteLevel(children[0].para_parent.id)}
        >
          <Icon type="delete" />
        </Button>

				<Button>
          <Icon type="down" />
        </Button>
      </div>
    );

    return (
      <div
        style={{
          background: "#fdf5e8",
          borderRadius: "2px",
          boxShadow: "0 0 0 1px rgba(0,0,0,0.1), 0 1px 2px rgba(0,0,0,0.35)",
          margin: "10px 0",
          paddingBottom: "30px",
        }}
      >
        <Row>{boxHeader}</Row>
        <Row>{content}</Row>
        <Row type="flex" justify="center">{subLevelControl}</Row>
      </div>
    );
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(SubLevel);
