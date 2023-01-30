package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z06_vo.Mart;
import a01_diexp.z06_vo.Member;
import a01_diexp.z06_vo.Member2;
import a01_diexp.z06_vo.Member3;
import a01_diexp.z06_vo.Product;
import a01_diexp.z06_vo.ShoppingMall;

public class DIExp91 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di91.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		
		Product pro = ctx.getBean("product", Product.class);
		System.out.println("컨테이너의 객체호출:"+pro);
		pro.setName("사과");
		pro.setPrice(3000);
		pro.setCnt(3);
		Mart mart = ctx.getBean("mart", Mart.class);
		System.out.println("컨테이너의 객체호출:"+mart);
		mart.setMname("홈플러스");
		mart.buyList();
		
		ShoppingMall shop = ctx.getBean("shoppingMall", ShoppingMall.class);
		Member mem01 = ctx.getBean("member", Member.class);
		Member2 mem02 = ctx.getBean("member2", Member2.class);
		Member3 mem03 = ctx.getBean("member3", Member3.class);
		shop.setTitle("이마트");
		
		mem01.setId("himan");
		mem01.setPass("1234");
		mem01.setName("홍길동");
		mem01.setAuth("회원");
		mem01.setPoint(3000);
		
		mem02.setId("higirl");
		mem02.setPass("0000");
		mem02.setName("김길순");
		mem02.setAuth("관리자");
		mem02.setPoint(100000);
		
		mem03.setId("goodman");
		mem03.setPass("7777");
		mem03.setName("남길동");
		mem03.setAuth("회원");
		mem03.setPoint(5000);
		
		shop.showMemberList();
		
		System.out.println("종료");
		ctx.close();
		// di10.xml
		// <bean id="obj" class="java.lang.Object" />

		
		
	}

}
