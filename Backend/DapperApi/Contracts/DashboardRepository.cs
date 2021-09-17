using Dapper;
using DapperApi.Context;
using DapperApi.Entities.Dashboard;
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

        public async Task<IEnumerable<DAgeGroup>> GetAgeGroup()
        {
            using (var connection = _context.CreateConnection())
            {
                var AgeCount = await connection.QueryAsync<DAgeGroup>("EmployeeAge",
                    commandType: CommandType.StoredProcedure);
                List<DAgeGroup> AgeList = AgeCount.ToList();
                return AgeList;
            }
        }

        public async Task<IEnumerable<DGender>> GetGender()
        {
            using (var connection = _context.CreateConnection())
            {
                var Genders = await connection.QueryAsync<DGender>("EmployeeGender",
                    commandType: CommandType.StoredProcedure);
                List<DGender> GenderCount = Genders.ToList();
                return GenderCount;
            }
        }


        public async Task<IEnumerable<DDepartment>> GetDepartment()
        {
            using (var connection = _context.CreateConnection())
            {
                var Depts = await connection.QueryAsync<DDepartment>("EmployeeDept",
                    commandType: CommandType.StoredProcedure);
                List<DDepartment> DeptCount = Depts.ToList();
                return DeptCount;
            }
        }

        public async Task<IEnumerable<DPosition>> GetPosition()
        {
            using (var connection = _context.CreateConnection())
            {
                var Positions = await connection.QueryAsync<DPosition>("EmployeePosition",
                    commandType: CommandType.StoredProcedure);
                List<DPosition> PositionCount = Positions.ToList();
                return PositionCount;
            }
        }



    }
}
