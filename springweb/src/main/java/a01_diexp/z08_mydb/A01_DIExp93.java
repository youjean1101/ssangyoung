package a01_diexp.z08_mydb;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z08_mydb.vo.Salgrade;

public class A01_DIExp93 {

	public static void main(String[] args) {
		//컨테이너 객체 호출 처리
		String path = "a01_diexp\\z08_mydb\\a01_di93.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		//DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		A02_ExpDao dao = ctx.getBean("a02_ExpDao", A02_ExpDao.class);
		System.out.println("컨테이너의 객체호출:"+dao);
		System.out.println("데이터 건수:"+dao.getSalgrade().size());
		for(Salgrade s:dao.getSalgrade()) {
			System.out.print(s.getGrade()+"\t");
			System.out.print(s.getLosal()+"\t");
			System.out.print(s.getHisal()+"\n");
		}
		System.out.println("종료");
		ctx.close();
		//di10.xml
		// <bean id="obj" class="java.lang.Object" />
	}
}
