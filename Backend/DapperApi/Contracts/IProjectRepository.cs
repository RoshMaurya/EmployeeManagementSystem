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
        public Task<Project> AddProject(Project project);
        public Task UpdateProject(Project project);
        public Task DeleteProject(string PId);


    }
}
