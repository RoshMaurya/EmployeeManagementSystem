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
    [Route("api/Project")]
    [ApiController]
    public class ProjectController : ControllerBase
    {
        private readonly IProjectRepository _projectRepo;
        public ProjectController(IProjectRepository projectRepo)
        {
            _projectRepo = projectRepo;
        }
        [HttpGet]
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

        [HttpGet("{PId}", Name = "ProjectById")]
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

        [HttpPost]
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


        [HttpPut]
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

        [HttpDelete("{PId}")]
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
    }
}
