package ro.upt.cs.centralizator.disciplina;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ro.upt.cs.centralizator.db.DBConnection;
import ro.upt.cs.centralizator.profesor.Profesor;

public class DisciplinaDAO 
{
	protected DBConnection con=new DBConnection();
	
	public DisciplinaDAO()
	{
	}
	
	public List<Disciplina> getDiscipline(Profesor profesor)
	{
		int nId;
		String szNume;
		String szInitiale;
		List<Disciplina> listDiscipline=new ArrayList<Disciplina>();

  		String sql=
  			"SELECT discipline.id, discipline.nume, discipline.initiale " +
  			"FROM discipline WHERE id_profesor=" + profesor.getId();
		try
	    {
			ResultSet rs=con.execQuery(sql);
		    while(rs.next())
		    {
		    	nId=rs.getInt(1);
		    	szNume=rs.getString(2);
		    	szInitiale=rs.getString(3);
		    			    	
			    listDiscipline.add(new Disciplina(nId,szNume,szInitiale)); 
		    }
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 return listDiscipline;		
	}
	
	public Disciplina getDisciplina(int id)
	{
		Disciplina d = null;
		int nId;
		String szNume;
		String szInitiale; 
		
		String sql=
			"SELECT id, nume, initiale FROM discipline WHERE id='"+id+"'";
		try
		{
			ResultSet rs = con.execQuery(sql);
			if(rs.next())
			{
				nId=rs.getInt(1);
				szNume=rs.getString(2);
		    	szInitiale=rs.getString(3);
		    	
		    	d = new Disciplina(nId, szNume, szInitiale);
			}
		}
		catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		
		 return d;
	}
	
	public List<Disciplina> getDisciplinele()
	{
		int nId;
		String szNume;
		String szInitiale;
		List<Disciplina> listDiscipline=new ArrayList<Disciplina>();

  		String sql=
  			"SELECT id, nume, initiale FROM discipline ORDER BY id";
		try
	    {
			ResultSet rs=con.execQuery(sql);
		    while(rs.next())
		    {
		    	nId=rs.getInt(1);
		    	szNume=rs.getString(2);
		    	szInitiale=rs.getString(3);
		    			    	
			    listDiscipline.add(new Disciplina(nId,szNume,szInitiale));
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
		 
		 return listDiscipline;		
	}

}
