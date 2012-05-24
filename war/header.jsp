<%@ page import="ro.upt.cs.centralizator.profesor.*, java.util.*"
	errorPage="error.jsp"%>

<center>
	<h3>
		<font size="8" color="blue">Centralizator licenta</font>
	</h3>
	<%
	int nId=0;
	String szNume="Anonim";
	String szLogoutLink="";
	String szChangePass="";
	String szSchimbaPondereProiect="";
	String szDiscipline="";

	Profesor profesor = (Profesor)session.getAttribute("profesor");
	if(profesor != null)
	{
		szNume=profesor.getNume();
		nId=profesor.getId();
		szLogoutLink="[<a href=\"logout.jsp\">Logout</a>]";
		szChangePass="[<a href=\"parolaNoua.jsp\">Schimbare parola</a>]";
		szSchimbaPondereProiect="[<a href=\"schimbaPondere.jsp\">Schimba pondere proiect</a>]";
		szDiscipline="[<a href=\"listareDiscipline.jsp\">Vizualizare discipline</a>]";
		
    }
	if(szNume.equals("admin"))
	{
%>
	<p align="left">
		<%= szSchimbaPondereProiect %>
	<p align="right">
		Profesor conectat:
		<%= szNume %>
		<%= szLogoutLink %>
		<%= szChangePass %></p>
	<%
	}
	else
	{
%>
	<p align="left">
		<%= szDiscipline %>
	<p align="right">
		Profesor conectat:
		<%= szNume %>
		<%= szLogoutLink %>
		<%= szChangePass %></p>
	<%
	}
%>
	<hr>
</center>