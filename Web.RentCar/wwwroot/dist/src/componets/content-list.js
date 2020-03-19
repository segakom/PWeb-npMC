"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const React = require("react");
const content_item_1 = require("./content-item");
exports.ContentList = ({ cars, makes, models }) => {
    return (React.createElement("div", null, cars.map((car) => React.createElement(content_item_1.ContentItem, { key: car.id, makes: makes, models: models, car: car }))));
};
