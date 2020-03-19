"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const React = require("react");
const search_model_1 = require("@app/models/search-model");
class SearchBar extends React.Component {
    constructor() {
        super(...arguments);
        this.state = {
            model: new search_model_1.SearchModel(),
        };
        this.renderRange = (from, to, minProp, maxProp, name) => {
            const leftList = this.mapSelectData(from, +this.state.model[maxProp] || to);
            const rightList = this.mapSelectData(+this.state.model[minProp] || from, to);
            return React.createElement("div", { className: "c-searchbar--item-range" },
                React.createElement("label", { className: "c-searchbar--item-label" }, name),
                React.createElement("select", { defaultValue: this.state.model[minProp], name: minProp, onChange: this.changeModelHandler(minProp) },
                    React.createElement("option", { value: "" }, "\u0421"),
                    leftList.map((item) => React.createElement("option", { value: item.id }, item.name))),
                React.createElement("select", { defaultValue: this.state.model[maxProp], name: maxProp, onChange: this.changeModelHandler(maxProp) },
                    React.createElement("option", { value: "" }, "\u0414\u043E"),
                    rightList.map((item) => React.createElement("option", { value: item.id }, item.name))));
        };
        this.renderSelect = (list, prop, name) => {
            return React.createElement("div", { key: prop, className: "c-searchbar--item" },
                React.createElement("label", { className: "c-searchbar--item-label", htmlFor: prop }, name),
                React.createElement("select", { defaultValue: this.state.model[prop], name: prop, onChange: this.changeModelHandler(prop) },
                    React.createElement("option", { value: "" }, "\u0412\u044B\u0431\u0435\u0440\u0435\u0442\u0435 \u043E\u043F\u0446\u0438\u044E"),
                    list.map((item) => React.createElement("option", { value: item.id }, item.name))));
        };
        this.changeModelHandler = (name) => {
            const model = Object.assign({}, this.state.model);
            return (event) => {
                model[name] = event.target.value;
                this.setState({ model });
            };
        };
        this.search = () => {
            if (this.props.search) {
                this.props.search(this.state.model);
            }
        };
        this.mapSelectData = (from, to) => {
            const options = [];
            for (let index = from; index <= to; index++) {
                options.push({
                    id: index.toString(),
                    name: index.toString(),
                });
            }
            return options;
        };
    }
    render() {
        const { data: { makeList, modelList } } = this.props;
        return (React.createElement("div", { className: "c-searchbar" },
            this.renderSelect(makeList, 'makeId', 'Марка'),
            this.renderSelect(modelList, 'modelId', 'Модель'),
            this.renderRange(2000, 2020, 'fromProduction', 'toProduction', 'Выпуск'),
            this.renderRange(60, 280, 'fromEnginePower', 'toEnginePower', 'Лошадиных сил'),
            this.renderRange(100, 350, 'fromLuggageCapacity', 'toLuggageCapacity', 'Вместимость'),
            this.renderRange(2, 8, 'minSeatsCoun', 'maxSeatsCount', 'Сидений'),
            React.createElement("div", null,
                React.createElement("div", { className: "c-searchbar--button", onClick: this.search }, "\u0418\u0441\u043A\u0430\u0442\u044C"))));
    }
}
exports.SearchBar = SearchBar;
// private renderRange = (
//   from: number,
//   to: number,
//   minProp: keyof SearchModel,
//   maxProp: keyof SearchModel,
//   name: string) => {
//   const minValue = this.state.model[minProp];
//   const maxValue = this.state.model[maxProp];
//   return <div className="c-searchbar--item-range">
//     <label className="c-searchbar--item-label">{name}</label>
//     <input
//       min={}
//       max={maxValue || to}
//       value={minValue}
//       onChange={this.changeModelHandler(minProp)}
//     />
//     <select name={minProp} onChange={this.changeModelHandler(minProp)} >
//       {this.mapSelectData(minValue || from, maxValue || to)
//         .map((item) => <option value={item.id} selected={minValue === item.id}>{item.name}</option>)}
//     </select>
//     <span> - </span>
//     <select name={prop} onChange={this.changeModelHandler(prop)} >
//       {list.map((item) => <option value={item.id}>{item.name}</option>)}
//     </select>
//     <input
//       min={maxValue || from}
//       max={to}
//       value={maxValue}
//       type="number"
//       onChange={this.changeModelHandler(maxProp)} />
//   </div>;
// }
