"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const React = require("react");
const search_bar_1 = require("@app/componets/search-bar");
const content_list_1 = require("@app/componets/content-list");
class MainPage extends React.Component {
    constructor() {
        super(...arguments);
        this.state = {
            cars: [],
            makes: [],
            models: [],
        };
        this.search = (model) => __awaiter(this, void 0, void 0, function* () {
            let query = '';
            for (const key in model) {
                if (key in model) {
                    if (query !== '' && model[key]) {
                        query += '&';
                    }
                    if (model[key]) {
                        query += key + "=" + encodeURIComponent(model[key]);
                    }
                }
            }
            const cars = yield (yield fetch('http://localhost:61051/api/car?' + query)).json();
            this.setState({ cars });
        });
    }
    render() {
        const { models, makes, cars } = this.state;
        return (React.createElement("div", { className: "p-main-page" },
            React.createElement("div", { className: "p-main-page--header" }, "\u0410\u0440\u0435\u043D\u0434\u0430 \u043C\u0430\u0448\u0438\u043D"),
            React.createElement("div", { className: "p-main-page--bar" },
                React.createElement(search_bar_1.SearchBar, { data: {
                        makeList: makes,
                        modelList: models,
                    }, search: this.search })),
            React.createElement("div", { className: "p-main-page--content" },
                React.createElement(content_list_1.ContentList, { cars: cars, makes: makes, models: models }))));
    }
    componentDidMount() {
        return __awaiter(this, void 0, void 0, function* () {
            const models = yield (yield fetch('http://localhost:61051/api/model')).json();
            const makes = yield (yield fetch('http://localhost:61051/api/make')).json();
            const cars = yield (yield fetch('http://localhost:61051/api/car')).json();
            this.setState({ models, makes, cars });
        });
    }
}
exports.MainPage = MainPage;
