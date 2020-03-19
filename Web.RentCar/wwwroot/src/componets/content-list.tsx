import * as React from 'react';
import { CarModel } from '@app/models/car-model';
import { ContentItem } from './content-item';

interface IContentListProps {
  cars: CarModel[];
  makes: Array<{ name: string; id: string }>;
  models: Array<{ name: string; id: string }>;
}

export const ContentList: React.FC<IContentListProps> = ({ cars, makes, models }) => {
  return (
    <div>
      {cars.map((car) => <ContentItem
        key={car.id}
        makes={makes}
        models={models}
        car={car} />)}
    </div>
  );
};
