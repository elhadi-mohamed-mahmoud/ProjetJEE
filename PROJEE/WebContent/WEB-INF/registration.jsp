<%@ page import="dao.UtilisateurDao, dao.DaoFactory, beans.Utilisateur" %>

<%
DaoFactory fac = DaoFactory.getInstance();
UtilisateurDao dao = fac.getUtilisateurDao();
Utilisateur user = new Utilisateur();
user.setEcole((String)request.getParameter("ecole"));
user.setEmail((String)request.getParameter("email"));
user.setNom((String)request.getParameter("nom"));
user.setPrenom((String)request.getParameter("prenom"));
user.setPassword((String)request.getParameter("password"));
user.setId(dao.getMaxId() + 1);
user.setType((String)request.getParameter("type"));

dao.save(user);

session.setAttribute("type", user.getType());
session.setAttribute("id", user.getId());
session.setAttribute("ecole", user.getEcole());
session.setAttribute("nom", user.getNom());
session.setAttribute("prenom", user.getPrenom());
session.setAttribute("ACTIF", "YES");

response.sendRedirect(request.getContextPath() + "/index?action=main");    

%>