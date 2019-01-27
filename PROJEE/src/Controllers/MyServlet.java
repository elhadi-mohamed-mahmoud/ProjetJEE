package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MyServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = "home";
		if(request.getParameterMap().containsKey("action"))
			action = request.getParameter("action").toString();
		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/" + action + ".jsp" ).forward( request, response );
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = "home";
		if(request.getParameterMap().containsKey("action"))
			action = request.getParameter("action").toString();
		this.getServletContext().getRequestDispatcher( "/WEB-INF/" + action + ".jsp" ).forward( request, response );
	}

}
