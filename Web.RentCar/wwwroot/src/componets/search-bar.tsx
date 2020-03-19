import * as React from 'react';
import { SearchModel } from '@app/models/search-model';

export interface IOption {
  id: string;
  name: string;
}

export interface ISearchContent {
  makeList: IOption[];
  modelList: IOption[];
}

interface ISearchBarProps {
  search: (model: SearchModel) => void;
  data: ISearchContent;
}

interface ISearchBarState {
  model: SearchModel;
}

export class SearchBar extends React.Component<ISearchBarProps, ISearchBarState> {
  public readonly state: ISearchBarState = {
    model: new SearchModel(),
  };

  public render() {
    const { data: { makeList, modelList } } = this.props;

    return (
      <div className="c-searchbar">
        {this.renderSelect(makeList, 'makeId', 'Марка')}
        {this.renderSelect(modelList, 'modelId', 'Модель')}
        {this.renderRange(2000, 2020, 'fromProduction', 'toProduction', 'Выпуск')}
        {this.renderRange(60, 280, 'fromEnginePower', 'toEnginePower', 'Лошадиных сил')}
        {this.renderRange(100, 350, 'fromLuggageCapacity', 'toLuggageCapacity', 'Вместимость')}
        {this.renderRange(2, 8, 'minSeatsCoun', 'maxSeatsCount', 'Сидений')}
        <div>
          <div className="c-searchbar--button" onClick={this.search}>
            Искать
          </div>
        </div>
      </div>
    );
  }


  private renderRange = (
    from: number,
    to: number,
    minProp: keyof SearchModel,
    maxProp: keyof SearchModel,
    name: string) => {

    const leftList = this.mapSelectData(from, +this.state.model[maxProp] || to);
    const rightList = this.mapSelectData(+this.state.model[minProp] || from, to);

    return <div className="c-searchbar--item-range">
      <label className="c-searchbar--item-label">
        {name}
      </label>

      <select defaultValue={this.state.model[minProp]} name={minProp} onChange={this.changeModelHandler(minProp)} >
        <option value="">С</option>
        {leftList.map((item) => <option value={item.id} >{item.name}</option>)}
      </select>
      <select defaultValue={this.state.model[maxProp]} name={maxProp} onChange={this.changeModelHandler(maxProp)} >
        <option value="">До</option>
        {rightList.map((item) => <option value={item.id}>{item.name}</option>)}
      </select>
    </div>;
  }

  private renderSelect = (list: IOption[], prop: keyof SearchModel, name: string) => {
    return <div key={prop} className="c-searchbar--item">
      <label className="c-searchbar--item-label" htmlFor={prop}>{name}</label>
      <select defaultValue={this.state.model[prop]} name={prop} onChange={this.changeModelHandler(prop)} >
        <option value="">Выберете опцию</option>
        {list.map((item) => <option value={item.id}>{item.name}</option>)}
      </select>
    </div>;
  }

  private changeModelHandler = (name: keyof SearchModel) => {
    const model = { ...this.state.model };

    return (event: any) => {
      model[name] = event.target.value;
      this.setState({ model });
    };
  }

  private search = () => {
    if (this.props.search) {
      this.props.search(this.state.model);
    }
  }

  private mapSelectData = (from: number, to: number): IOption[] => {
    const options: IOption[] = [];
    for (let index = from; index <= to; index++) {
      options.push({
        id: index.toString(),
        name: index.toString(),
      });
    }

    return options;
  }
}


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


