<%@ page language="java"
	import="ro.upt.cs.centralizator.profesor.*,java.util.*"
	errorPage="error.jsp"%>

<jsp:useBean id="loginBean" scope="page"
	class="ro.upt.cs.centralizator.profesor.LoginBean">
	<jsp:setProperty name="loginBean" property="*" />
</jsp:useBean>

<%
	String szDisplayPage = "arataLogarea.jsp";
  
  	Profesor profesor = loginBean.verificaCredentiale();
  	if (profesor != null) 
  	{
    	session.setAttribute("profesor", profesor);
    	session.setMaxInactiveInterval(6000);    	

    	if(profesor.getNume().equals("admin"))
		{
	  		szDisplayPage = "centralizareNote.jsp";
  		}
    	else
    	{ 
    		szDisplayPage = "listareDiscipline.jsp";
    	}
  	}
%>

<jsp:forward page="<%= szDisplayPage %>" />
