package a01_diexp.z08_mydb;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z08_mydb.vo.Dept;
import a01_diexp.z08_mydb.vo.Emp;
import a01_diexp.z08_mydb.vo.Z01__0120_hwDao;

public class A01_DIExp94_hw {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\z08_mydb\\a01_di94_hw.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Z01__0120_hwDao dao = ctx.getBean("z01__0120_hwDao", Z01__0120_hwDao.class);
		System.out.println("컨테이너의 객체호출:"+dao);
	
		System.out.println("# 최고 관리자 번호 :"+dao.getMaxMgr());
		
		System.out.println("# 40번 부서의 최근 입사자의 입사일 : "+dao.getDeptnoMaxHiredate());
		
		System.out.println("# 직책이 SALESMAN의 최저 급여 : "+dao.getJobMinSal());
		
		System.out.println("# 연봉이 2000~4000 구간의 사원의 수 :"+dao.getSalcount());
		
		System.out.println("# 1/4분기에 입사한 사원의 수 :"+dao.getQcount());
		
		System.out.println("# 직책이 MANAGER인 사원의 최고 급여자 #");
		for(Emp e:dao.getJobMaxSal()) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\n");
		}
		System.out.println("# 부서번호가 10인 부서정보 #");
		for(Dept e:dao.getDeptno()) {
			System.out.print(e.getDeptno()+"\t");
			System.out.print(e.getDname()+"\t");
			System.out.print(e.getLoc()+"\t");
		}
		System.out.println("# 사원명이 TURNER인 사원의 정보 #");
		for(Emp e:dao.getEname()) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\n");
		}
		System.out.println("# 최초 입사자의 사원 정보 #");
		for(Emp e:dao.getRecentHiredate()) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\n");
		}
		System.out.println("# 2/4분기 최고 급여자의 정보 #");
		for(Emp e:dao.getSalQ()) {
			System.out.print(e.getEmpno()+"\t");
			System.out.print(e.getEname()+"\t");
			System.out.print(e.getJob()+"\t");
			System.out.print(e.getSal()+"\n");
		}
		
		System.out.println("종료");
		ctx.close();
	}
}
