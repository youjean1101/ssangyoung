package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Music;
import a01_diexp.z01_vo.Person;
import a01_diexp.z01_vo.Product;

public class DIExp11 {

	public static void main(String[] args) {
		//컨테이너 객체 호출 처리
		String path = "a01_diexp\\di11.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		//DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Person p01 = ctx.getBean("p01", Person.class);
		System.out.println("컨테이너의 객체호출:"+p01);
		System.out.println("이름:"+p01.getName());
		System.out.println("나이:"+p01.getAge());
		System.out.println("사는곳:"+p01.getLoc());
		
		// 여기서 prod01 Product객체 호출 후, 메서드 출력
		
		//di11.xml
		// <bean id="obj" class="java.lang.Object" />
		// ex) vo a01_diexp.z01_vo 하위에 Product 클래스 만들고,
		//	di11.xml에서 prod01로 물건명 가격, 갯수 선언 및 할당 후..
		// 여기서 prod01 Product객체 호출 후, 메서드 출력.
		Product prod01 = ctx.getBean("prod01",Product.class);
		System.out.println("물건명:"+prod01.getPname());
		System.out.println("가격:"+prod01.getPrice());
		System.out.println("갯수:"+prod01.getCnt());
		
		System.out.println("#두번째 객체#");
		Product prod02 = ctx.getBean("prod02",Product.class);
		System.out.println("물건명:"+prod02.getPname());
		System.out.println("가격:"+prod02.getPrice());
		System.out.println("갯수:"+prod02.getCnt());
		
		// ex) vo Music title, singer를 선언하여 컨테이너에서 생성자를 객체 생성 후, 호출
		Music mu01 = ctx.getBean("music01",Music.class);
		System.out.println("# 음악 객체 호출 #");
		System.out.println("가수:"+mu01.getTitle());
		System.out.println("노래:"+mu01.getSinger());
		
		System.out.println("종료");
		ctx.close();
	}
}
