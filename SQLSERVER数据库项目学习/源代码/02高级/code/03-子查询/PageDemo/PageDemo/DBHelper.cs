using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace PageDemo
{
    class DBHelper
    {
        //2个字段+3个方法
        //22个字段:(1)连接字符串 （2）连接对象
        //3个方法:(1)打开连接 （2）执行非查询语句 (3)执行查询语句

        //public static string connStr = "server=.;database=DBName;uid=sa;pwd=123456;";
        public static string connStr = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=DB1701;Data Source=.";
        
        public static SqlConnection conn = null;

        public static void OpenConn()
        {
            if (conn == null)
            {
                conn = new SqlConnection(connStr);
                conn.Open();
            }
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            if (conn.State == System.Data.ConnectionState.Broken)
            {
                conn.Close();
                conn.Open();
            }
        }

        public static int ExecNonQuery(string sql)
        {
            OpenConn();
            SqlCommand cmd = new SqlCommand(sql, conn);
            int result = cmd.ExecuteNonQuery();
            conn.Close();
            return result;
        }

        public static DataTable ExecQuery(string sql)
        {
            OpenConn();
            SqlDataAdapter adp = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            conn.Close();
            return dt;
        }

        public static SqlDataReader ExecReader(string sqlStr)
        {
            OpenConn();
            SqlCommand cmd = new SqlCommand(sqlStr, conn);
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }

        public static object ExecScalar(string sqlStr)
        {
            OpenConn();
            SqlCommand cmd = new SqlCommand(sqlStr, conn);
            object obj = cmd.ExecuteScalar();
            conn.Close();
            return obj;
        }

    }
}
