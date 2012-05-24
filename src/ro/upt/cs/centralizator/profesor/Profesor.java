package ro.upt.cs.centralizator.profesor;

public class Profesor 
{
	private int m_nId;
	private String m_szNume;
	private String m_szParola;
	
	public Profesor()
	{
	}
	
	public Profesor(int nId, String szNume)
	{
		m_nId=nId;
		m_szNume=szNume;
	}

	public int getId()
	{
		return m_nId;
	}

	public String getNume() 
	{
		return m_szNume;
	}	

	public String getParola() 
	{
		return m_szParola;
	}	
}
