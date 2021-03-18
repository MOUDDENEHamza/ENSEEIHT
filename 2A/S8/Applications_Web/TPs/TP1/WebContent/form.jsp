<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if (request.getMethod().equals("POST")) {
	String nb1 = request.getParameter("nb1");
	String nb2 = request.getParameter("nb2");
	int res = Integer.parseInt(nb1) + Integer.parseInt(nb2);
%>
La somme de <%= nb1 %> et <%= nb2 %> est <%= res %>
<br>
<a href="http://localhost:8080/HelloWorld/form.jsp" >Try again</a>
<%} else { %>
<form action="Calcul" method="post"> 
nb1: <input type="text" name="nb1"/> <br>
nb2: <input type="text" name="nb2"/> <br>
<input type='submit' value='Compute'/>
</form>
<%  } %>
</body>
</html>