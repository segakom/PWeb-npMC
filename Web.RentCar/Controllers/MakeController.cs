using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Web.RentCar.Models;
using Web.RentCar.Services;

namespace Web.RentCar.Controllers
{
    [Produces("application/json")]
    [Route("api/Make")]
    public class MakeController : Controller
    {
        private readonly WarehouseService warehouseService;

        public MakeController(WarehouseService warehouseService)
        {
            this.warehouseService = warehouseService;
        }

        [HttpGet]
        public IEnumerable<MakeViewModel> Get()
        {
            return warehouseService.GetMakes().Select(model => new MakeViewModel()
            {
                Id = model.Id,
                Name = model.Name
            });
        }
    }
}