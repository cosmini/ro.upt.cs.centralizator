<%@page import="ro.upt.cs.centralizator.note.Nota"%>
<%@page import="ro.upt.cs.centralizator.note.NotaDAO"%>
<%@page import="ro.upt.cs.centralizator.subiecte.Subiect"%>
<%@page import="ro.upt.cs.centralizator.subiecte.SubiectDAO"%>
<%@page import="ro.upt.cs.centralizator.studenti.Student"%>
<%@page import="ro.upt.cs.centralizator.studenti.StudentDAO"%>
<%@page import="ro.upt.cs.centralizator.disciplina.*"%>
<%@page import="ro.upt.cs.centralizator.profesor.*,java.util.*"
	session="true" errorPage="error.jsp"%>

<html>
<header>
<title>Centralizator - pagina administrator</title>
</header>

<body>
	<jsp:include page="header.jsp" />

	<% 
	int NrSubiecte;

	StudentDAO studentiDAO = new StudentDAO();
	List<Student> listaStudenti = studentiDAO.getStudenti();

	DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
	List<Disciplina> listaDiscipline = disciplinaDAO.getDisciplinele();

	SubiectDAO subiecteDAO = new SubiectDAO();
	NotaDAO noteDAO = new NotaDAO();
%>
	<h3>Centralizator - vizualizarea studentilor, disciplinelor si
		notelor</h3>

	<table border="1">
		<tr>
			<th rowspan="2" id="i">ID</th>
			<th rowspan="2" id="m">Marca</th>
			<th rowspan="2" id="n">Nume</th>
			<%
     for (Disciplina disciplina : listaDiscipline)
     {
    	 List<Subiect> listSubiecte = subiecteDAO.getSubiecte(disciplina);
    	 NrSubiecte = subiecteDAO.getNumarSubiecte(disciplina);
     %>
			<th rowspan="1" colspan=<%=NrSubiecte%>
				id="<%=disciplina.getInitiale()%>"><%=disciplina.getNume()%></th>
			<%
     }
     %>
			<th rowspan="2" id="t">Total</th>
			<th rowspan="2" id="nt">Nota</th>
		</tr>

		<tr>
			<%
   for (Disciplina disciplina : listaDiscipline)
   {
  	 List<Subiect> listSubiecte = subiecteDAO.getSubiecte(disciplina);
   	//for(int i=1;i<=NrSubiecte;i++)
      for(Subiect subiecte : listSubiecte)
      {
      %>
			<th id="<%=disciplina.getInitiale()+subiecte.getId()%>"
				headers="<%=disciplina.getInitiale()%>"><%=disciplina.getInitiale()+subiecte.getId()%>
			</th>
			<%
      }
   }
   %>
		</tr>

		<tr>
			<%
   for (Student student : listaStudenti)
   	{
	   int total=0;
   	%>
			<td headers="i"><%=student.getId()%></td>
			<td headers="m"><%=student.getMarca()%></td>
			<td headers="n"><%=student.getNume()%></td>
			<%
    for (Disciplina disciplina : listaDiscipline)
    	{
   	 		List<Subiect> listSubiecte = subiecteDAO.getSubiecte(disciplina);
   	 		for (Subiect subiect : listSubiecte)
    		{
     	   		List<Nota> listNote = noteDAO.getNote(student,subiect);
           		Iterator<Nota> in = listNote.iterator();  
           		while(in.hasNext())
           		{
           			Nota n = in.next();
           			total+=(subiect.getPondere()*n.getNota());
    %>
			<td valign="middle" align="center"
				headers="<%=disciplina.getInitiale()+" "+disciplina.getInitiale()+subiect.getId()%>">
				<%=n.getNota()%></td>
			<%
    			}
        	}
    	}
    %>
			<td headers="t"><%= total %></td>
			<td headers="nt"><%= (float)total/20 %></td>
		</tr>
		<%
    }
   %>
	</table>

	<%@ include file="footer.jsp"%>
</body>
</html>
