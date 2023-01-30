package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z05_vo.Computer;
import a01_diexp.z05_vo.Mart;
import a01_diexp.z05_vo.Product;
import a01_diexp.z05_vo.Product2;
import a01_diexp.z05_vo.Product3;
import a01_diexp.z05_vo.Product4;
import a01_diexp.z05_vo.Ram;

public class DIExp20 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di20.xml";
		AbstractApplicationContext 
		ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Ram ram = ctx.getBean("ram", Ram.class);
		System.out.println("컨테이너의 객체호출:"+ram);
		ram.setCompany("하이닉스");
		ram.setMemory("16G"); 
		Computer computer = ctx.getBean("computer", Computer.class);
		System.out.println("컨테이너의 객체호출:"+computer);
		computer.setCompany("애플");
		computer.showInfo();
		
		Mart mart = ctx.getBean("mart", Mart.class);
		mart.setMname("행복마트");
		Product product = ctx.getBean("product", Product.class);
		product.setName("사과");
		product.setPrice(3000);
		product.setCnt(20);
		Product3 product3 = ctx.getBean("product3", Product3.class);
		product3.setName("바나나");
		product3.setPrice(2000);
		product3.setCnt(5);
		Product2 product2 = ctx.getBean("product2", Product2.class);
		product2.setName("딸기");
		product2.setPrice(4000);
		product2.setCnt(3);
		Product4 product4 = ctx.getBean("product4", Product4.class);
		product4.setName("오렌지");
		product4.setPrice(2200);
		product4.setCnt(2);
		
		mart.buyList();
		System.out.println("컨테이너의 객체호출:"+computer);
	
		System.out.println("종료");
		ctx.close();
		/*
		# 처리 순서
		1. Computer, Ram 1:1관계 및 출력기능메서드 처리
		2. di20.xml 컨테이너 안에 객체 로딩
		3. Computer에 소스상 Autowire 처리
		4. main()에서 Ram객체 호출 및 데이터 처리
		5. main()에서 Computer객체 호출 및 제조사 처리
		6. main()에서 Computer의 출력메서드 처리
		 * */

		
		
	}

}
