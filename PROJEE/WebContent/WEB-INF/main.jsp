 <jsp:include page="header.jsp" />
<% 	
String actif = (String) request.getSession().getAttribute("ACTIF");
if(actif == null || !actif.equals("YES")){
	response.sendRedirect(request.getContextPath() + "/index?action=login");    
}	
 %>
 
 <div class="row row-eq-height">
          
          <!-- Register -->

          <div class="register_section d-flex flex-column align-items-center justify-content-center">
            <div class="register_content text-center">
              <h1 class="register_title">Bienvenue <% out.print(session.getAttribute("nom") + " " + session.getAttribute("prenom")); %> </h1>
          </div>
          </div>

        
      </div>

<!-- Services -->

 <div style="background: white; padding : 100px">
	<% String type = (String) session.getAttribute("type").toString(); %>    

    <div class="container">
      <div class="row">
        <div class="col">
          <div class="section_title text-center">
            <h1 style="padding-bottom: 100px;">Les axes a evaluer</h1>
          </div>
        </div>
      </div>
      <div class="row services_row">      
      <% if(type.equals("Etudiant") || type.equals("Enseignant")){ %>
        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
          <div class="icon_container d-flex flex-column justify-content-end">
            <img src="${pageContext.request.contextPath}/images/earth-globe.svg" alt="">
          </div>
            <li class="main_nav_item"><a href="index?action=axe&id=1" style="font-size: 20px;">ORGANISATION DE L'ENSEIGNEMENT</a></li>
         
        </div>
      <% }

    	  		%>


      <% if(type.equals("Etudiant")){ %>
        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
          <div class="icon_container d-flex flex-column justify-content-end">
            <img src="${pageContext.request.contextPath}/images/exam.svg" alt="">
          </div>
          <li class="main_nav_item"><a href="index?action=axe&id=2" style="font-size: 20px;">PROCESSUS DE FORMATION</a></li>
        </div>
      <% } %>

      <% if(type.equals("Etudiant") || type.equals("Enseignant")){ %>
        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
          <div class="icon_container d-flex flex-column justify-content-end">
            <img src="${pageContext.request.contextPath}/images/books.svg" alt="">
          </div>
          <li class="main_nav_item"><a href="index?action=axe&id=3" style="font-size: 20px;">PROGRAMME DE FORMATION</a></li>
        </div>
      <% } %>

      <% if(type.equals("Administrateur") || type.equals("Enseignant")){ %>
        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
          <div class="icon_container d-flex flex-column justify-content-end">
            <img src="${pageContext.request.contextPath}/images/professor.svg" alt="">
          </div>
          <li class="main_nav_item"><a href="index?action=axe&id=4" style="font-size: 20px;">RESSOURCES HUMAINES</a></li> 
            
        </div>
      <% } %>

      <% if(type.equals("Etudiant") || type.equals("Enseignant")){ %>
        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start" >
          <div class="icon_container d-flex flex-column justify-content-end" >
            <img src="${pageContext.request.contextPath}/images/blackboard.svg" alt="">
          </div>
          <li class="main_nav_item"><a href="index?action=axe&id=5" style="font-size: 20px;">RESSOURCES MATERIELLE</a></li>
     
        </div>
      <% } %>

      <% if(type.equals("Administrateur") || type.equals("Enseignant")){ %>
        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
          <div class="icon_container d-flex flex-column justify-content-end">
            <img src="${pageContext.request.contextPath}/images/mortarboard.svg" alt="">
          </div>
          <li class="main_nav_item"><a href="index?action=axe&id=6" style="font-size: 20px;">RESULTATS</a></li>
                                            <% System.out.println("RESULTATS"); %>
         
        </div>
      <% } %>
      </div>
    </div>
  </div>
  
  <jsp:include page="footer.jsp" />
  