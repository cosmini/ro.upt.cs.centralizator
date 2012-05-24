package ro.upt.cs.centralizator.profesor;

public class LoginBean 
{
	private String nume = "";
	private String parola = "";

	public LoginBean()
	{
	}

  	public void setNume(String nume) 
  	{
  		this.nume = nume;
  	} 

  	public void setParola(String parola) 
  	{
  		this.parola = parola;
  	} 

  	public Profesor verificaCredentiale()
  	{
  		ProfesorDAO profesorDAO=new ProfesorDAO();
  		Profesor profesor=profesorDAO.existNamePass(nume,parola);  		
  		return profesor;
  	} 
}
