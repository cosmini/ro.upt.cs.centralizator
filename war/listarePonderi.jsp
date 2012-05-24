<%@page import="ro.upt.cs.centralizator.subiecte.*"%>
<%@page import="ro.upt.cs.centralizator.disciplina.*"%>
<%@ page import="ro.upt.cs.centralizator.profesor.*,java.util.*"
	session="true" errorPage="error.jsp"%>

<html>
<header>
<title>Centralizator - Listare discipline</title>
</header>

<body>
	<jsp:include page="headerPonderi.jsp" />

	<%
	if(session.getAttribute("profesor") == null)
	{
    	response.sendRedirect("showLogin.jsp");
    }

	DisciplinaDAO disciplinaDAO=new DisciplinaDAO();
	List<Disciplina> listDiscipline=disciplinaDAO.getDisciplinele();
	
	SubiectDAO subiecteDAO = new SubiectDAO();
	
	int NrSubiecte;
%>

	<h2>Lista disciplinelor si ponderilor aferente</h2>

	<table border="1">
		<%
  	for (Disciplina disciplina : listDiscipline) 
  	{
  		NrSubiecte = subiecteDAO.getNumarSubiecte(disciplina);
  		List<Subiect> listaSubiecte = subiecteDAO.getSubiecte(disciplina);
  		
  		if(NrSubiecte==1)
  			{	
			for(Subiect subiect : listaSubiecte )
				{
%>
		<form action="schimbaPondere.jsp" method="post">
			<tr>
				<td><%= disciplina.getId() %></td>
				<td><%= disciplina.getNume() %></td>
				<td><%= disciplina.getInitiale() %></td>
				<td><input type="hidden" name="<%="id"+subiect.getId()%>"
					value="<%= subiect.getId() %>"> <input type="text"
					name="<%="pondere"+subiect.getId()%>"
					value="<%= subiect.getPondere() %>"></td>
			</tr>
			<%
				}
			}
  	}
%>
		
	</table>
	<input align="middle" type="submit" name="schimb"
		value="Schimba Pondere">
	</form>


	<%@ include file="footer.jsp"%>
</body>
</html>
