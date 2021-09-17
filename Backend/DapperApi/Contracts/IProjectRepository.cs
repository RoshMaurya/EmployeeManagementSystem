using DapperApi.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Contracts
{
   public interface IProjectRepository
    {
        public Task<IEnumerable<Project>> GetProject();
        public Task<Project> GetProject(string PId);
        public Task<IEnumerable<Project>> GetProjectByName(string EName);
        public Task<Project> AddProject(Project project);
        public Task UpdateProject(Project project);
        public Task DeleteProject(string PId);
        public Task<EmpProject> AEmpProject(EmpProject project);
        public Task<IEnumerable<EmpProject>> GetEmpProject(string PId);
        public Task<IEnumerable<EmpProject>> GetEmpNotProject();

    }
}
