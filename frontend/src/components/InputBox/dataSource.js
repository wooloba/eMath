import emoji from "@jukben/emoji-search";
import React from "react";

const Item = ({entity: {name, char}}) => <div>{`${name}: ${char}`}</div>;

const tagArray = [
	{name: "Bold", char: "<b></b>"},
	{name: "Italic", char: "<i></i>"},
	{name: "Caption", char: "<Caption></Caption>"},
	{name: "Inline Math", char: "<Math inline=\"true\"></Math>"},
	{name: "MathDisplay", char: "<Math></Math>"},
	{name: "Internal Link", char: "<iLink id=\"\"></iLink> "},
	{name: "Numbered List", char: "<ol>\n\t<li></li>\n</ol>"},
	{name: "Bulleted List", char: "<ul>\n\t<li></li>\n</ul>"},
	{name: "Table", char: "<table>\n\t<tr>\n\t<td></td>\n\t</tr>\n</table> "},
	{name: "Table Cell", char: "<td></td>>"},
	{name: "List Item", char: "<li></li>"},
	{name: "Table Row", char: "<tr></tr>>"},
];

const dataSource = {
	"<": {
		dataProvider: token => (
			tagArray
				.filter(item => {
					return item.name.toLowerCase().includes(token.toLowerCase()) || item.char.toLowerCase().includes(token.toLowerCase())
				})
				.slice(0, 10)
				.map(({ name, char }) => ({ name, char }))
		),
		component: Item,
		output: (item, trigger) => ({
			text: item.char,
			caretPosition: "next"
		})
	}
};

export default dataSource;