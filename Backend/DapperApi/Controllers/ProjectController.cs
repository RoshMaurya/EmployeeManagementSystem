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
    [Route("Api/[Controller]/")]
    [ApiController]
    public class ProjectController : ControllerBase
    {
        private readonly IProjectRepository _projectRepo;
        public ProjectController(IProjectRepository projectRepo)
        {
            _projectRepo = projectRepo;
        }

        [HttpGet("GetProject/")]
        //[ActionName("GetProject")]
        public async Task<IActionResult> GetProject()
        {
            try
            {
                var Project = await _projectRepo.GetProject();
                return Ok(Project);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("GetProjectById/{PId}")]
        //[ActionName("GetProjectById")]
        public async Task<IActionResult> GetProject(string PId)
        {
            try
            {
                var Project = await _projectRepo.GetProject(PId);
                if (Project == null)
                    return NotFound($"No Project Found with Project Id: {PId}.");

                return Ok(Project);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        //[ActionName("GetProjectByName")]
        [HttpGet("GetProjectByName/{PName}")]
        public async Task<IActionResult> GetProjectByName(string PName)
        {
            try
            {
                var project = await _projectRepo.GetProjectByName(PName);
                return Ok(project);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("AddProject/")]
        //[ActionName("AddProject")]
        public async Task<IActionResult> AddProject(Project project)
        {
            try
            {
                var Project = await _projectRepo.AddProject(project);
                return Ok($"Sucessfully Added Project Details with Id: { project.PId}.");
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }


        [HttpPut("UpdateProject/")]
        //[ActionName("UpdateProject")]
        public async Task<IActionResult> UpdateProject(Project project)
        {
            try
            {
                var dbProject = await _projectRepo.GetProject(project.PId);
                if (dbProject == null)
                    return NotFound($"No Project Found with Project Id: {project.PId}.");
                await _projectRepo.UpdateProject(project);
                return Ok($"Sucessfully Updated Project Details with Id: { project.PId}.");
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("DeleteProject/{PId}")]
        //[ActionName("DeleteProject")]
        public async Task<IActionResult> DeleteProject(string PId)
        {
            try
            {
                var dbProject = await _projectRepo.GetProject(PId);
                if (dbProject == null)
                    return NotFound($"No Project Found with Project Id: {PId}.");
                await _projectRepo.DeleteProject(PId);
                return Ok($"Sucessfully Deleted Project Details with Id: {PId}.");
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        //Add Project to Employee
        [HttpPost("AEmpProject/")]
        //[ActionName("AEmpProject")]
        public async Task<IActionResult> AEmpProject(EmpProject project)
        {
            try
            {
                var Project = await _projectRepo.AEmpProject(project);
                return Ok($"Sucessfully Added Employee to with Project Details: { project.PId}.");
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        //For getting project 
        [HttpGet("GetEmpProject/{PId}")]
        //[ActionName("GetEmpProject")]
        public async Task<IActionResult> GetEmpProject(string PId)
        {
            try
            {
                var Project = await _projectRepo.GetEmpProject(PId);
                return Ok(Project);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("GetEmpNotProject")]
        //[ActionName("GetEmpNotProject")]
        public async Task<IActionResult> GetEmpNotProject()
        {
            try
            {
                var EmpList = await _projectRepo.GetEmpNotProject();
                return Ok(EmpList);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }
    }
}
