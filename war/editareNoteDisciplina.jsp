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
<jsp:useBean id="studentBean" scope="page"
	class="ro.upt.cs.centralizator.studenti.StudentBean">
	<jsp:setProperty name="studentBean" property="*" />
</jsp:useBean>


<html>
<header>
<title>Centralizator - Editare note pentru disciplina</title>
</header>

<body>
	<jsp:include page="header.jsp" />

	<%
	if(session.getAttribute("profesor") == null)
	{
    	response.sendRedirect("showLogin.jsp");
    }

	int NrSubiecte;
	Profesor profesor=(Profesor)session.getAttribute("profesor");

	StudentDAO studentiDAO = new StudentDAO();
	Student student = studentiDAO.getStudent(studentBean.getStudent());

	DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
	Disciplina disciplina = disciplinaDAO.getDisciplina(disciplinaBean.getDisciplina());
	
	SubiectDAO subiecteDAO = new SubiectDAO();
	List<Subiect> listaSubiecte = subiecteDAO.getSubiecte(disciplina);
	
	NotaDAO noteDAO = new NotaDAO();
	
	NrSubiecte = subiecteDAO.getNumarSubiecte(disciplina);
%>

	<h4>
		Notele studentului
		<%=student.getNume()%>
		la disciplina
		<%=disciplina.getNume()%></h4>

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


		<tr>
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
			<form action="schimbaNote.jsp" method="post">
				<td valign="middle" align="center"
					headers="<%=disciplina.getInitiale()+" "+disciplina.getInitiale()+subiect.getId()%>"
					onmouseover="this.style.background='blue';this.style.cursor='pointer'"
					onmouseout="this.style.background='white';">
					<input
					type="hidden" name="<%="idnota"+subiect.getId()%>"
					value="<%=n.getId() %>"> <input align="right" type="text"
					name="<%="nota"+subiect.getId()%>" value="<%= n.getNota() %>">
				</td>
				<%
    			}
        	}
    %>
				<td><input type="hidden" name="disciplina"
					value=<%=disciplinaBean.getDisciplina()%>> <input
					type="submit" name="salvare" value="Salveaza note"></td>
		</tr>
		</form>
	</table>

	<%@ include file="footer.jsp"%>
</body>
</html>
