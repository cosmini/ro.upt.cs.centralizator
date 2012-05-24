package ro.upt.cs.centralizator.note;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ro.upt.cs.centralizator.db.DBConnection;
import ro.upt.cs.centralizator.studenti.Student;
import ro.upt.cs.centralizator.subiecte.Subiect;

public class NotaDAO 
{
	protected DBConnection con=new DBConnection();
	
	public NotaDAO()
	{
	}
	
	public List<Nota> getNote(Student student, Subiect subiect)
	{
		int nId;
		int nIdStudent;
		int nIdSubiect;
		int nNota;
		List<Nota> listNote=new ArrayList<Nota>();
		String sql=
  			"SELECT id, id_student, id_subiect, nota " +
  			"FROM note WHERE id_student="+student.getId() +
  			" AND id_subiect="+ subiect.getId();
		try
	    {
			ResultSet rs=con.execQuery(sql);
			
			if (rs.next())
			{
			  	nId = rs.getInt(1);
			   	nIdStudent = rs.getInt(2);
			   	nIdSubiect = rs.getInt(3);
			   	nNota = rs.getInt(4);

			    listNote.add(new Nota(nId, nIdStudent, nIdSubiect, nNota)); 
			}
			  else 
			  {
				  insereaza(student,subiect);
			  }
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 return listNote;		
	}
	
	public int adauga(String idnota, String nota)
	{
		int nResult;		
		String sql=
			"UPDATE note SET nota=" + nota +" WHERE id=" + idnota+";";
  		nResult=con.execUpdate(sql);
		return nResult;
	}
	
	public int insereaza(Student student, Subiect subiect)
	{
		int nResult;		
		String sql = 
			"INSERT INTO `centralizator`.`note` " +
			"(`id`, `id_student`, `id_subiect`, `nota`) " +
			"VALUES (NULL, '"+student.getId()+"', '"+subiect.getId()+"', '0');";
  		nResult=con.execUpdate(sql);
		return nResult;
	}	

}
