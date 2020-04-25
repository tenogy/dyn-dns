using System;
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
				Status = "healthy",
				Version = Environment.GetEnvironmentVariable("APP_VERSION")
			};
		}
	}

	public class HealthState
	{
		public string Status { get; set; }
		public string Version { get; set; }
	}
}
