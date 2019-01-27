<%@ page import="beans.*, dao.*, java.util.*" %>
<%
String actif = (String) request.getSession().getAttribute("type");
if(actif == null || !actif.equals("admin")){
	response.sendRedirect(request.getContextPath() + "/index?action=login");    
}

	DaoFactory fac = DaoFactory.getInstance();
	QuestionDao dao = fac.getQuestionDao();
	AxeDao daoA = fac.getAxeDao();

	
	String name = daoA.getAxe(Long.parseLong(request.getParameter("id")));
	List<Question>array = dao.findAll(Long.parseLong(request.getParameter("id")));		
%>
 <jsp:include page="headerAdmin.jsp" />
 
 
 <div style="background: white; padding : 100px">
    
    <div class="container">
      <div class="row" style="padding-bottom: 60px;">
        <div class="col">
          <div class="section_title text-center">
            <h1 style="padding-bottom: 50px;">Gerer l'axe <%out.print(name); %></h1>
          </div>
          <a href="index?action=addquestion&id=<%out.print(request.getParameter("id")); %>" class="btn btn-primary" style="float: right;">Ajouter une question</a>
        </div>
      </div>

  <table class="table" width="400">
  <thead class="thead-dark">
    <tr>
      <th class="col-md-1">#</th>
      <th class="col-md-8">La question</th>
      <th class="col-md-2">Supprimer</th>
    </tr>
  </thead>
  <tbody>
	<%
	for(int i = 0; i < array.size(); i++){
	%>
  		<tr>
	      <th scope="row"><%out.print(array.get(i).getId()); %></th>
	      <td><%out.print(array.get(i).getName()); %></td>
	      <td><a href="index?action=deletequestion&id=<%out.print(request.getParameter("id")); %>&qId=<%out.print(array.get(i).getId()); %>" class="btn btn-primary" style="background-color: #EB9E3E;" onclick="return confirm('Are you sure you want to delete this item?');">supprimer</a></td>
	    </tr>
  	
  	<%}%>
    
  </tbody>
</table>
</div>
</div>

 <jsp:include page="footerAdmin.jsp" />

 