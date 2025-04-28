using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Demo06
{
    class DBHelper
    {
        //public static string connStr = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=DBTEST;Data Source=.";
        public static string connStr = ConfigurationManager.ConnectionStrings["junjunConn"].ConnectionString;
        public static SqlConnection conn = null;
        public static SqlCommand cmd = null;
        public static SqlDataAdapter adp = null;

        #region 连接数据库
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
        #endregion

        #region 准备执行一个Command命令
        //准备执行SQL语句
        public static void PrepareCmd(string sql)
        {
            OpenConn(); //打开数据库连接
            cmd = new SqlCommand(sql, conn);
        }
        //准备执行存储过程
        public static void PrepareCmdProc(string sql)
        {
            OpenConn(); //打开数据库连接
            cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.StoredProcedure;
        }
        #endregion

        #region 准备执行一个断开模式查询
        //准备执行SQL语句
        public static void PrepareDataTable(string sql)
        {
            OpenConn(); //打开数据库连接
            adp = new SqlDataAdapter(sql, conn);
        }
        //准备执行存储过程
        public static void PrepareDataTableProc(string sql)
        {
            OpenConn(); //打开数据库连接
            adp = new SqlDataAdapter(sql, conn);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
        }
        #endregion

        #region 设置和获取sql语句的参数(非查询)
        //设置传入参数
        public static void SetCmdParameter(string parameterName, object parameterValue)
        {
            parameterName = "@" + parameterName.Trim();
            if (parameterValue == null)
                parameterValue = DBNull.Value;
            cmd.Parameters.Add(new SqlParameter(parameterName, parameterValue));
        }
        //设置输出参数（不指定长度，适合非字符串）
        public static void SetCmdOutParameter(string parameterName, SqlDbType dbType)
        {
            parameterName = "@" + parameterName.Trim();
            SqlParameter parameter = new SqlParameter(parameterName, dbType);
            parameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parameter);
        }
        //设置输出参数（指定长度，适合字符串）
        public static void SetCmdOutParameter(string parameterName, SqlDbType dbType, int size)
        {
            parameterName = "@" + parameterName.Trim();
            SqlParameter parameter = new SqlParameter(parameterName, dbType, size);
            parameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parameter);
        }
        //设置返回值参数
        public static void SetCmdReturnParameter(string parameterName)
        {
            parameterName = "@" + parameterName.Trim();
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = parameterName;
            parameter.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parameter);
        }
        //获取参数内容值
        public static object GetCmdParameter(string parameterName)
        {
            parameterName = "@" + parameterName.Trim();
            return cmd.Parameters[parameterName].Value;
        }
        #endregion

        #region 设置和获取sql语句的参数(查询)
        //设置传入参数
        public static void SetDataTableParameter(string parameterName, object parameterValue)
        {
            parameterName = "@" + parameterName.Trim();
            if (parameterValue == null)
                parameterValue = DBNull.Value;
            adp.SelectCommand.Parameters.Add(new SqlParameter(parameterName, parameterValue));
        }
        //设置输出参数（不指定长度，适合非字符串）
        public static void SetDataTableOutParameter(string parameterName, SqlDbType dbType)
        {
            parameterName = "@" + parameterName.Trim();
            SqlParameter parameter = new SqlParameter(parameterName, dbType);
            parameter.Direction = ParameterDirection.Output;
            adp.SelectCommand.Parameters.Add(parameter);
        }
        //设置输出参数（指定长度，适合字符串）
        public static void SetDataTableOutParameter(string parameterName, SqlDbType dbType, int size)
        {
            parameterName = "@" + parameterName.Trim();
            SqlParameter parameter = new SqlParameter(parameterName, dbType, size);
            parameter.Direction = ParameterDirection.Output;
            adp.SelectCommand.Parameters.Add(parameter);
        }
        //设置返回值参数
        public static void SetDataTableReturnParameter(string parameterName)
        {
            parameterName = "@" + parameterName.Trim();
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = parameterName;
            parameter.Direction = ParameterDirection.ReturnValue;
            adp.SelectCommand.Parameters.Add(parameter);
        }
        //获取参数内容值
        public static object GetDataTableParameter(string parameterName)
        {
            parameterName = "@" + parameterName.Trim();
            return adp.SelectCommand.Parameters[parameterName].Value;
        }
        #endregion

        #region 执行非查询语句
        public static int ExecCmd()
        {
            int result = cmd.ExecuteNonQuery();
            conn.Close();
            return result;
        }
        #endregion

        #region 执行查询语句返回DataTable
        public static DataTable ExecDataTable()
        {
            DataTable dt = new DataTable();
            adp.Fill(dt);
            conn.Close();
            return dt;
        }
        #endregion

        #region 执行查询语句返回DataReader
        public static SqlDataReader ExecCmdDataReader()
        {
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        #endregion

        #region 执行一个查询的sql语句，返回第一行第一列的值
        public static object ExecCmdScalar()
        {
            object obj = cmd.ExecuteScalar();
            conn.Close();
            return obj;
        }
        #endregion

    }
}
