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
    public class ProjectRepository : IProjectRepository
    {
        private readonly DapperContext _context;
        public ProjectRepository(DapperContext context)
        {
            _context = context;
        }



        public async Task<IEnumerable<Project>> GetProject()
        {
            using (var connection = _context.CreateConnection())
            {
                var project = await connection.QueryAsync<Project>("GProject",
                    commandType: CommandType.StoredProcedure);
                List<Project> ProjectList = project.ToList();
                return ProjectList;
            }
        }

        public async Task<Project> GetProject(string PId)
        {
            using (var connection = _context.CreateConnection())
            {
                var Project = await connection.QuerySingleOrDefaultAsync<Project>("GProjectById",
                    new { PId },
                    commandType: CommandType.StoredProcedure);
                return Project;
            }
        }

        public async Task<IEnumerable<Project>> GetProjectByName(string PName)
        {
            using (var connection = _context.CreateConnection())
            {
                var project = await connection.QueryAsync<Project>("GProjectByName",
                    new { PName },
                    commandType: CommandType.StoredProcedure);
                List<Project> ProjectList = project.ToList();
                return ProjectList;
            }
        }

        public async Task<Project> AddProject(Project project)
        {
            var parameters = new DynamicParameters();
            parameters.Add("PId", project.PId, DbType.String);
            parameters.Add("PName", project.PName, DbType.String);
            parameters.Add("PDetail", project.PDetail, DbType.String);
            parameters.Add("SupervisorEmployeeId", project.SupervisorEmployeeId, DbType.Int32);
            using (var connection = _context.CreateConnection())
            {
                var Project = await connection.QuerySingleOrDefaultAsync<Project>("AProject",parameters,
                    commandType: CommandType.StoredProcedure);
                return Project;
                
            }

        }

        public async Task UpdateProject(Project project)
        {
            var parameters = new DynamicParameters();
            parameters.Add("PId", project.PId, DbType.String);
            parameters.Add("PName", project.PName, DbType.String);
            parameters.Add("PDetail", project.PDetail, DbType.String);
            parameters.Add("SupervisorEmployeeId", project.SupervisorEmployeeId, DbType.Int32);
            using (var connection = _context.CreateConnection())
            {
                await connection.ExecuteAsync("UProject",parameters,
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task DeleteProject(string PId)
        {
            using (var connection = _context.CreateConnection())
            {
                await connection.ExecuteAsync("DProject",new { PId },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<EmpProject> AEmpProject(EmpProject project)
        {
            var parameters = new DynamicParameters();
            parameters.Add("PId", project.PId, DbType.String);
            parameters.Add("EmployeeId", project.EmployeeId, DbType.Int32);
            using (var connection = _context.CreateConnection())
            {
                var Project = await connection.QuerySingleOrDefaultAsync<EmpProject>("AEmpProject", parameters,
                    commandType: CommandType.StoredProcedure);
                return Project;
            }
        }

        public async Task<IEnumerable<EmpProject>> GetEmpProject(string PId)
        {
            using (var connection = _context.CreateConnection())
            {
                var project = await connection.QueryAsync<EmpProject>("VEmpProject",
                    new { PId },
                    commandType: CommandType.StoredProcedure);
                List<EmpProject> ProjectList = project.ToList();
                return ProjectList;
            }
        }

        public async Task<IEnumerable<EmpProject>> GetEmpNotProject()
        {
            using (var connection = _context.CreateConnection())
            {
                var project = await connection.QueryAsync<EmpProject>("VEmpNotProject",
                    commandType: CommandType.StoredProcedure);
                List<EmpProject> EmployeeList = project.ToList();
                return EmployeeList;
            }
        }
    }
}
