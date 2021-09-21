using Dapper;
using DapperApi.Context;
using DapperApi.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Contracts
{
    public class DashboardRepository: IDashboardRepository
    {
        private readonly DapperContext _context;
        public DashboardRepository(DapperContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Dashboard>> GetAgeGroup()
        {
            using (var connection = _context.CreateConnection())
            {
                var AgeCount = await connection.QueryAsync<Dashboard>("EmployeeAge",
                    commandType: CommandType.StoredProcedure);
                List<Dashboard> AgeList = AgeCount.ToList();
                return AgeList;
            }
        }

        public async Task<IEnumerable<Dashboard>> GetGender()
        {
            using (var connection = _context.CreateConnection())
            {
                var Genders = await connection.QueryAsync<Dashboard>("EmployeeGender",
                    commandType: CommandType.StoredProcedure);
                List<Dashboard> GenderCount = Genders.ToList();
                return GenderCount;
            }
        }


        public async Task<IEnumerable<Dashboard>> GetDepartment()
        {
            using (var connection = _context.CreateConnection())
            {
                var Depts = await connection.QueryAsync<Dashboard>("EmployeeDept",
                    commandType: CommandType.StoredProcedure);
                List<Dashboard> DeptCount = Depts.ToList();
                return DeptCount;
            }
        }

        public async Task<IEnumerable<Dashboard>> GetPosition()
        {
            using (var connection = _context.CreateConnection())
            {
                var Positions = await connection.QueryAsync<Dashboard>("EmployeePosition",
                    commandType: CommandType.StoredProcedure);
                List<Dashboard> PositionCount = Positions.ToList();
                return PositionCount;
            }
        }



    }
}
