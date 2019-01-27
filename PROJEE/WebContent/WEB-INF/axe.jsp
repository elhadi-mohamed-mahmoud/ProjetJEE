<%@ page import="beans.*, dao.*, java.util.*" %>

<%
String actif = (String) request.getSession().getAttribute("ACTIF");
if(actif == null || !actif.equals("YES")){
	response.sendRedirect(request.getContextPath() + "/index?action=login");    
}	

DaoFactory fac = DaoFactory.getInstance();
AxeDao dao = fac.getAxeDao();

String name = dao.getAxe(Long.parseLong(request.getParameter("id")));
AnsweredDao daoA = fac.getAnsweredDao();
QuestionDao daoQ = fac.getQuestionDao();
PropositionDao daoP = fac.getPropositionDao();
int nb = 1;
float sum = 0;
List<Question> array = null;
List<Proposition> arr = null;
if(daoA.findAll(Long.parseLong(request.getParameter("id")), (Long)session.getAttribute("id")).size() == 0){
		array = daoQ.findAll(Long.parseLong(request.getParameter("id")));		
		
		if(request.getParameter("nb") != null){
			nb = Integer.parseInt(request.getParameter("nb")) + 1;
			sum = Float.parseFloat(request.getParameter("sum")) + Float.parseFloat(request.getParameter("q_answer"));
		}
		
		if(nb > array.size()){
			Answered ans = new Answered();
			//ans.seteId((Long)session.getAttribute("ecole"));
			ans.setqId(Long.parseLong(request.getParameter("id")));
			ans.setRate(sum / (float)(nb - 1));
			ans.setuId((Long)session.getAttribute("id"));
			ans.setId((long)daoA.getMaxId() + 1);
			daoA.save(ans);
			response.sendRedirect(request.getContextPath() + "/index?action=main");    
		}
		else	
			arr = daoP.findAll(array.get(nb - 1).getId());
	}
%>

  <jsp:include page="header.jsp" />

 <div style="background: white; padding : 100px">
<%
  if(daoA.findAll(Long.parseLong(request.getParameter("id")), (Long)session.getAttribute("id")).size() > 0){
    out.print("<center style=\"padding:60px;\"><h2> vous avez deja répondu a ce questionnaire</h2></center>");
    out.print("<center> <h3> les statistiques des ecoles sur l'axe " + name  + "</h3></center>");
    out.print("<div id=\"chart-container\">");
    out.print("<canvas id=\"mycanvas\"></canvas>");
    out.print("</div>");
  }
  else{
	  out.print("<center style=\"padding:60px;> <h3> Le questionnaire de l'axe " + name + "</h3></center>");
%>
      <div class="modal-content">
         <div class="modal-header">

            <h3><span class="label label-warning" id="qid"><% out.print(nb); %></span><% out.print("   " + array.get(nb - 1).getName()); %></h3>
        </div>
        <div class="modal-body">
            <div class="col-xs-3 col-xs-offset-5">
               <div id="loadbar" style="display: none;">
                  <div class="blockG" id="rotateG_01"></div>
                  <div class="blockG" id="rotateG_02"></div>
                  <div class="blockG" id="rotateG_03"></div>
                  <div class="blockG" id="rotateG_04"></div>
                  <div class="blockG" id="rotateG_05"></div>
                  <div class="blockG" id="rotateG_06"></div>
                  <div class="blockG" id="rotateG_07"></div>
                  <div class="blockG" id="rotateG_08"></div>
              </div>
          </div>
          <form method = "post"
          <%
            if(nb == array.size())
              out.print("onsubmit=\"return confirm('Are you sure you want to submit this form?');\"");
          
          %>
          >
            <input hidden="true" name = "nb" value = "<% out.print(nb);%>">
            <input hidden="true" name = "sum" value = "<% out.print(sum);%>">
            <div class="quiz" id="quiz" data-toggle="buttons">
              <%
                for (int i = 0; i < arr.size(); i++) {
                  out.print ("<label class=\"element-animation1 btn btn-lg btn-primary btn-block\"><span class=\"btn-label\"><i class=\"glyphicon glyphicon-chevron-right\"></i></span> <input type=\"radio\" name=\"q_answer\" value=\"" + arr.get(i).getRate() + "\">" + arr.get(i).getProposition() + "</label>");  
                }
              %>
            </div>
            <input type = "submit" style="color: white; float: right; margin-top: 30px; background-color: #EB9E3E; padding: 10px; font-size: 20px; border-radius: 18px;-moz-border-radius: 5px;" value = "
            <%
              if(nb < array.size())
            	  	out.print ("suivant");
              else
          	  	out.print ("terminer");
            %>
            ">
          </form>
   </div>
   <div class="modal-footer text-muted">
    <span id="answer"></span>
</div>
</div>
<%
}
%>
</div>
  <jsp:include page="footer.jsp" />

