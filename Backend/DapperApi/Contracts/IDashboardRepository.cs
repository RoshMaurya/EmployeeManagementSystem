using DapperApi.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Contracts
{
    public interface IDashboardRepository
    {
        public Task<IEnumerable<Dashboard>> GetAgeGroup();

        public Task<IEnumerable<Dashboard>> GetGender();

        public Task<IEnumerable<Dashboard>> GetDepartment();

        public Task<IEnumerable<Dashboard>> GetPosition();
    }
}
