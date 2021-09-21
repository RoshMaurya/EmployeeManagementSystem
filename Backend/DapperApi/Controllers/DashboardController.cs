using DapperApi.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Controllers
{
    [Route("api/[controller]/")]
    [ApiController]

    public class DashboardController : ControllerBase
    {
        private readonly IDashboardRepository _dashboardRepo;
        public DashboardController(IDashboardRepository dashRepo)
        {
            _dashboardRepo = dashRepo;
        }
        [HttpGet("GetAgeGroup/")]
        public async Task<IActionResult> GetAgeGroup()
        {
            try
            {
                var AgeList = await _dashboardRepo.GetAgeGroup();
                return Ok(AgeList);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("GetGender/")]
        public async Task<IActionResult> GetGender()
        {
            try
            {
                var GenderCount = await _dashboardRepo.GetGender();
                return Ok(GenderCount);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        
        [HttpGet("GetDepartment/")]
        public async Task<IActionResult> GetDepartment()
        {
            try
            {
                var DeptCount = await _dashboardRepo.GetDepartment();
                return Ok(DeptCount);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("GetPosition/")]
        public async Task<IActionResult> GetPosition()
        {
            try
            {
                var PositionCount = await _dashboardRepo.GetPosition();
                return Ok(PositionCount);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }
    }
}
