using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace AdventuresCRUD_Lundeen
{
    public static class dbAccess
    {
        public static string getConnection()
        {
            string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            return conn;
        }
    }
}