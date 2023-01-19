package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.backend.A01_Controller;
import a01_diexp.backend.A06_PareparedDao;
import a01_diexp.backend.DB;
import springweb.z01_vo.Dept;

public class DIExp21 {

	public static void main(String[] args) {
		//컨테이너 객체 호출 처리
		String path = "a01_diexp\\di21.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		//DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
//		DB obj = ctx.getBean("dbCon", DB.class);
//		System.out.println("컨테이너의 객체호출:"+obj);
//		A06_PareparedDao dao = ctx.getBean("a06_PareparedDao", A06_PareparedDao.class);
//		System.out.println("컨테이너의 객체호출:"+dao);
//		System.out.println("컨테이너의 객체호출:"+dao.getDeptList(new Dept(0,"","")).size());
		A01_Controller con =ctx.getBean("a01_Controller",A01_Controller.class);
		con.getDeptList(new Dept());
		
		System.out.println("종료");
		ctx.close();
		//di10.xml
		// <bean id="obj" class="java.lang.Object" />
	}
}
