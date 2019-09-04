import _ from "lodash";
import React from 'react'
import * as utils from './utils'

export default function contentProcessor(paraText, props) {


	return (_.map(paraText, para => {
		let processingPara = para.content;
		let text, list, table;

		if (processingPara["text"]) {
			processingPara = utils.tagParser(processingPara["text"], props);
			text = utils.addCaption(processingPara, para.caption);
		}

		if (processingPara["table"]) {
			table = utils.tableProcessor(processingPara["table"],props)
		}

		if (processingPara["list"]) {
			list = utils.listProcessor(processingPara["list"],props);

		}

		return (
			<div key={_.uniqueId("div_")}>
				<div>
					{text}
					{table}
				</div>
				{list}
			</div>
		)
	}));

}
