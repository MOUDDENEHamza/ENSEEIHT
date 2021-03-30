<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>

	<h1>List</h1> 
	<br>
	<% 
	ArrayList<Person> personList = (ArrayList<Person>) request.getAttribute("PersonList");
	Collection<Address> addressList = (Collection<Address>) request.getAttribute("AddressList");
	for (Person p : personList) {
		String out1 = p.getFirstName() + " " + p.getLastName(); 
	%>
		<%= out1 %> <br>
	<%	
		for (Address a : addressList) {
			String out2 = a.getStreet() + " " + a.getCity();
		%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= out2 %> <br>
		<%	
		}
		%>
		<br>
	<%
	}
	%>
</body>
</html>