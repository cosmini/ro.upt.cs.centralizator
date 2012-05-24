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

<%
	if(session.getAttribute("profesor") == null)
	{
    	response.sendRedirect("arataLogarea.jsp");
    }
	int NrSubiecte;

	DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
	List<Disciplina> listaDiscipline = disciplinaDAO.getDisciplinele();
	
	SubiectDAO subiecteDAO = new SubiectDAO();

	for (Disciplina disciplina : listaDiscipline) 
	{
		NrSubiecte = subiecteDAO.getNumarSubiecte(disciplina);
		List<Subiect> listaSubiecte = subiecteDAO.getSubiecte(disciplina);
		
		if(NrSubiecte==1)
			{	
			for(Subiect subiect : listaSubiecte )
				{
					if(request.getParameter("pondere"+subiect.getId()) != null)
					{
						subiecteDAO.schimbaPondere(request.getParameter("id"+subiect.getId()),request.getParameter("pondere"+subiect.getId()));
					}
				}
			}
	}
%>

<jsp:forward page="listarePonderi.jsp" />
