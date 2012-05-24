<%@page import="ro.upt.cs.centralizator.note.Nota"%>
<%@page import="ro.upt.cs.centralizator.note.NotaDAO"%>
<%@page import="ro.upt.cs.centralizator.subiecte.Subiect"%>
<%@page import="ro.upt.cs.centralizator.subiecte.SubiectDAO"%>
<%@page import="ro.upt.cs.centralizator.studenti.Student"%>
<%@page import="ro.upt.cs.centralizator.studenti.StudentDAO"%>
<%@page import="ro.upt.cs.centralizator.disciplina.*"%>
<%@ page language="java"
	import="ro.upt.cs.centralizator.profesor.*,java.util.*"
	errorPage="error.jsp"%>

<jsp:useBean id="disciplinaBean" scope="page"
	class="ro.upt.cs.centralizator.disciplina.DisciplinaBean">
	<jsp:setProperty name="disciplinaBean" property="*" />
</jsp:useBean>

<%
	if(session.getAttribute("profesor") == null)
	{
    	response.sendRedirect("showLogin.jsp");
    }
	int NrSubiecte;

	DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
	Disciplina disciplina = disciplinaDAO.getDisciplina(disciplinaBean.getDisciplina());
	
	SubiectDAO subiecteDAO = new SubiectDAO();
	List<Subiect> listSubiecte = subiecteDAO.getSubiecte(disciplina);
	
	NotaDAO noteDAO = new NotaDAO();
	
	NrSubiecte = subiecteDAO.getNumarSubiecte(disciplina);

	for(Subiect subiecte : listSubiecte)
	{
			if(request.getParameter("nota"+subiecte.getId()) != null)
			{
				noteDAO.adauga(request.getParameter("idnota"+subiecte.getId()),request.getParameter("nota"+subiecte.getId()));
		
			}
	}
%>

<jsp:forward page="completareNoteDisciplina.jsp" />
