using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web.RentCar.Models;
using Web.RentCar.Services;
using Web.RentCar.Services.Models;

namespace Web.RentCar.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    public class CarController : Controller
    {
        private readonly WarehouseService warehouseService;

        public CarController(WarehouseService warehouseService)
        {
            this.warehouseService = warehouseService;
        }

        [HttpGet]
        public IEnumerable<CarViewModel> Get(CarSearchQueryViewModel queryViewModel)
        {
            var query = new CarSearchQuery()
            {
                FromEnginePower = queryViewModel.FromEnginePower,
                FromLuggageCapacity = queryViewModel.FromLuggageCapacity,
                FromProduction = queryViewModel.FromProduction,
                Gearbox = queryViewModel.Gearbox,
                MakeId = queryViewModel.MakeId,
                MaxSeatsCount = queryViewModel.MaxSeatsCount,
                MinSeatsCount = queryViewModel.MinSeatsCount,
                ModelId = queryViewModel.ModelId,
                ToEnginePower = queryViewModel.ToEnginePower,
                ToLuggageCapacity = queryViewModel.ToLuggageCapacity,
                ToProduction = queryViewModel.ToProduction
            };

            return warehouseService.GetCars(query)
                .Select(model => new CarViewModel()
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

        // GET api/values/5
        [HttpGet("{id}")]
        public CarViewModel Get(Guid id)
        {
            return new CarViewModel();
        }

        //// POST api/values
        //[HttpPost]
        //public void Post([FromBody]CarViewModel value)
        //{
        //}

        //// PUT api/values/5
        //[HttpPut("{id}")]
        //public void Put(Guid id, [FromBody]CarViewModel value)
        //{
        //}

        //// DELETE api/values/5
        //[HttpDelete("{id}")]
        //public void Delete(Guid id)
        //{
        //}
    }
}
