<%@page import="dao.QuestionDao"%>
<%@page import="dao.DaoFactory"%>
<%
String actif = (String) request.getSession().getAttribute("type");
if(actif == null || !actif.equals("admin")){
	response.sendRedirect(request.getContextPath() + "/index?action=login");    
}

DaoFactory fac = DaoFactory.getInstance();
QuestionDao dao = fac.getQuestionDao();
dao.delete(Long.parseLong(request.getParameter("qId")));
	
response.sendRedirect(request.getContextPath() + "/index?action=gestionaxe&id="+ request.getParameter("id"));    
%>
