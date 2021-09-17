using DapperApi.Entities.Dashboard;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Contracts
{
    public interface IDashboardRepository
    {
        public Task<IEnumerable<DAgeGroup>> GetAgeGroup();

        public Task<IEnumerable<DGender>> GetGender();

        public Task<IEnumerable<DDepartment>> GetDepartment();

        public Task<IEnumerable<DPosition>> GetPosition();
    }
}
