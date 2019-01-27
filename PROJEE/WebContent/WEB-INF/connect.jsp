<%@ page import="dao.UtilisateurDao, dao.DaoFactory, beans.Utilisateur" %>

<% 
	String actif = (String) request.getSession().getAttribute("ACTIF");
	if(actif != null && actif.equals("YES")){
    		response.sendRedirect(request.getContextPath() + "/index");    
    }
	DaoFactory fac = DaoFactory.getInstance();
	UtilisateurDao dao = new UtilisateurDao(fac);
	Utilisateur user = dao.findAll((String)request.getParameter("email"), (String)request.getParameter("password"));
    	if(user == null){
    		response.sendRedirect(request.getContextPath() + "/index?action=login&r=error");    
    }
    else{
    		session.setAttribute("type", user.getType());
    		session.setAttribute("id", user.getId());
    		session.setAttribute("ecole", user.getEcole());
    		session.setAttribute("nom", user.getNom());
    		session.setAttribute("prenom", user.getPrenom());
    		session.setAttribute("ACTIF", "YES");

        if(((String)session.getAttribute("type")).equals("admin")){
    			response.sendRedirect(request.getContextPath() + "/index?action=adminmain");    
        }
        else{
        		System.out.print("<" + ((String)session.getAttribute("type")) + ">");
    			response.sendRedirect(request.getContextPath() + "/index?action=main");    
        }
    }
%>