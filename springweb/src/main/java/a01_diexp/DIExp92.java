package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z07_web.A01_Controller;
import springweb.z01_vo.Emp;
public class DIExp92 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di92.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		A01_Controller empCtrl = 
				ctx.getBean("a01_Controller", 
						A01_Controller.class);
		empCtrl.showEmpList(new Emp());
		System.out.println("종료");
		ctx.close();
		
	}

}
