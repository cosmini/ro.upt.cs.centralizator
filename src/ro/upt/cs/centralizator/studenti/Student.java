package ro.upt.cs.centralizator.studenti;

public class Student 
{
	private int id;
	private String marca;
	private String nume;
	
	public Student()
	{
	}
	
	public Student(int nId, String szMarca, String szNume)
	{
		this.id=nId;
		this.marca=szMarca;
		this.nume=szNume;
	}

	public int getId() 
	{
		return id;
	}
	
	public String getMarca() 
	{
		return marca;
	}	

	public String getNume() 
	{
		return nume;
	}	
	
}
