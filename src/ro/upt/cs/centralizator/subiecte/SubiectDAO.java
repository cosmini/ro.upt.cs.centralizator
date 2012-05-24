package ro.upt.cs.centralizator.subiecte;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ro.upt.cs.centralizator.db.DBConnection;
import ro.upt.cs.centralizator.disciplina.Disciplina;

public class SubiectDAO 
{
	protected DBConnection con=new DBConnection();
	
	public SubiectDAO()
	{
	}
	
	public List<Subiect> getSubiecte(Disciplina disciplina)
	{
		int nId;
		int nNumar;
		float nPondere;
		List<Subiect> listSubiecte=new ArrayList<Subiect>();

  		String sql=
  			"SELECT subiecte.id, subiecte.numar, subiecte.pondere, id_disciplina " +
  		"FROM subiecte WHERE id_disciplina=" + disciplina.getId();
  		
		try
	    {
			ResultSet rs=con.execQuery(sql);
		    while(rs.next())
		    {
		    	nId = rs.getInt(1);
		    	nNumar = rs.getInt(2);
		    	nPondere = rs.getFloat(3);
		    			    	
			    listSubiecte.add(new Subiect(nId, nNumar, nPondere)); 
		    }
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 finally
		 {
			con.closeConnection();
		 }
		 
		 return listSubiecte;		
	}
	
	public int getNumarSubiecte(Disciplina disciplina)
	{
		int nNrSubiecte=0;

  		String sql=
  			"SELECT COUNT( DISTINCT id ) FROM subiecte WHERE id_disciplina=" + disciplina.getId();
  		
		try
	    {
			ResultSet rs=con.execQuery(sql);
		    if(rs.next())
		    {
		    	nNrSubiecte = rs.getInt(1);
		    }			  
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 return nNrSubiecte;		
	}
	
	public int schimbaPondere(String idsubiect, String pondere)
	{
		int nResult;		
		String sql=
			"UPDATE subiecte SET pondere=" + pondere +" WHERE id=" + idsubiect+";";
  		nResult=con.execUpdate(sql);
		return nResult;
	}


}
