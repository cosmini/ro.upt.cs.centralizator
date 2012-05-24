<%@ page contentType="text/html; 
	charset=iso-8859-1" language="java"
	errorPage="error.jsp"%>

<jsp:include page="header.jsp" />

<html>
<head>
<title>Centralizator - Pagina de intrare</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF">

	<center>
		<table width="20%" border="1" align="center">

			<form action="verificaLogarea.jsp" method="post">
				<tr>
					<td height="35" bgcolor="#FFFFFF" colspan="2" align="center"></td>
				</tr>
				<tr>
					<td height="35" bgcolor="#9999FF" width="18%">Profesor</td>
					<td height="35" bgcolor="#CCCCFF" width="82%"><input
						type="text" name="nume"></td>
				</tr>
				<tr>
					<td bgcolor="#9999FF" width="18%">Parola</td>
					<td bgcolor="#CCCCFF" width="82%"><input type="password"
						name="parola"></td>
				</tr>
				<tr>
					<td colspan="2" height="35">
						<div align="center">
							<input type="submit" name="Submit" value="Login">
						</div></td>
				</tr>
			</form>

		</table>

	</center>
	<%@ include file="footer.jsp"%>
</body>
</html>
