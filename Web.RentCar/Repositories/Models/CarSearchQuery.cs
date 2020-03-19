using System;
using System.Collections.Generic;
using System.Linq;

namespace Web.RentCar.Repositories.Models
{
    public class CarSearchQuery
    {
        public Guid? MakeId { get; set; }

        public Guid? ModelId { get; set; }

        public int? FromProduction { get; set; }

        public int? ToProduction { get; set; }

        public double? FromEnginePower { get; set; }

        public double? ToEnginePower { get; set; }

        public IEnumerable<int> Gearbox { get; set; } = Enumerable.Empty<int>();

        public double? FromLuggageCapacity { get; set; }

        public double? ToLuggageCapacity { get; set; }

        public double? MaxSeatsCount { get; set; }

        public double? MinSeatsCount { get; set; }
    }
}
