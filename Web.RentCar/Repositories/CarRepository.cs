using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Web.RentCar.Repositories.Models;
using Web.RentCar.Repositories.Options;

namespace Web.RentCar.Repositories
{
    public class CarRepository
    {
        private const string searchCarQuery = @"SELECT [Id],[MakeId],[ModelId],[Production],[EnginePower],[Gearbox],
                                                [LuggageCapacity],[SeatsCount],[Description],[Photo] FROM [Cars]";

        private readonly ConnectionString connectionString;

        public CarRepository(ConnectionString connectionString)
        {
            this.connectionString = connectionString;
        }

        public IEnumerable<Car> GetCarsByQuery(CarSearchQuery query)
        {
            var sqlQuery = searchCarQuery;

            List<string> conditions = new List<string>
            {
                query.FromEnginePower != null ? $"[EnginePower] >= {query.FromEnginePower}" : string.Empty,
                query.ToEnginePower != null ? $"[EnginePower] <= {query.ToEnginePower}" : string.Empty,

                query.FromLuggageCapacity != null ? $"[LuggageCapacity] >= {query.FromLuggageCapacity}" : string.Empty,
                query.ToLuggageCapacity != null ? $"[LuggageCapacity] <= {query.ToLuggageCapacity}" : string.Empty,

                query.FromProduction != null ? $"[Production] >= {query.FromProduction}" : string.Empty,
                query.ToProduction != null ? $"[Production] <= {query.ToProduction}" : string.Empty,

                query.MinSeatsCount != null ? $"[SeatsCount] >= {query.MinSeatsCount}" : string.Empty,
                query.MaxSeatsCount != null ? $"[SeatsCount] <= {query.MaxSeatsCount}" : string.Empty,

                query.MakeId != null ? $"[MakeId] = '{query.MakeId}'" : string.Empty,

                query.ModelId != null ? $"[ModelId] = '{query.ModelId}'" : string.Empty,

                //query.Gearbox.Count() > 0 ? $"[Gearbox] IN ({String.Join(',', query.Gearbox.Select(x => x.ToString()))})" : string.Empty
            };

            conditions = conditions.Where(subquery => subquery != string.Empty).ToList();

            if (conditions.Count > 0)
            {
                sqlQuery += " WHERE " + String.Join(" AND ", conditions);
            }

            using (var connection = new SqlConnection(connectionString.CommonDatabase))
            {
                return connection.Query<Car>(sqlQuery);
            }
        }

    }
}
