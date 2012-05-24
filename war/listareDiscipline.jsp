<%@page import="ro.upt.cs.centralizator.disciplina.*"%>
<%@ page import="ro.upt.cs.centralizator.profesor.*,java.util.*"
	session="true" errorPage="error.jsp"%>

<html>
<header>
<title>Centralizator - Listare discipline</title>
</header>

<body>
	<jsp:include page="header.jsp" />

	<%
	if(session.getAttribute("profesor") == null)
	{
    	response.sendRedirect("showLogin.jsp");
    }
%>

	<%
	Profesor profesor=(Profesor)session.getAttribute("profesor");
	DisciplinaDAO disciplinaDAO=new DisciplinaDAO();
	List<Disciplina> listDiscipline=disciplinaDAO.getDiscipline(profesor);
%>

	<h3>Selectati disciplina pentru a completa notele</h3>

	<table border="1">
		<%
  	for (Disciplina d : listDiscipline) 
  	{
%>
		<form action="completareNoteDisciplina.jsp" method="post">
			<tr>
				<td><%= d.getId() %></td>
				<td><%= d.getNume() %></td>
				<td><%= d.getInitiale() %></td>
				<td><input type="hidden" name="disciplina"
					value="<%= d.getId() %>"> <input type="submit"
					name="actiune" value="Completare note"></td>
			</tr>
		</form>
		<%
  	}
%>
	</table>


	<%@ include file="footer.jsp"%>
</body>
</html>
