package a01_diexp.z9_homework;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z9_homework.vo.BaseBallPlayer;
import a01_diexp.z9_homework.vo.BaseTeam;
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
		 	1) Tire 클래스 Company, price
		 	2) Car 클래스
		 		String kind;
		 		List<Tire> tlist;
		 		public void setTlist(List<Tire> tlist)
		 		public void showMyTire(){
		 			System.out.println("차량종류:"+kind);
		 			if(tlist!=null && tlist.size()>0){
			 			for(Tire t:tlist){
			 				System.out.println(t.getCompany+"\t"+t.getPrice());
			 			}
			 		}else{
			 			System.out.println("타이어가 장착되지 않았습니다.");
			 		}
		 		}
		 	3) DI 선언
		 		<property name="tlist">
		 			<list>
		 				<bean ref="tire01">
		 				<bean ref="tire02">
		 */
		
		Car car01 = ctx.getBean("car01",Car.class);
		car01.tireInfo();
		//정답
		Car c01 = ctx.getBean("c01",Car.class);
		c01.tireInfo();
			
		/*
		[1단계:확인] 4. Map/Properties의 차이점을 기술하고, BaseTeam클래스에 타석 순서별 선수명를 Map으로, 수비역할별 선수명을 Properties로 DI로 할당하여 출력 처리하세요
			Map : generic으로 type지정 <map><entry key="" value="">
			Properties : type을 자유롭게 사용 <props><prop key="">값 설정</>
			class BaseTeam{
				private Map<Integer, String> hitOrders;
				private Properties defends;
			}
			<property name="hitOrders">
				<map>
					<entry key="1" value="홍길동"/>
					<entry key="2" value="김길동"/>
					<entry key="3" value="신길동"/>
					..
					<entry key="9" value="마길동"/>
			<property name="defends">
				<props>
					<prop key="투수" value="김길동" />
					<prop key="포수" value="신길동" />
					<prop key="1루수" value="오길동" />
					<prop key="2루수" value="마길동" />
					
		 */
		BaseBallPlayer player01 = ctx.getBean("player01", BaseBallPlayer.class);
		System.out.println(player01);
		System.out.println("타석 순서별 선수명(map):"+player01.getBat());
		System.out.println("수비수 정보(Properties):"+player01.getPlayerInfo());
		//정답
		BaseTeam bt = ctx.getBean("bt01", BaseTeam.class);
		System.out.println("컨테이너의 객체 호출:"+bt);
		System.out.println("컨테이너의 객체 호출:"+bt.getHitOrders());
		System.out.println("컨테이너의 객체 호출:"+bt.getDefends());	
		
		
		System.out.println("종료");
		ctx.close();
	}
}
