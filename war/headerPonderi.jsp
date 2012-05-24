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
	String szCentralizareNote="";

	Profesor profesor = (Profesor)session.getAttribute("profesor");
	if(profesor != null)
	{
		szNume=profesor.getNume();
		nId=profesor.getId();
		szLogoutLink="[<a href=\"logout.jsp\">Logout</a>]";
		szChangePass="[<a href=\"parolaNoua.jsp\">Schimbare parola</a>]";
		szCentralizareNote="[<a href=\"centralizareNote.jsp\">Revenire la centralizator</a>]";
		
    }
%>
	<p align="left">
		<%= szCentralizareNote %>
	<p align="right">
		Profesor conectat:
		<%= szNume %>
		<%= szLogoutLink %>
		<%= szChangePass %></p>
	<hr>
</center>