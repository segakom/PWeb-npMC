"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const React = require("react");
exports.ContentItem = (props) => {
    const { description, photo, makeId, modelId, production, enginePower, luggageCapacity, seatsCount, } = props.car;
    const model = props.models.find((x) => x.id === modelId);
    const make = props.makes.find((x) => x.id === makeId);
    return (React.createElement("div", { className: "c-content-item" },
        React.createElement("div", { className: "c-content-item--info" },
            React.createElement("div", { className: "c-content-item--photo", style: { backgroundImage: `url(${photo})` } }),
            React.createElement("div", { className: "c-content-item--data" },
                React.createElement("div", null, "\u041C\u0430\u0440\u043A\u0430 \u0430\u0432\u0442\u043E\u043C\u0430\u0431\u0438\u043B\u044F"),
                React.createElement("div", null, make && make.name),
                React.createElement("div", null, "\u041A\u043B\u0430\u0441\u0441"),
                React.createElement("div", null, model && model.name),
                React.createElement("div", null, "\u0413\u043E\u0434 \u0412\u044B\u043F\u0443\u0441\u043A\u0430"),
                React.createElement("div", null, production),
                React.createElement("div", null, "\u0414\u0432\u0438\u0433\u0430\u0442\u0435\u043B\u044C"),
                React.createElement("div", null,
                    enginePower,
                    "\u043B.\u0441."),
                React.createElement("div", null, "\u0412\u043C\u0435\u0442\u0441\u0438\u0442\u0435\u043B\u044C\u043D\u043E\u0441\u0442\u044C \u0431\u0430\u0433\u0430\u0436\u043D\u0438\u043A\u0430"),
                React.createElement("div", null, luggageCapacity),
                React.createElement("div", null, "\u0421\u0438\u0434\u0435\u043D\u0438\u0439"),
                React.createElement("div", null, seatsCount))),
        React.createElement("div", { className: "c-content-item--description" }, description)));
};
