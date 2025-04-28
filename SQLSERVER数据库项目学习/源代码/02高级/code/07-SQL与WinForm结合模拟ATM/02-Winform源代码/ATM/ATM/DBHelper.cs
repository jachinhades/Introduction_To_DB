using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ATM
{
    class DBHelper
    {
        //public static string connStr = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=DBTEST;Data Source=.";
        public static string connStr = ConfigurationManager.ConnectionStrings["DefaultConn"].ConnectionString;
        public static SqlConnection conn = null;
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

        #region 准备执行一个断开模式查询
        //准备执行SQL语句
        public static void PrepareSql(string sql)
        {
            OpenConn(); //打开数据库连接
            adp = new SqlDataAdapter(sql, conn);
        }
        //准备执行存储过程
        public static void PrepareProc(string sql)
        {
            OpenConn(); //打开数据库连接
            adp = new SqlDataAdapter(sql, conn);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
        }
        #endregion

        #region 设置和获取sql语句的参数(查询)
        //设置传入参数
        public static void SetParameter(string parameterName, object parameterValue)
        {
            parameterName = "@" + parameterName.Trim();
            if (parameterValue == null)
                parameterValue = DBNull.Value;
            adp.SelectCommand.Parameters.Add(new SqlParameter(parameterName, parameterValue));
        }
        //设置输出参数（不指定长度，适合非字符串）
        public static void SetOutParameter(string parameterName, SqlDbType dbType)
        {
            parameterName = "@" + parameterName.Trim();
            SqlParameter parameter = new SqlParameter(parameterName, dbType);
            parameter.Direction = ParameterDirection.Output;
            adp.SelectCommand.Parameters.Add(parameter);
        }
        //设置输出参数（指定长度，适合字符串）
        public static void SetOutParameter(string parameterName, SqlDbType dbType, int size)
        {
            parameterName = "@" + parameterName.Trim();
            SqlParameter parameter = new SqlParameter(parameterName, dbType, size);
            parameter.Direction = ParameterDirection.Output;
            adp.SelectCommand.Parameters.Add(parameter);
        }
        //设置返回值参数
        public static void SetReturnParameter(string parameterName)
        {
            parameterName = "@" + parameterName.Trim();
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = parameterName;
            parameter.Direction = ParameterDirection.ReturnValue;
            adp.SelectCommand.Parameters.Add(parameter);
        }
        //获取参数内容值
        public static object GetParameter(string parameterName)
        {
            parameterName = "@" + parameterName.Trim();
            return adp.SelectCommand.Parameters[parameterName].Value;
        }
        #endregion

        #region 执行非查询语句
        public static int ExecNonQuery()
        {
            int result = adp.SelectCommand.ExecuteNonQuery();
            conn.Close();
            return result;
        }
        #endregion

        #region 执行查询语句返回DataTable
        public static DataTable ExecQuery()
        {
            DataTable dt = new DataTable();
            adp.Fill(dt);
            conn.Close();
            return dt;
        }
        #endregion

        #region 执行查询语句返回DataReader
        public static SqlDataReader ExecDataReader()
        {
            return adp.SelectCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }
        #endregion

        #region 执行一个查询的sql语句，返回第一行第一列的值
        public static object ExecScalar()
        {
            object obj = adp.SelectCommand.ExecuteScalar();
            conn.Close();
            return obj;
        }
        #endregion

    }
}
