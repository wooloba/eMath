import React from 'react'
import styles from "../styles/style";
import {Scrollbars} from 'react-custom-scrollbars';
import {Button} from 'react-desktop/windows';
import _ from "lodash";
import axios from 'axios'
import url from '../../../requests/Urls'

export default function initElement(el) {
	let link = linksCollector(this.state.paraText);
	console.log(link);

	return (
		<div key={el.i} data-grid={el}
		     style={{...styles.window}}>
			<div style={{...styles.titleBar}}>

				<Button>Pre</Button>

				<span style={{...styles.title}}>
								Chapter one - Higher Dimensions and the Vector Space ℝn
							</span>

				<Button className='ml-auto'>Next</Button>

			</div>

			<Scrollbars>
				{_.map(this.state.paraText, (para, key) => {

					if (link[key].length !== 0) {
						let parts = para;
						link[key].forEach(function (el) {
							let linkPhrase = el.content;
							let re = new RegExp(linkPhrase,'g');

							parts = parts.split(re);
							for (let i = 1; i < parts.length; i += 2) {
								parts[i] = <a onClick={this.props.onWindowOpen}>{linkPhrase}</a>
							}

						});
						return parts;
					}
					else {
						return para.content
					}
				})
				}

			</Scrollbars>
		</div>
	)
}

async function linksCollector(paras) {
	let promises = [];
	let link = [];
	await paras.map((data) => {
		promises.push(fetchLinks(data.id))
	});

	Promise.all(promises).then((response) => {
		console.log(response);
		link.push(response);
	});
	return link
}


function fetchLinks(ids) {
	let Url = url.domain + ':' + url.port + "/Link/Internal/?id=" + ids;

	return new Promise(resolve => {
		axios.get(Url, {
			headers: {
				"Content-Type": "application/json"
			},
		})
			.then(function (response) {
				resolve(response.data);
			}).catch((error) => console.error(error));
	});
}