<%@ page import="ro.upt.cs.centralizator.profesor.*"
	errorPage="error.jsp"%>

<%
	if (session != null) 
	{
    	Profesor profesor = (Profesor)session.getAttribute("profesor");
    	if (profesor != null) 
    	{
      		session.removeAttribute("profesor");
      		session.invalidate();
    	} 
  	}
  	response.sendRedirect("arataLogarea.jsp");
%>
