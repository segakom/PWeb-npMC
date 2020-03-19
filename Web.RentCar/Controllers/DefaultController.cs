using Microsoft.AspNetCore.Mvc;

namespace Web.RentCar.Controllers
{
    [Route("")]
    public class DefaultController : Controller
    {
        public IActionResult Index()
        {
            return File("~/dist/index.html", "text/html");
        }
    }
}