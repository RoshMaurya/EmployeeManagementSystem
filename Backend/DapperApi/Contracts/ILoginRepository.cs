using DapperApi.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Contracts
{
    public interface ILoginRepository
    {
        public Task<Login> GetValidation(Login credential);
        

    }
}
