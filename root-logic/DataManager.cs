using Microsoft.Data.SqlClient;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace RootLogic
{
    public class DataManager
    {
        public DataManager()
        {
           
            SqlConnection connection = new SqlConnection("Data Source=localhost,1433;Initial Catalog=leave;Persist Security Info=True;User ID=sa;Password=AdminAdmin1!;Trust Server Certificate=True");
        }
    }
}
