package a01_diexp;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.mybatis.dao.A01_EmpDao;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
import springweb.z01_vo.EmpDept;
import springweb.z01_vo.EmpDeptCom;
import springweb.z01_vo.EmpGrade;

public class DIExp22 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di22.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		// A01_EmpDao
		A01_EmpDao dao = ctx.getBean("a01_EmpDao", A01_EmpDao.class);
		System.out.println("컨테이너의 객체호출:"+dao.getEmpList(new Emp("","")).size());
		System.out.println("사원의 수:"+dao.empCount());
		System.out.println("최대 급여:"+dao.empMaxSal());
		System.out.println("사원명:"+dao.getEname());	
		System.out.println("부서의 최고 급여:"+dao.getMaxSalByDept());	
		System.out.println("최대 관리자 번호:"+dao.getMaxMgr());	
		System.out.println("사원명에 의한 직책명:"+dao.getJobByEname());	
		Emp emp01 = dao.getEmpByEmpno();
		System.out.println("객체의 사원번호:"+emp01.getEmpno());
		System.out.println("객체의 사원명:"+emp01.getEname());	
		System.out.println("종료");
		Emp emp02 = dao.getEmpByEname();
		System.out.println("# 사원명으로 가져온 사원정보 #");
		System.out.println("사원번호:"+emp02.getEmpno());
		System.out.println("사원명:"+emp02.getEname());
		System.out.println("급여:"+emp02.getSal());
		
		// di10.xml
		// <bean id="obj" class="java.lang.Object" />
		Dept dep01 = dao.getDeptByDeptno();
		System.out.println("#과제#");
		System.out.println("부서번호:"+dep01.getDeptno());
		System.out.println("부서명:"+dep01.getDname());
		System.out.println("부서위치:"+dep01.getLoc());
		Emp initEmp = dao.getInitHire();
		System.out.println("#최초입사자#");
		System.out.println("사원번호:"+initEmp.getEmpno());
		System.out.println("사원명:"+initEmp.getEname());
		Emp emp= dao.getMaxSalByTerms();
		System.out.println("2사분기 최고 급여자");
		System.out.println("사원번호:"+emp.getEmpno());
		System.out.println("사원명:"+emp.getEname());
		System.out.println("급여:"+emp.getSal());
		List<EmpDept> edList = dao.getEmpDeptList();
		System.out.println("#사원 부서정보 다중 열:"
				+edList.size());
		for(EmpDept ed:edList) {
			System.out.print(ed.getEname()+"\t");
			System.out.println(ed.getDname());
		}
		List<EmpGrade> egrade = dao.getEmpSalGrade();
		System.out.println("등급별 사원정보");
		for(EmpGrade eg:egrade) {
			System.out.print(eg.getEname()+"\t");
			System.out.print(eg.getSal()+"\t");
			System.out.print(eg.getGrade()+"\n");
		}
		List<EmpDeptCom> comps = dao.getEmpDeptList2();
		System.out.println("# 객체안에 객체 #");
		for(EmpDeptCom ed:comps) {
			System.out.print(ed.getEmp().getEname()+"\t");
			System.out.println(ed.getDept().getDname());
		}
		
		ctx.close();
		
	}

}
