package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Person;
import a01_diexp.z01_vo.Product;

public class DIExp15 {

	public static void main(String[] args) {
		//컨테이너 객체 호출 처리
		String path = "a01_diexp\\di15.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		//DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
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
		Product pro01 = ctx.getBean("pro01",Product.class);
		System.out.println("컨테이너의 객체호출:"+pro01);
		System.out.println("컨테이너의 객체호출:"+pro01.getPname());
		System.out.println("컨테이너의 객체호출:"+pro01.getPrice());
		System.out.println("컨테이너의 객체호출:"+pro01.getCnt());
		// ex) Propert pro02,Product pro03 생성자로 설정 및 호출하세요.
		Product pro02 = ctx.getBean("pro02",Product.class);
		Product pro03 = ctx.getBean("pro03",Product.class);
		System.out.println(pro02.getPname());
		System.out.println(pro02.getPrice());
		System.out.println(pro02.getCnt());
		
		System.out.println(pro03.getPname());
		System.out.println(pro03.getPrice());
		System.out.println(pro03.getCnt());
		
		System.out.println("종료");
		ctx.close();
	}
}
