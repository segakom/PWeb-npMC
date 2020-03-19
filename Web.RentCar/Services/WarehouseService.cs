using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.RentCar.Repositories;
using Web.RentCar.Services.Models;
using DBContract = Web.RentCar.Repositories.Models;

namespace Web.RentCar.Services
{
    public class WarehouseService
    {
        private readonly MakeRepository makeRepository;
        private readonly ModelRepository modelRepository;
        private readonly CarRepository carRepository;

        public WarehouseService(MakeRepository makeRepository, ModelRepository modelRepository, CarRepository carRepository)
        {
            this.makeRepository = makeRepository;
            this.modelRepository = modelRepository;
            this.carRepository = carRepository;
        }

        public IEnumerable<Make> GetMakes()
        {
            return makeRepository.Get().Select(model => new Make()
            {
                Id = model.Id,
                Name = model.Name
            });
        }

        public IEnumerable<Model> GetModels()
        {
            return modelRepository.Get().Select(model => new Model()
            {
                Id = model.Id,
                Name = model.Name
            });
        }

        public IEnumerable<Car> GetCars(CarSearchQuery searchQuery)
        {
            var query = new DBContract.CarSearchQuery()
            {
                FromEnginePower = searchQuery.FromEnginePower,
                FromLuggageCapacity = searchQuery.FromLuggageCapacity,
                FromProduction = searchQuery.FromProduction,
                Gearbox = searchQuery.Gearbox,
                MakeId = searchQuery.MakeId,
                MaxSeatsCount = searchQuery.MaxSeatsCount,
                MinSeatsCount = searchQuery.MinSeatsCount,
                ModelId = searchQuery.ModelId,
                ToEnginePower = searchQuery.ToEnginePower,
                ToLuggageCapacity = searchQuery.ToLuggageCapacity,
                ToProduction = searchQuery.ToProduction
            };

            return carRepository.GetCarsByQuery(query)
                .Select(model => new Car()
                {
                    Id = model.Id,
                    ModelId = model.ModelId,
                    MakeId = model.MakeId,
                    Description = model.Description,
                    EnginePower = model.EnginePower,
                    Gearbox = model.Gearbox,
                    LuggageCapacity = model.LuggageCapacity,
                    Photo = model.Photo,
                    Production = model.Production,
                    SeatsCount = model.SeatsCount
                });
        }
    }
}
