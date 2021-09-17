using DapperApi.Contracts;
using DapperApi.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Controllers
{
    [Route("Api/[Controller]/[action]")]
    [ApiController]
    public class EmployeesController : ControllerBase
    {
        private readonly IEmployeeRepository _employeeRepo;
        public EmployeesController(IEmployeeRepository employeeRepo)
        {
            _employeeRepo = employeeRepo;
        }

        [ActionName("GetEmployees")]
        [HttpGet]
        public async Task<IActionResult> GetEmployees()
        {
            try
            {
                var employees = await _employeeRepo.GetEmployee();
                return Ok(employees);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [ActionName("GetEmployeeById")]
        [HttpGet("{id}", Name = "EmployeeById")]
        public async Task<IActionResult> GetEmployee(int id)
        {
            try
            {
                var employee = await _employeeRepo.GetEmployee(id);
                if (employee == null)
                    return NotFound($"No Employee with Id: {id}.");
                return Ok(employee);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [ActionName("GetEmployeeByName")]
        [HttpGet("{EName}", Name = "EmployeeByName")]
        public async Task<IActionResult> GetEmployee(string EName)
        {
            try
            {
                var employee = await _employeeRepo.GetEmployee(EName);
                return Ok(employee);
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [ActionName("AddEmployee")]
        [HttpPost]
        public async Task<IActionResult> AddEmployee(Employee employee)
        {
            try
            {
                await _employeeRepo.AddEmployee(employee);
                return Ok($"Sucessfully Added Employee Details with Id: {employee.EmployeeId}.");
                
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [ActionName("UpdateEmployee")]
        [HttpPut]
        public async Task<IActionResult> UpdateEmployee(Employee employee)
        {
            try
            {
                var dbEmployee = await _employeeRepo.GetEmployee(employee.EmployeeId);
                if (dbEmployee == null)
                   return NotFound($"No Employee Found with Employee Id: {employee.EmployeeId}.");
                await _employeeRepo.UpdateEmployee(employee);
                return Ok($"Sucessfully Updated Employee Details with Id: {employee.EmployeeId}.");
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }

        [ActionName("DeleteEmployee")]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCompany(int id)
        {
            try
            {
                var dbCompany = await _employeeRepo.GetEmployee(id);
                if (dbCompany == null)
                    return NotFound($"No Employee Found with Employee Id: {id}.");
                await _employeeRepo.DeleteEmployee(id);
                return Ok($"Sucessfully Deleted Employee Details with Id: {id}.");
            }
            catch (Exception ex)
            {
                //log error
                return BadRequest(ex.Message);
            }
        }
    }
}
