package a01_diexp.z9_homework;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z06_vo.Music;
import a01_diexp.z06_vo.Person;
import a01_diexp.z06_vo.Product;
import a01_diexp.z9_homework.vo.BusDriver;
import a01_diexp.z9_homework.vo.Pencil;

public class DIHomeWork0117 {
	
	public static void main(String[] args) {
		String path = "a01_diexp\\z9_homework\\di0117.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		//Object obj = ctx.getBean("obj", Object.class);
		/*
		 [1단계:확인] 10. Pencil과 Eraser를 1:1관계로 설정하고 의존성 자동 주입으로 처리해보세요.(byType)
		*/
		Pencil pen01 = ctx.getBean("pen01", Pencil.class);
		pen01.eraserInfo();
		/*
		 [1단계:확인] 11. BusDriver와 Bus를 선언하고 버스기사가 여러 대의 버스가운데 선택된 의존성 자동 주입을 처리해보세요(byName)
		 */
		BusDriver driver01 = ctx.getBean("driver01", BusDriver.class);
		driver01.busInfo();
		/*
		 [1단계:확인] 13. z06_vo 패키지에 Person, Product, Music 클래스를 복사하고  컨테이너에서 해당 객체들을 호출하게 처리하세요
		 */
		Music music = ctx.getBean("music", Music.class);
		Person person = ctx.getBean("person", Person.class);
		Product product = ctx.getBean("product", Product.class);
		System.out.println("컨테이너의 객체호출:"+music);
		System.out.println("컨테이너의 객체호출:"+person);
		System.out.println("컨테이너의 객체호출:"+product);
		System.out.println("종료");
		ctx.close();
	}
}
