using DapperApi.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Contracts
{
    public interface IEmployeeRepository
    {
        public Task<IEnumerable<Employee>> GetEmployee();
        public Task<Employee> GetEmployee(int id);
        public Task<IEnumerable<Employee>> GetEmployee(string EName);
        public Task<Employee> AddEmployee(Employee employee);
        public Task UpdateEmployee(Employee employee);
        public Task DeleteEmployee(int id);
    }
}
