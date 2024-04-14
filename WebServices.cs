using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

[WebService(Namespace ="http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

[System.Web.Script.Services.ScriptService]
public class WebService: System.Web.Services.WebService
{
    [WebMethod]
    public List<string> GetSearch(string Name)
    {
        //string cs;
        List<string> names = new List<string>();
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("NameSearch", con);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parameter = new SqlParameter("@Name", Name);
        cmd.Parameters.Add(parameter);

        con.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            names.Add(reader["Name"].ToString());
        }
        return names;
    }
}