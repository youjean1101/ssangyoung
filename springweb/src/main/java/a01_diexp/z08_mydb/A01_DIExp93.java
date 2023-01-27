package a01_diexp.z08_mydb;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z08_mydb.vo.BuyInfo;
import a01_diexp.z08_mydb.vo.Dept;
import a01_diexp.z08_mydb.vo.Emp;
import a01_diexp.z08_mydb.vo.EmpDeptCom;
import a01_diexp.z08_mydb.vo.Salgrade;

public class A01_DIExp93 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\z08_mydb\\a01_di93.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		A02_ExpDao dao = ctx.getBean("a02_ExpDao", A02_ExpDao.class);
		System.out.println("컨테이너의 객체호출:"+dao);
		System.out.println("데이터 건수:"+dao.getSalgrade().size());
		for(Salgrade s : dao.getSalgrade()) {
			System.out.print(s.getGrade()+"\t");
			System.out.print(s.getHisal()+"\t");
			System.out.print(s.getLosal()+"\n");
		}
		System.out.println("#사원 정보 #");
		for(Emp e:dao.getEmpList()) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\n");
		}
		System.out.println("#부서 정보#");
		for(Dept d:dao.getDeptList()) {
			System.out.print(d.getDeptno()+"\t");
			System.out.print(d.getDname()+"\t");
			System.out.println(d.getLoc()+"\t");
		}
		System.out.println("# 사원 부서 정보 건수:"+dao.getEempDeptList().size());
		for(EmpDeptCom com:dao.getEempDeptList()) {
			System.out.print(com.getEmp().getEname()+"\t");
			System.out.print(com.getDept().getDname()+"\n");
		}
		// ex) emp와 salgrade를 join하여 복합 EmpSalGd VO를 만들어 처리하세요.
		System.out.println("# 급여 등급 정보 건수:"+dao.getEmpSalgrade().size());
		System.out.println("# 사원 등록 #");
		dao.insertEmp(new Emp(0,"정길동","과장",7780,null,5000,1000,10));
		
		Emp emp = dao.getEmp(7499);  System.out.println("사원명:"+emp.getEname());		
		System.out.println("#데이터 삭제#");
		dao.deleteEmp(1001);
		List<BuyInfo> blist = dao.getBuyInfo();
		System.out.println("구매건수:"+blist.size());
		for(BuyInfo bi:blist) {
			System.out.print(bi.getMember().getName()+"\t");
			System.out.print(bi.getProduct().getName()+"\t");
			System.out.print(bi.getProduct().getBcnt()+"\n");
		}
		System.out.println("종료");
		ctx.close();
		// di10.xml
		// <bean id="obj" class="java.lang.Object" />

		
		
	}

}
