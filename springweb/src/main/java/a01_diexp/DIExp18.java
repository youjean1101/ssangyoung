package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z03_vo.Car;

public class DIExp18 {

	public static void main(String[] args) {
		//컨테이너 객체 호출 처리
		String path = "a01_diexp\\di18.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		//DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Car obj = ctx.getBean("car", Car.class);
		System.out.println("컨테이너의 객체호출:"+obj);
		System.out.println("종료");
		ctx.close();
		//di10.xml
		// <bean id="obj" class="java.lang.Object" />
	}
	}
