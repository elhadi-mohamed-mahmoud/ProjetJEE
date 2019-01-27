package dao;

import beans.Answered;
import beans.Axe;

public class Main {
	public static void main(String ...strings) {
		DaoFactory df = DaoFactory.getInstance();
		AxeDao axeDao = df.getAxeDao();
		for (Axe axe : axeDao.findAll()) {
			System.out.println(axe.getName());
		}
		axeDao.delete(7l);
		for (Axe axe : axeDao.findAll()) {
			System.out.println(axe.getName());
		}
	}
}
