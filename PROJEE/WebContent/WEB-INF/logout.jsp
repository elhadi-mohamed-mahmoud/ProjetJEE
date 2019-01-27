<%
	session.setAttribute("ACTIF", "NO");
	session.setAttribute("ACTIF", "");
	response.sendRedirect(request.getContextPath() + "/index");    
%>

