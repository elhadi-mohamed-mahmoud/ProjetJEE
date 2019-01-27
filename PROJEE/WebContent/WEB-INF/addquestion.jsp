
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
%>

 <jsp:include page="headerAdmin.jsp" />

 
 <div style="background: white; padding : 100px">
    
    <div class="container">
      <div class="row" style="padding-bottom: 60px;">
        <div class="col">
          <div class="section_title text-center">
            <h1 style="padding-bottom: 50px;">ajouter une question a l'axe <%out.print(name); %></h1>
          </div>
        </div>
      </div>

  
                <form method="post" action="index?action=addquestionreq">
                  <div class="form-row" width "60%" >
                    <div class="form-group col-md-12">
                      <label for="inputName">La question : </label>
                      <input type="text" required class="form-control" id="inputName" placeholder="la question" name = "question">
                    </div>
                  </div>
                  <input type = "text" hidden name="id" value="<%out.print(request.getParameter("id")); %>">
                  <input type = "submit" style="color: white; float: right; margin-top: 30px; background-color: #EB9E3E; padding: 10px; font-size: 20px; border-radius: 18px;-moz-border-radius: 5px;" value = "confirmer">

                </form>
</div>
</div>

 <jsp:include page="footerAdmin.jsp" />

 