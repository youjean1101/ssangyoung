package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z03_vo.Car;
import a01_diexp.z03_vo.Member;

public class DIExp18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di18.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Car car = ctx.getBean("car", Car.class);
		Member member = ctx.getBean("member", Member.class);
		System.out.println("컨테이너의 객체호출:"+car);
		System.out.println("컨테이너의 객체호출:"+member);
		System.out.println("종료");
		ctx.close();
		// 16:05~
		// 

		
		
	}

}
