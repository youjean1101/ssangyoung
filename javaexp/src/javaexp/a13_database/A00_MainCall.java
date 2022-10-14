package javaexp.a13_database;

import java.util.List;

import javaexp.a13_database.vo2.Emp01;

public class A00_MainCall {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Dao를 만들어 놓으면 어느 위치에서든지 해당 객체를 생성해서
		// 사용할 수 있다.
		// 로그인처리 : 다른 프로그램 해당 항목에서 처리하고,
		// 데이터베이스 연동한 호출해서 처리한다.
		
		A04_DaoExp dao = new A04_DaoExp();
		System.out.println("#emp1#");
		List<Emp01> list = dao.getSch01(10);
		for(Emp01 e:list) {
			System.out.print(e.getDeptno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\n");
		}
	}

}
