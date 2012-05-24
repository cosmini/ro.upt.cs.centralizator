package ro.upt.cs.centralizator.studenti;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ro.upt.cs.centralizator.db.DBConnection;

public class StudentDAO 
{
	protected DBConnection con=new DBConnection();
	
	public StudentDAO()
	{
	}
	
	public List<Student> getStudenti()
	{
		int nId;
		String szMarca;
		String szNume;
		List<Student> listStudenti=new ArrayList<Student>();

  		String sql=
  			"SELECT id, marca, nume " +
  			"FROM studenti ";
		try
	    {
			ResultSet rs=con.execQuery(sql);
		    while(rs.next())
		    {
		    	nId=rs.getInt(1);
		    	szMarca=rs.getString(2);
		    	szNume=rs.getString(3);
		    			    	
			    listStudenti.add(new Student(nId,szMarca,szNume)); 
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
		 
		 return listStudenti;		
	}
	
	public Student getStudent(int idstudent)
	{
		int nId;
		String szMarca;
		String szNume;
		Student s = null;

  		String sql=
  			"SELECT id, marca, nume " +
  			"FROM studenti WHERE id="+idstudent;
		try
	    {
			ResultSet rs=con.execQuery(sql);
		    if(rs.next())
		    {
		    	nId=rs.getInt(1);
		    	szMarca=rs.getString(2);
		    	szNume=rs.getString(3);
		    			    	
			    s = new Student(nId,szMarca,szNume); 
		    }			  
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 return s;		
	}

}
