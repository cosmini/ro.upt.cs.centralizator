<%@page import="ro.upt.cs.centralizator.note.Nota"%>
<%@page import="ro.upt.cs.centralizator.note.NotaDAO"%>
<%@page import="ro.upt.cs.centralizator.subiecte.Subiect"%>
<%@page import="ro.upt.cs.centralizator.subiecte.SubiectDAO"%>
<%@page import="ro.upt.cs.centralizator.studenti.Student"%>
<%@page import="ro.upt.cs.centralizator.studenti.StudentDAO"%>
<%@page import="ro.upt.cs.centralizator.disciplina.*"%>
<%@page import="ro.upt.cs.centralizator.profesor.*,java.util.*"
	session="true" errorPage="error.jsp"%>

<jsp:useBean id="disciplinaBean" scope="page"
	class="ro.upt.cs.centralizator.disciplina.DisciplinaBean">
	<jsp:setProperty name="disciplinaBean" property="*" />
</jsp:useBean>

<html>
<header>
<title>Centralizator - Completare note pentru disciplina</title>
</header>

<body>
	<jsp:include page="header.jsp" />

	<%
	if(session.getAttribute("profesor") == null)
	{
    	response.sendRedirect("showLogin.jsp");
    }

	Profesor profesor=(Profesor)session.getAttribute("profesor");

	StudentDAO studentiDAO = new StudentDAO();
	List<Student> listaStudenti = studentiDAO.getStudenti();

	DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
	Disciplina disciplina = disciplinaDAO.getDisciplina(disciplinaBean.getDisciplina());
	
	SubiectDAO subiecteDAO = new SubiectDAO();
	List<Subiect> listaSubiecte = subiecteDAO.getSubiecte(disciplina);
	
	NotaDAO noteDAO = new NotaDAO();
	
	int NrSubiecte;
	NrSubiecte = subiecteDAO.getNumarSubiecte(disciplina);
%>

	<h3>Selectati studentul pentru care doriti sa editati nota</h3>

	<table border="1">
		<tr>
			<th rowspan="2" id="i">ID</th>
			<th rowspan="2" id="m">Marca</th>
			<th rowspan="2" id="n">Nume</th>
			<th rowspan="1" colspan=<%=NrSubiecte%>
				id="<%=disciplina.getInitiale()%>"><%=disciplina.getNume()%></th>
		</tr>

		<tr>
			<%
   	//for(int i=1;i<=NrSubiecte;i++)
      for(Subiect subiecte : listaSubiecte)
      {
   %>
			<th id="<%=disciplina.getInitiale()+subiecte.getId()%>"
				headers="<%=disciplina.getInitiale()%>"><%=disciplina.getInitiale()+subiecte.getId()%>
			</th>
			<%
      }
     %>
		</tr>

		<form action="editareNoteDisciplina.jsp" method="post">
			<tr>
				<%for (Student student : listaStudenti)
   	{
   %>
				<td headers="i"><%=student.getId()%></td>
				<td headers="m"><%=student.getMarca()%></td>
				<td headers="n"><%=student.getNume()%></td>
				<%
    		for (Subiect subiect : listaSubiecte)
    		{
     	   		List<Nota> listNote = noteDAO.getNote(student,subiect);
           		Iterator<Nota> in = listNote.iterator();  
           		while(in.hasNext())
           		{
           			Nota n = in.next();
    %>
				<td valign="middle" align="center"
					headers="<%=disciplina.getInitiale()+" "+disciplina.getInitiale()+subiect.getId()%>">
					<%=n.getNota()%></td>
				<%
    			}
        	}
    %>
				<form action="editareNoteDisciplina.jsp" method="post">
					<td><input type="hidden" name="disciplina"
						value=<%=disciplinaBean.getDisciplina()%>> <input
						type="hidden" name="student" value=<%= student.getId() %>>
						<input type="submit" name="editare" value="Editare note">
					</td>
			</tr>
		</form>
		<%
    }
   %>
	</table>

	<%@ include file="footer.jsp"%>
</body>
</html>
