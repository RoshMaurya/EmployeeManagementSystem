using DapperApi.Contracts;
using DapperApi.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly ILoginRepository _loginRepo;
        public LoginController(ILoginRepository loginRepo)
        {
            _loginRepo = loginRepo;
        }
        [HttpPost(Name = "LoginValidation")]
        public async Task<IActionResult> GetValidity(Login credential)
        {
            try
            {
                var validity =await _loginRepo.GetValidation(credential);
                if (validity == null)
                    return NotFound("Invalid Username & Password");
                return Ok(validity.Username);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }
    }
}
