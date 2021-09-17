using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DapperApi.Entities
{
    public class Project
    {
        public string PId{ get; set; }

        public string PName { get; set; }

        public string PDetail { get; set; }

        public string SupervisorEmployeeId { get; set; }


    }
}
