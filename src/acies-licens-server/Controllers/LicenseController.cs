using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace acies_licens_server.Controllers
{
    [Route("api/[controller]/[action]")]
    public class LicenseController : ControllerBase
    {
        // POST api/license/validatekey
        [HttpPost]
        public JsonResult ValidateKey([FromBody] LicenseKey licenseKey)
        {
            return new JsonResult(licenseKey);
        }
    }
}
