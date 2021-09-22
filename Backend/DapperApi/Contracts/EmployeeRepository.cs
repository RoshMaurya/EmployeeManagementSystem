using Dapper;
using DapperApi.Context;
using DapperApi.Entities;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Contracts
{
    public class EmployeeRepository : IEmployeeRepository
    {
        private readonly DapperContext _context;
        public EmployeeRepository(DapperContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Employee>> GetEmployee()
        {
            using (var connection = _context.CreateConnection())
            {
                var employees = await connection.QueryAsync<Employee>("GEmployee",
                    commandType: CommandType.StoredProcedure);
                List<Employee> EmployeeList = employees.ToList();
                return EmployeeList;
            }
        }

        public async Task<Employee> GetEmployee(int EmployeeId)
        {
            using (var connection = _context.CreateConnection())
            {
                var employee = await connection.QuerySingleOrDefaultAsync<Employee>("GEmployeeById",
                    new { EmployeeId },
                    commandType: CommandType.StoredProcedure);
                return employee;
            }
        }

        public async Task<IEnumerable<Employee>> GetEmployee(string EName)
        {
            using (var connection = _context.CreateConnection())
            {
                var employees = await connection.QueryAsync<Employee>("GEmployeeByName",
                    new { EName },
                    commandType: CommandType.StoredProcedure);
                List<Employee> EmployeeList = employees.ToList();
                return EmployeeList;
            }
        }

        public async Task<AEmployee> AddEmployee(AEmployee employee)
        {
            var parameters = new DynamicParameters();
            parameters.Add("FName", employee.FName, DbType.String);
            parameters.Add("LName", employee.LName, DbType.String);
            parameters.Add("Gender", employee.Gender, DbType.String);
            DateTime dob;
            DateTime.TryParse(employee.DateOfBirth.Trim(), out dob);
            DateTime doj;
            DateTime.TryParse(employee.DateJoined.Trim(), out doj);
            parameters.Add("DateOfBirth", dob, DbType.Date);
            parameters.Add("DateJoined", doj, DbType.Date);
            parameters.Add("Email", employee.Email, DbType.String);
            parameters.Add("Street", employee.Street, DbType.String);
            parameters.Add("Phone", employee.Phone, DbType.String);
            parameters.Add("City", employee.City, DbType.String);
            parameters.Add("State", employee.State, DbType.String);
            parameters.Add("ZipCode", employee.ZipCode, DbType.String);
            parameters.Add("Code", employee.Code, DbType.String);

            using (var connection = _context.CreateConnection())
            {      
                var Addedemployee = await connection.QuerySingleOrDefaultAsync<AEmployee>("AEmployee",
                    parameters,commandType: CommandType.StoredProcedure);
                return Addedemployee;
            }
        }

        public async Task UpdateEmployee(Employee employee)
        {
            var parameters = new DynamicParameters();
            parameters.Add("EmployeeId", employee.EmployeeId, DbType.Int32);
            parameters.Add("FName", employee.FName, DbType.String);
            parameters.Add("LName", employee.LName, DbType.String);
            parameters.Add("Gender", employee.Gender, DbType.String);
            DateTime dob;
            DateTime.TryParse(employee.DateOfBirth.Trim(), out dob);
            DateTime doj;
            DateTime.TryParse(employee.DateJoined.Trim(), out doj);
            parameters.Add("DateOfBirth", dob, DbType.Date);
            parameters.Add("DateJoined", doj, DbType.Date);
            parameters.Add("Email", employee.Email, DbType.String);
            parameters.Add("Street", employee.Street, DbType.String);
            parameters.Add("Phone", employee.Phone, DbType.String);
            parameters.Add("City", employee.City, DbType.String);
            parameters.Add("State", employee.State, DbType.String);
            parameters.Add("ZipCode", employee.ZipCode, DbType.String);
            parameters.Add("Code", employee.Code, DbType.String);
            using (var connection = _context.CreateConnection())
            {
                await connection.ExecuteAsync("UEmployee",parameters,
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task DeleteEmployee(int EmployeeId)
        {
            using (var connection = _context.CreateConnection())
            {
                await connection.ExecuteAsync("DEmployee", new { EmployeeId },
                    commandType: CommandType.StoredProcedure);
            }
        }
    }
}
