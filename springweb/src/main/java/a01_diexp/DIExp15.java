package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Person;
import a01_diexp.z01_vo.Product;

public class DIExp15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di15.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Person p01 = ctx.getBean("p01", Person.class);
		Person p02 = ctx.getBean("p02", Person.class);
		Person p03 = ctx.getBean("p03", Person.class);
		System.out.println("컨테이너의 객체호출:"+p01);
		System.out.println("컨테이너의 객체호출:"+p01.getName());
		System.out.println("컨테이너의 객체호출:"+p02.getName());
		System.out.println("컨테이너의 객체호출:"+p03.getName());
		System.out.println("컨테이너의 객체호출:"+p01.getAge());
		System.out.println("컨테이너의 객체호출:"+p01.getLoc());
		// ex) Product로 namespace로 설정해서 pro01로 호출하여 출력
		Product prod01 = ctx.getBean("prod01", Product.class);
		Product prod02 = ctx.getBean("prod02", Product.class);
		Product prod03 = ctx.getBean("prod03", Product.class);
		System.out.println(prod01.getName());
		System.out.println(prod02.getName());
		System.out.println(prod03.getName());
		System.out.println(prod01.getPrice());
		System.out.println(prod01.getCnt());
		// ex) Product prod02,Product prod03 생성자로 
		// 설정 및 호출하세요.
		
		System.out.println("종료");
		ctx.close();
		// di10.xml
		// <bean id="obj" class="java.lang.Object" />

		
		
	}

}
