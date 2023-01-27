package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Mart;
import a01_diexp.z01_vo.ShoppingMall;

public class DIExp13 {

	public static void main(String[] args) {
		//컨테이너 객체 호출 처리
		String path = "a01_diexp\\di13.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		//DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Mart mt01 = ctx.getBean("mt01", Mart.class);
		System.out.println("컨테이너의 객체호출:"+mt01);
		mt01.buyList();
		
		ShoppingMall shmem01 = ctx.getBean("shop01",ShoppingMall.class);
		System.out.println("컨테이너의 객체호출:"+shmem01);
		shmem01.memberList();
		System.out.println("종료");
		ctx.close();
		//di10.xml
		// <bean id="obj" class="java.lang.Object" />
	}
}
