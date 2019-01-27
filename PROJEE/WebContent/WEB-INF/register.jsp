<%@ page import="dao.EcoleDao, dao.DaoFactory, beans.Ecole, java.util.List" %>

 <jsp:include page="header.jsp" />




<% 
	String actif = (String) request.getSession().getAttribute("ACTIF");
	if(actif != null && actif.equals("YES")){
    		response.sendRedirect(request.getContextPath() + "/index?action=main");    
    }
	DaoFactory fac = DaoFactory.getInstance();
	EcoleDao dao = new EcoleDao(fac);
	List<Ecole> list = dao.findAll();
	
%>
<div class="row row-eq-height">
          
          <!-- Register -->



          <div class="register_section d-flex flex-column align-items-center justify-content-center">
            <div class="register_content text-center" style="background-color: white; padding: 20px;">
                <h2 style="color:black;"> Inscrivez-vous </h2>
                <br>
                <% 
                 if (request.getParameterMap().containsKey("r")) {
            			out.print("<h3>email déja utilisé</h3>");
				}
          		%>
                
            
                <form method="post" action="index?action=registration">
                  <div class="form-row" >
                    <div class="form-group col-md-6">
                      <label for="inputName">Nom</label>
                      <input type="text" required class="form-control" id="inputName" placeholder="Nom" name = "nom">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="inputPrenom">Prenom</label>
                      <input type="text" required class="form-control" id="inputPrenom" placeholder="Prenom" name = "prenom">
                    </div>
                  </div>
                  <div class="form-row" >
                    <div class="form-group col-md-8">
                      <label for="inputEmail4">Email</label>
                      <input type="email" required class="form-control" id="inputEmail4" placeholder="Email" name = "email">
                    </div>
                    <div class="form-group col-md-4">
                      <label for="inputPassword4">Mot de passe</label>
                      <input type="password" required class="form-control" id="inputPassword4" placeholder="Password" name = "password">
                    </div>
                  </div>
                  <div class="form-row">
                    <div class="form-group col-md-8">
                      <label for="inputState">Je suis</label>
                      <select id="inputState" class="form-control" name="type">
                        <option selected value = "Etudiant">Etudiant</option>
                        <option  value = "Enseignant">Enseignant</option>
                        <option  value = "Administrateur">Administrateur</option>
                      </select>
                    </div>
                    <div class="form-group col-md-4">
                      <label for="inputEcole">Ecole</label>
                      <select id="inputEcole" class="form-control" name="ecole">
                       	<% 
                       		for(int i = 0; i < list.size(); i++){
                       	%>
                       	    		<option value = <% out.print("\"" + list.get(i).getName() + "\""); %>>  <% out.print(list.get(i).getName()); %> </option> 	
                       	<%		
                       		}
                       	%>
                      </select>
                    </div>
                  </div>
                  
                  <button type="submit" class="btn btn-primary">S'inscrire</button>
                </form>
              </div>
            </div>

        
      </div>

  <jsp:include page="footer.jsp" />

