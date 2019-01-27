<%@ page import="beans.*, dao.*, java.util.*" %>

<%!
DaoFactory fac = DaoFactory.getInstance();
AnsweredDao dao = fac.getAnsweredDao();
EcoleDao eDao = fac.getEcoleDao();
%>

<%!

public List<EcoleChart> getAxeRes(int id) {
	List<Ecole> list = eDao.findAll();
	List<Answered> listA = dao.findAll();
	int k = 0;
	List<EcoleChart> returned = new ArrayList();
		
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

public float getAns(List<EcoleChart> array, String name){
	for(int i = 0; i < array.size(); i++){
		if(array.get(i).getEcole().equals(name))
			return array.get(i).getSum() / array.get(i).getCount();
		else
			System.out.println("<" + array.get(i).getEcole() + "> <" + name + ">");
	}
	return 0f;
}

%>

<% 

List<EcoleChart> axe1 = getAxeRes(1);
List<EcoleChart> axe2 = getAxeRes(2);
List<EcoleChart> axe3 = getAxeRes(3);
List<EcoleChart> axe4 = getAxeRes(4);
List<EcoleChart> axe5 = getAxeRes(5);
List<EcoleChart> axe6 = getAxeRes(6);

List<Ecole> ecole = eDao.findAll();
%>
 <jsp:include page="headerAdmin.jsp" />

<div style="background: white; padding: 100px">
    
    <div class="container">
      <div class="row">
        <div class="col">
          <div class="section_title text-center">
            <h1 style="padding-bottom: 50px;">Les resultats d'evaluation par ecole</h1>
          </div>
        </div>
      </div>

<table style="margin-top: 50px;" class="table" width="400">
  <thead class="thead-dark">
    <tr>
      <th class="col-md-1">L'ecole</th>
      <th class="col-md-2">ORGANISATION DE L'ENSEIGNEMENT</th>
      <th class="col-md-2">PROCESSUS DE FORMATION</th>
      <th class="col-md-2">PROGRAMME DE FORMATION</th>
      <th class="col-md-2">RESSOURCES HUMAINES</th>
      <th class="col-md-2">RESSOURCES MATERIELLE</th>
      <th class="col-md-1">RESULTATS</th>
    </tr>
  </thead>
  <tbody>
  	<%for(int i = 0; i < ecole.size(); i++){ %>
  		<tr>
	      <th scope="row"><% out.print(ecole.get(i).getName()); %></th>
	      <td> <% out.print(getAns(axe1, ecole.get(i).getName())); %> </td>
        <td> <% out.print(getAns(axe2, ecole.get(i).getName())); %> </td>
        <td> <% out.print(getAns(axe3, ecole.get(i).getName())); %></td>
        <td> <% out.print(getAns(axe4, ecole.get(i).getName())); %> </td>
        <td> <% out.print(getAns(axe5, ecole.get(i).getName())); %> </td>
        <td> <% out.print(getAns(axe6, ecole.get(i).getName())); %> </td>
	    </tr>
  	<%} %>
    
  </tbody>
</table>
</div>
</div>
 <jsp:include page="footerAdmin.jsp" />
