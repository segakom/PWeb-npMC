import * as React from 'react';
import { CarModel } from '@app/models/car-model';

interface IContentItemProps {
  car: CarModel;
  makes: Array<{ name: string; id: string }>;
  models: Array<{ name: string; id: string }>;
}

export const ContentItem: React.FC<IContentItemProps> = (props) => {
  const {
    description,
    photo,
    makeId,
    modelId,
    production,
    enginePower,
    luggageCapacity,
    seatsCount,
  } = props.car;

  const model = props.models.find((x) => x.id === modelId);
  const make = props.makes.find((x) => x.id === makeId);

  return (
    <div className="c-content-item">
      <div className="c-content-item--info">
        <div className="c-content-item--photo" style={{ backgroundImage: `url(${photo})` }} />
        <div className="c-content-item--data">
          <div>Марка автомабиля</div>
          <div>{make && make.name}</div>
          <div>Класс</div>
          <div>{model && model.name}</div>
          <div>Год Выпуска</div>
          <div>{production}</div>
          <div>Двигатель</div>
          <div>{enginePower}л.с.</div>
          <div>Вметсительность багажника</div>
          <div>{luggageCapacity}</div>
          <div>Сидений</div>
          <div>{seatsCount}</div>
        </div>
      </div>
      <div className="c-content-item--description">
        {description}
      </div>
    </div>
  );
};
