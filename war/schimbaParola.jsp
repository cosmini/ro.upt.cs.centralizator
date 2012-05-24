<%@ page language="java"
	import="ro.upt.cs.centralizator.profesor.*,java.util.*"
	errorPage="error.jsp"%>

<jsp:useBean id="parolaNouaBean" scope="page"
	class="ro.upt.cs.centralizator.profesor.ParolaNouaBean">
	<jsp:setProperty name="parolaNouaBean" property="*" />
</jsp:useBean>

<jsp:useBean id="verificaParolaBean" scope="page"
	class="ro.upt.cs.centralizator.profesor.VerificaParolaBean">
	<jsp:setProperty name="verificaParolaBean" property="*" />
</jsp:useBean>

<%
	if(session.getAttribute("profesor") == null)
	{
		response.sendRedirect("arataLogarea.jsp");
	}

	Profesor profesor=(Profesor)session.getAttribute("profesor");
	ProfesorDAO profesorDAO = new ProfesorDAO();
	String display = ""; 
	if(parolaNouaBean.getParolaNoua() !=null)
	{
		if(verificaParolaBean.getVerificaParola() !=null)
		{
			if(parolaNouaBean.getParolaNoua().equals(verificaParolaBean.getVerificaParola()))
			{
				int nResult = profesorDAO.schimbaParola(profesor,parolaNouaBean.getParolaNoua());
				if(nResult == 1)
					{
						session.removeAttribute("profesor");
	  					session.invalidate();
						display = "arataLogarea.jsp"; 
					}
				else
					{
					out.println("<p>Nu s-a putut scrie in baza de date!</p>");
					display = "parolaNoua.jsp";
					}
			}
			else
			{
				%>
<p>Ati introdus parole diferite!</p>
<%
				display = "parolaNoua.jsp";				
			}
		}
	}
	else
	{
		session.removeAttribute("profesor");
		session.invalidate();
		display= "parolaNoua.jsp";
	}
%>

<jsp:forward page="<%= display %>" />
