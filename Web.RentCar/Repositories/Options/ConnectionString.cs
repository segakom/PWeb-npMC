namespace Web.RentCar.Repositories.Options
{
    public class ConnectionString
    {
        public ConnectionString(string commonDatabase)
        {
            this.CommonDatabase = commonDatabase;
        }

        public string CommonDatabase { get; private set; }
    }
}
