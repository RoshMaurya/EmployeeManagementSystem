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
    public class LoginRepository : ILoginRepository
    {
        private readonly DapperContext _context;
        public LoginRepository(DapperContext context)
        {
            _context = context;
        }


        public async Task<Login> GetValidation(Login credential)
        {
            var parameters = new DynamicParameters();
            parameters.Add("Username", credential.Username, DbType.String);
            parameters.Add("Password", credential.Password, DbType.String);
            using (var connection = _context.CreateConnection())
            {
                var command = new SqlCommand("GetIslemIdleri") ;
                var result = await connection.QuerySingleOrDefaultAsync<Login>("PROC_Login", 
                    parameters,commandType: CommandType.StoredProcedure);
                return result;
            }
        }
    }
}
