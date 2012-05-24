package ro.upt.cs.centralizator.db;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection
{
	protected String szDriver="com.mysql.jdbc.Driver";
	protected String szURL="jdbc:mysql://localhost:3306/centralizator";
  	protected String szUser="root";
  	protected String szPass="";
  
  	protected java.sql.Connection connection;

  	public DBConnection()
  	{
  	}

  	private void openConnection()
	{
	    try
	    {
	    	Class.forName(szDriver);
	    	connection=DriverManager.getConnection(szURL,szUser,szPass);
	    }
	    catch(ClassNotFoundException e)
	    {
	    	System.out.println("******Driverul nu a fost gasit\n" + e.getMessage());
	    }
	    catch (SQLException e)
	    {
	    	System.out.println("**********SQLException\n" + e.getMessage());
	    }

	}
  
  	public void closeConnection()
  	{
	    try
	    {
	      connection.close();
	    }
	    catch(SQLException e)
	    {
	    	
	    }
  	}

  	private Statement createStatement() throws SQLException
  	{
  		openConnection();
  		return connection.createStatement();
  	}

  	public ResultSet execQuery(String sql)
  	{
  		ResultSet resultSet=null;
  		try
  		{
  			resultSet=createStatement().executeQuery(sql);
  		}
  		catch(SQLException e)
  		{
  			System.out.println("Caught SQL exception");
  			e.printStackTrace();
  		}
  		return resultSet;
  	}

  	public int execUpdate(String sql)
  	{
  		int nResult;
	    try
	    {
	    	nResult=createStatement().executeUpdate(sql);
	    }
	    catch(SQLException e)
	    {
	    	System.out.println("Caught SQL exception");
	    	e.printStackTrace();
	    	nResult=-1;
	    }
	    return nResult;
  	}
}
