<%@ page language="java"
	import="ro.upt.cs.centralizator.profesor.*, java.util.*"
	errorPage="error.jsp"%>
<jsp:include page="header.jsp" />

<html>
<head>
<title>Centralizator - Schimbare parola utilizator</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body leftmargin="0" topmargin="0">
	<center>
		<p>
			<font face="Verdana, Arial, Helvetica, sans-serif"><b>Parola
					noua</b>
			</font>
		</p>
		<table width="41%" border="1" align="center" bordercolor="#000000">
			<form action="schimbaParola.jsp" method="GET">
				<tr>
					<td bgcolor="#9999FF" width="18%"><font
						face="Verdana, Arial, Helvetica, sans-serif">Parola noua</font>
					</td>
					<td bgcolor="#CCCCFF" width="82%"><input type="password"
						name="parolaNoua">
					</td>
				</tr>
				<tr>
					<td height="35" bgcolor="#9999FF" width="18%"><font
						face="Verdana, Arial, Helvetica, sans-serif">Confirmare
							parola</font>
					</td>
					<td height="35" bgcolor="#CCCCFF" width="82%"><input
						type="password" name="verificaParola">
					</td>
				</tr>
				<tr>
					<td colspan="2" height="35">
						<div align="center">
							<font face="Verdana, Arial, Helvetica, sans-serif"> <input
								type="submit" name="schimba" value="Schimba"> </font>
						</div>
					</td>
				</tr>
			</form>
		</table>
	</center>

	<%@ include file="footer.jsp"%>
</body>
</html>
