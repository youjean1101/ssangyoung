package springweb.z9_homework;

public class a05_0125 {
	/*
	2023-01-25
	[1단계:개념] 1. 새로운 dao패키지, 새로운 dao와 새로운 mapper를 추가했을 때, 새로운 vo를 mybatis에 추가할 때, 처리할 내용을 기술하세요.
	[1단계:확인] 2. salgrade활용하여 select * from salgrade를 처리할려고 한다. 처리순서를 기술하세요. 
		sql : select * from salgrade
		vo : Salgrade
		dao : public List<Salgrade> getSalgrade();
		공통 mybatis
		mapper : 
			<select id ="getSalgrade" resultType="salgrade">
				select * from salgrade
		main()
			List<Salgrade> slist = dao.getSalgrade()
			System.out.println("등급 데이터 크기:"+slist.size());
			
	[1단계:확인] 3. a01_diexp.mybatis하위에 dao3패키지를 만들어 회원테이블을 조회할려고 한다. 처리순서와 내용 코드를 기술하세요.
	[1단계:개념] 4. resultType을 쓰는 경우와 resultMap을 쓰는 경우의 차이점을 기술하세요.  
		resultType : column과 property가 동일한 경우
		resultMap : column과 VO property가 다른 경우 및 1:다, 1:1객체로 설정 해야하는 경우
			select sal + nvl(comm,0) tot
			from emp
			column tot ==> Emp에 setSal 할당이 필요한 경우에 resultMap을 활용
			
	[1단계:확인] 5. 1대 다 resultMap 활용
	      1. select ename name, mgr manager, sal salaray from emp로 sql을 처리하여 mybatis에서 처리할려고 한다.vo를 변경하지 않고 처리하세요.
	      sql select ename name, mgr manager, sal salgray from emp
	      vo emp
	      dao	public List<Emp> getEmpList()
	      mapper
	       <resultMap id="empResult" type="emp">
	       		<result column = "name" property="ename"/>
	       		<result column = "manager" property="mgr"/>
	       		<result column = "salaray" property="sal"/>
	       <select id="getEmpList" resultMap="empResult">
	       		select ename name, mgr manager, sal salaray
	       		from emp
	      2. select deptno no, dname departname, loc location from dept sql 처리
	
	*/
}
