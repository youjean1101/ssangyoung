package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z04_vo.Car;
import a01_diexp.z04_vo.CarRacer;

public class DIExp19 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di19.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Car car = ctx.getBean("car", Car.class);
		car.setName("그랜저");
		car.setMaxSpeed(250);
		CarRacer carRacer = ctx.getBean("carRacer", CarRacer.class);
		System.out.println("컨테이너의 객체호출:"+carRacer);
		carRacer.setName("홍길동");
		carRacer.driving();
		System.out.println("종료");
		ctx.close();
		// di10.xml
		// <bean id="obj" class="java.lang.Object" />

		
		
	}

}
