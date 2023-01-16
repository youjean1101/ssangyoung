package a01_diexp.z9_homework;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z9_homework.vo.Car;
import a01_diexp.z9_homework.vo.Pocket;

public class DIHomeWork0116 {
	
	public static void main(String[] args) {
		String path = "a01_diexp\\z9_homework\\di0116.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		//Object obj = ctx.getBean("obj", Object.class);
		/*
		 [1단계:확인] 2. 호주머니 클래스를 선언하고 여기담긴 구슬을 Set로 할당하고, 호출하는 클래스와 di를 설정하고 호출하세요
		 */
		Pocket pck01 = ctx.getBean("pocket01", Pocket.class);
		System.out.println("호주머니에 있는 구슬:"+pck01.getMarble());
		
		/*
		 [1단계:확인] 3. Car클래스에 Tire클래스(제조사,가격)을 List로 추가하여 1:다로 처리되는 di를 선언하고 호출하세요.
		 */
		
		Car car01 = ctx.getBean("car01",Car.class);
		car01.tireInfo();
		
		/*
		 [1단계:확인] 4. Map/Properties의 차이점을 기술하고, BaseTeam클래스에 타석 순서별 선수명를 Map으로, 수비역할별 선수명을 Properties로 DI로 할당하여 출력 처리하세요
		 */
		System.out.println("종료");
		ctx.close();
	}
}
