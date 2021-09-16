using DapperApi.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Controllers
{
    [Route("api/[controller]/[Action]")]
    [ApiController]

    public class DashboardController : ControllerBase
    {
        private readonly IDashboardRepository _dashboardRepo;
        public DashboardController(IDashboardRepository dashRepo)
        {
            _dashboardRepo = dashRepo;
        }
        [HttpGet]
        [ActionName("GetAgeGroup")]
        public async Task<IActionResult> GetAgeGroup()
        {
            try
            {
                var ages = await _dashboardRepo.GetAgeGroup();
                return Ok(ages);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [ActionName("GetGender")]
        public async Task<IActionResult> GetGender()
        {
            try
            {
                var gender = await _dashboardRepo.GetGender();
                return Ok(gender);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        
        [HttpGet]
        [ActionName("GetDepartment")]
        public async Task<IActionResult> GetDepartment()
        {
            try
            {
                var dept = await _dashboardRepo.GetDepartment();
                return Ok(dept);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [ActionName("GetPosition")]

        public async Task<IActionResult> GetPosition()
        {
            try
            {
                var positions = await _dashboardRepo.GetPosition();
                return Ok(positions);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }
    }
}
