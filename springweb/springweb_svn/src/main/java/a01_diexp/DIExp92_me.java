package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z07_me_web.H01_Controller;
import springweb.z01_vo.Emp;

public class DIExp92_me {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di92_me.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		H01_Controller empCtrl = ctx.getBean("h01_Controller", H01_Controller.class);
		System.out.println("컨테이너호출:"+empCtrl);
		empCtrl.showEmpList(new Emp());
		System.out.println("종료");
		ctx.close();
		// di10.xml
		// <bean id="obj" class="java.lang.Object" />

		
		
	}

}
