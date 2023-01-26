package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.BaseBallTeam;
import a01_diexp.z01_vo.Car02;

public class DIExp90 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di90.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Car02 car01 = ctx.getBean("car01", Car02.class);
		System.out.println("컨테이너의 객체호출:"+car01);
		car01.showMyTire();
		
		BaseBallTeam bt = ctx.getBean("bt01", BaseBallTeam.class);
		System.out.println("컨테이너의 객체호출:"+bt);
		System.out.println("컨테이너의 객체호출:"+bt.getHitOrders());
		System.out.println("컨테이너의 객체호출:"+bt.getDefends());
		
		System.out.println("종료");
		ctx.close();
		// di10.xml
		// <bean id="obj" class="java.lang.Object" />

		
		
	}

}
