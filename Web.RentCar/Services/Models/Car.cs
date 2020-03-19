using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web.RentCar.Services.Models
{
    public class Car
    {
        public Guid Id { get; set; }

        public Guid MakeId { get; set; }

        public Guid ModelId { get; set; }

        public int Production { get; set; }

        public double EnginePower { get; set; }

        public int Gearbox { get; set; }

        public double LuggageCapacity { get; set; }

        public int SeatsCount { get; set; }

        public string Description { get; set; }

        public string Photo { get; set; }
    }
}
