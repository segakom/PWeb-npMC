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
    public class MakeRepository
    {
        private const string GetByIdQuery = "SELECT [Id], [Name] FROM [Makes] WHERE [Id] = @Id";
        private const string GetQuery = "SELECT [Id], [Name] FROM [Makes]";

        private readonly ConnectionString connectionString;

        public MakeRepository(ConnectionString connectionString)
        {
            this.connectionString = connectionString;
        }

        public Make GetById(Guid id)
        {
            using (var connection = new SqlConnection(connectionString.CommonDatabase))
            {
                return connection.QueryFirstOrDefault<Make>(GetByIdQuery, new { Id = id });
            }
        }

        public IEnumerable<Make> Get()
        {
            using (var connection = new SqlConnection(connectionString.CommonDatabase))
            {
                return connection.Query<Make>(GetQuery).ToList();
            }

        }
    }
}
