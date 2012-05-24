package ro.upt.cs.centralizator.disciplina;

public class Disciplina 
{
	private int id;
	private String nume;
	private String initiale;
	
	public Disciplina()
	{
	}
	
	public Disciplina(int nId, String szNume, String szInitiale)
	{
		this.id=nId;
		this.nume=szNume;
		this.initiale=szInitiale;
	}

	public int getId() 
	{
		return id;
	}

	public String getNume() 
	{
		return nume;
	}	

	public String getInitiale() 
	{
		return initiale;
	}	
}
