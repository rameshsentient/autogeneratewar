<%@ page session="true" %>
<%@page import="java.util.Map"%>
<%
boolean isValid = false;
if(session.getAttribute("id") != null)
{
	if(Integer.parseInt(session.getAttribute("id").toString()) > 0)
	{
		isValid = true;
	}
}

if(isValid)
{
}
else
{
	response.sendRedirect("login");
}
%>