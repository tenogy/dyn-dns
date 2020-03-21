using Microsoft.AspNetCore.Mvc;

namespace Tenogy.Dns.Api.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class HealthController : ControllerBase
	{
		
		[HttpGet]
		public HealthState Get()
		{
			return new HealthState
			{
				Status = "healthy"
			};
		}
	}

	public class HealthState
	{
		public string Status { get; set; }
	}
}
