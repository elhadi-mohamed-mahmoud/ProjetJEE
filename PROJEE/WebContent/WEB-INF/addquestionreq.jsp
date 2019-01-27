<%@page import="dao.QuestionDao"%>
<%@page import="dao.DaoFactory"%>
<%@page import="beans.Question"%>
<% 

DaoFactory fac = DaoFactory.getInstance();
QuestionDao dao = fac.getQuestionDao();

Question quest = new Question();
quest.setName(request.getParameter("question"));
quest.setQuestionnaireId(Long.parseLong(request.getParameter("id")));
quest.setId(dao.getMaxId() + 1);
dao.save(quest);

response.sendRedirect(request.getContextPath() + "/index?action=gestionaxe&id=" + request.getParameter("id"));  
%>