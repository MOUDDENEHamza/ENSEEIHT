<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Associate</title>
</head>
<body>

	<h1>Persons</h1> 
	<br>
	<% 
	ArrayList<Person> personList = (ArrayList<Person>) request.getAttribute("PersonList");
	ArrayList<Address> addressList = (ArrayList<Address>) request.getAttribute("AddressList");
	for (Person p : personList) {
		String a = p.getFirstName() + " " + p.getLastName();
	%>
		<div>
  			<input type="radio" id="<%= p.getId() %>" value="<%= a %>" name="1">
  			<label for="<%= a %>"><%= a %></label>
		</div>
		<br>
	<%
	}
	%>
	<h1>Address</h1> 
	<br>
	<% 
	for (Address a : addressList) {
		String b = a.getStreet() + " " + a.getCity();
	%>
		<div>
  			<input type="radio" id="<%= a.getId() %>" value="<%= b %>" name="2">
  			<label for="<%= b %>"><%= b %></label>
		</div>
		<br>
	<%	
	}
	%>
</body>
</html>