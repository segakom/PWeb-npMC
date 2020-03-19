using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Web.RentCar.Models;
using Web.RentCar.Services;

namespace Web.RentCar.Controllers
{
    [Produces("application/json")]
    [Route("api/Model")]
    public class ModelController : Controller
    {
        private readonly WarehouseService warehouseService;

        public ModelController(WarehouseService warehouseService)
        {
            this.warehouseService = warehouseService;
        }

        [HttpGet]
        public IEnumerable<ModelViewModel> Get()
        {
            return warehouseService.GetModels().Select(model => new ModelViewModel()
            {
                Id = model.Id,
                Name = model.Name
            });
        }
    }
}