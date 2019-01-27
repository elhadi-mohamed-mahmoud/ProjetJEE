<jsp:include page="header.jsp" />
    <% 	
String actif = (String) request.getSession().getAttribute("ACTIF");
if(actif != null && actif.equals("YES")){
	response.sendRedirect(request.getContextPath() + "/index?action=main");    
}	
 %>
 

  <!-- Register -->

  <div class="register">

    <div class="container-fluid">
      
      <div class="row row-eq-height">
        <div class="col-lg-6 nopadding">
          
          <!-- Register -->

          <div class="register_section d-flex flex-column align-items-center justify-content-center">
            <div class="register_content text-center">
              <h1 class="register_title">Inscrivez-vous et aidez à <span>évaluer</span> votre école</h1>
              <p class="register_text">Aidez à surmonter l’ensemble des problèmes relatifs aux méthodes d’évaluation traditionnelles ; donnez aux décideurs des données fiables et pertinentes sur lesquelles ils peuvent se baser pour prendre des décisions rationnelles</p>
              <div class="button button_1 register_button mx-auto trans_200"><a href="index?action=register">Inscrivez-vous</a></div>
            </div>
          </div>

        </div>

        <div class="col-lg-6 nopadding">
          
          <!-- connect -->

          <div class="search_section d-flex flex-column align-items-center justify-content-center">
            <div class="search_background" style="background-image:url(images/search_background.jpg);"></div>
            <div class="search_content text-center">
              
              <h1 class="search_title">Se connecter</h1>
              <% if(request.getParameterMap().containsKey("id")){
                out.print("<h3>email ou mot de passe incorrect</h3>");
              }
              %>
              <form id="search_form" class="search_form" action="index?action=connect" method="post">
                <input id="search_form_name" class="input_field search_form_name" type="text" placeholder="Utilisateur" required="required" data-error="Course name is required." name="email">
                <input id="search_form_degree" class="input_field search_form_degree" type="password" placeholder="Mot de passe" name="password">
                <button id="search_submit_button" type="submit" class="search_submit_button trans_200" value="Submit">se connecter</button>
              </form>
            </div> 
          </div>

        </div>
      </div>
    </div>
  </div>

  


  <!-- Footer -->
<jsp:include page="footer.jsp" />
  
