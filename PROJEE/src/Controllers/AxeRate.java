package Controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Answered;
import beans.Ecole;
import beans.EcoleChart;
import dao.AnsweredDao;
import dao.DaoFactory;
import dao.EcoleDao;


@WebServlet("/AxeRate")
public class AxeRate extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AxeRate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void doGet(HttpServletRequest request,
    		   HttpServletResponse response) throws ServletException, IOException {
    		 System.out.println("HOOO" + request.getParameter("id"));
    		  List<EcoleChart> listOfStudent = getAxeRate(Long.parseLong(request.getParameter("id")));
    		 
    		  Gson gson = new Gson();
    		 
    		  String jsonString = gson.toJson(listOfStudent);
    		 
    		  response.setContentType("application/json");
    		 
    		  response.getWriter().write(jsonString);
    		 
    		 }
    		 
    public List<EcoleChart> getAxeRate(long id) {
		System.out.println("the id is " + id);
		DaoFactory fac = DaoFactory.getInstance();
		EcoleDao ecole = fac.getEcoleDao();
		AnsweredDao ans = fac.getAnsweredDao();
		List<Ecole> list = ecole.findAll();
		List<Answered> listA = ans.findAll();
		int k = 0;
		List<EcoleChart> returned = new ArrayList<>();
			
		for(int i = 0; i < list.size();i++) {
			int count = 0;
			float sum = 0;
			for(int j = 0; j < listA.size(); j++) {
				if(listA.get(j).geteId() == list.get(i).getId() && listA.get(j).getqId() == id) {
					System.out.println(listA.get(j).geteId()+ " " + list.get(i).getId() + " " + listA.get(j).getqId() + " " + id);
					count++;
					sum += listA.get(j).getRate();
				}
			}
			if(count != 0) {
				returned.add(new EcoleChart(list.get(i).getName(), sum, count));
			}
		}
		
		return returned;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
