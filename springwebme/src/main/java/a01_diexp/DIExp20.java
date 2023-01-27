package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z05_vo.Computer;
import a01_diexp.z05_vo.Ram;

public class DIExp20 {

   public static void main(String[] args) {

      //컨테이너 객체 호출 처리
      String path="a01_diexp\\di20.xml";
      AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
      //DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
      Ram ram = ctx.getBean("ram",Ram.class);
      System.out.println("컨테이너 객체 호출:"+ram);
      ram.setCompany("하이닉스");
      ram.setMemory("16G");
      Computer com = ctx.getBean("computer",Computer.class);
      System.out.println("컨테이너 객체 호출:"+com);
      com.setCompany("애플");
      com.showInfo();
      System.out.println("종료");
      ctx.close();
      /*
       처리순서
       1. Computer, Ram 1:1 관계 및 출력 메서드 처리
       2. di20.xml 컨테이너 안에 객체 로딩
       3. Computer에 소스상 Autowire 처리
       4. main()에서 Ram객체 호출 및 데이터 처리
       5. main()에서 Computer객체 호출 및 제조사 처리
       6. main()에서 Computer의 출력 메서드 처리
       */
      //di10.xml
      // <bean id="obj" class="java.lang.Object"/>
   }

}