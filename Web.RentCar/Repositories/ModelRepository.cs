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
    public class ModelRepository
    {
        private const string GetByIdQuery = "SELECT [Id], [Name] FROM [Models] WHERE [Id] = @Id";
        private const string GetQuery = "SELECT [Id], [Name] FROM [Models]";

        private readonly ConnectionString connectionString;

        public ModelRepository(ConnectionString connectionString)
        {
            this.connectionString = connectionString;
        }

        public Model GetById(Guid id)
        {
            using (var connection = new SqlConnection(connectionString.CommonDatabase))
            {
                return connection.QueryFirstOrDefault<Model>(GetByIdQuery, new { Id = id });
            }
        }

        public IEnumerable<Model> Get()
        {
            using (var connection = new SqlConnection(connectionString.CommonDatabase))
            {
                return connection.Query<Model>(GetQuery).ToList();
            }
        }
    }
}
