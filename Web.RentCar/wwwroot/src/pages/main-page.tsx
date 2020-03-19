import * as React from 'react';
import { SearchBar, IOption } from '@app/componets/search-bar';
import { SearchModel } from '@app/models/search-model';
import { CarModel } from '@app/models/car-model';
import { ContentList } from '@app/componets/content-list';

interface IMainPageState {
  makes: IOption[];
  models: IOption[];
  cars: CarModel[];
}

export class MainPage extends React.Component<any, IMainPageState> {
  public readonly state: IMainPageState = {
    cars: [],
    makes: [],
    models: [],
  };

  public render() {
    const { models, makes, cars } = this.state;
    return (
      <div className="p-main-page">
        <div className="p-main-page--header">
          Аренда машин
        </div>
        <div className="p-main-page--bar">
          <SearchBar data={{
            makeList: makes,
            modelList: models,
          }}
            search={this.search}
          />
        </div>
        <div className="p-main-page--content">
          <ContentList cars={cars} makes={makes} models={models} />
        </div>
      </div>
    );
  }

  public async componentDidMount() {
    const models: IOption[] = await (await fetch('http://localhost:61051/api/model')).json();
    const makes: IOption[] = await (await fetch('http://localhost:61051/api/make')).json();
    const cars: CarModel[] = await (await fetch('http://localhost:61051/api/car')).json();

    this.setState({ models, makes, cars });
  }

  public search = async (model: SearchModel) => {
    let query = '';
    for (const key in model) {
      if (key in model) {
        if (query !== '' && (model as any)[key]) {
          query += '&';
        }
        if ((model as any)[key]) {
          query += key + "=" + encodeURIComponent((model as any)[key]);
        }
      }
    }

    const cars: CarModel[] = await (await fetch('http://localhost:61051/api/car?' + query)).json();
    this.setState({ cars });
  }
}

