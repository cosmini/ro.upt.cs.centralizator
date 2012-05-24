package ro.upt.cs.centralizator.subiecte;

public class Subiect 
{
	private int id;
	private int numar;
	private float pondere;
	
	public Subiect()
	{
	}
	
	public Subiect(int nId, int nNumar, float nPondere)
	{
		this.id = nId;
		this.numar = nNumar;
		this.pondere = nPondere;
	}

	public int getId() 
	{
		return id;
	}
	
	public int getNumar()
	{
		return numar;
	}
	
	public float getPondere() 
	{
		return pondere;
	}
	
}
