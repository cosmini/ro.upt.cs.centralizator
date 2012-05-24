package ro.upt.cs.centralizator.profesor;

import java.sql.ResultSet;
import java.sql.SQLException;

import ro.upt.cs.centralizator.db.DBConnection;

public class ProfesorDAO 
{
	protected DBConnection con=new DBConnection();
	
	public ProfesorDAO()
	{
	}
	
	public Profesor existNamePass(String szNume,String szParola)
	{
		int nId2;
		String szParola2;

  		String sql="SELECT id, parola FROM profesori WHERE nume='"+szNume+"'";
		try
	    {
			ResultSet rs=con.execQuery(sql);
		    if(rs.next())
		    {
		    	nId2=rs.getInt(1);
		    	szParola2=rs.getString(2);		    			    	
		    	
		    	if(szParola2.equals(szParola))
			    {
			    	return new Profesor(nId2,szNume); 
			    }
		    }			  
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 return null;		
	}

	public int existsProfesor(String szNume)
	{
		int nId;
		String sql=
			"SELECT id FROM profesori WHERE nume='"+szNume+"'";
		try
	    {
			ResultSet rs=con.execQuery(sql);
		    if(rs.next())
		    {
		    	nId=rs.getInt(1);
			    return nId; 
		    }			  
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 return -1;		
	}
	
	public int adauga(Profesor profesor)
	{
		int nResult;		
		String sql=
			"INSERT INTO profesori "+
			"(nume,parola) "+
			"VALUES ('"+profesor.getNume()+"','"+profesor.getParola()+"')";
  		nResult=con.execUpdate(sql);
		return nResult;
	}
	
	public int schimbaParola(Profesor profesor, String parola)
	{
		int nResult;		
		String sql=
			"UPDATE profesori SET parola='" + parola + "'" +
			" WHERE id=" + profesor.getId();
  		nResult=con.execUpdate(sql);
		return nResult;
	}	
}
