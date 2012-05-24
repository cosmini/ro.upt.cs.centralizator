<%@ page isErrorPage="true"%>

<title>Eroare</title>

<jsp:include page="header.jsp" />

<center>
	<h1>Eroare</h1>

	<%= "Exception: " + exception.getMessage() %>
	<br>

	<% 
		if(exception != null)
		{
			exception.printStackTrace(); 
		}
	%>
	<br>
</center>

<jsp:include page="footer.jsp" />
