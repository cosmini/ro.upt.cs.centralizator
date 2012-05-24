package ro.upt.cs.centralizator.note;

public class Nota 
{
	private int id;
	private int id_student;
	private int id_subiect;
	private int nota;
	
	public Nota()
	{
	}
	
	public Nota(int nId, int nIdStudent, int nIdSubiect, int nNota)
	{
		this.id = nId;
		this.id_student = nIdStudent;
		this.id_subiect = nIdSubiect;
		this.nota = nNota;
	}

	public int getId() 
	{
		return id;
	}
	
	public int getIdStudent()
	{
		return id_student;
	}
	
	public int getIdSubiect() 
	{
		return id_subiect;
	}
	
	public int getNota() 
	{
		return nota;
	}




}
