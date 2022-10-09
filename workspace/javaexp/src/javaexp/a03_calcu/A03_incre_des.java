package javaexp.a03_calcu;

public class A03_incre_des {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 증감 연산자
		1. 변수명 ++, 변수명--
			1씩 증가/감소처리
			++cnt01 증가된 내용을 출력
			cnt01++ 다음 호출시 증가된 내용 확인
		
		# 증감 대입연산자.
			특정한 단위로 증감하는 연산자
		1. 변수명 +=증가단위;
		   변수명 -=감소단위;
			
			cnt01+3 증가된 내용을 출력
		*/
		/*
		int cnt=1;
		System.out.println(cnt++);
		System.out.println(cnt++);
		System.out.println(cnt++);
		System.out.println(cnt--);
		System.out.println(cnt--);
		System.out.println(cnt--);
		System.out.println(cnt++);
		System.out.println(cnt++);
		System.out.println(cnt+=3);
		System.out.println(cnt+=3);
		System.out.println(cnt+=3);
		System.out.println(cnt-=5);
		System.out.println(cnt-=5);
		System.out.println(cnt-=5);
		System.out.println(cnt-=5);
		System.out.println(cnt-=5);
		*/
		// ext1) 1~5까지 증가 5~1로 감소 처리하세요.
		// ++cnt01 증가된 내용을 출력
		// cnt01++ 다음 호출 시 증가된 내용 확인
	
		
		int cnt01=1;
		System.out.print(cnt01+++"\t");
		System.out.print(cnt01+++"\t");
		System.out.print(cnt01+++"\t");
		System.out.print(cnt01+++"\t");
		System.out.print(cnt01+++"\n");
		//cnt01 = 6
		System.out.print(--cnt01+"\t");
		System.out.print(--cnt01+"\t");
		System.out.print(--cnt01+"\t");
		System.out.print(--cnt01+"\t");
		System.out.println(--cnt01+"\t");


		// ext2) 증감 대입연산자를 활용해서 3의 배수로 5회 증가하세요.
		int cnt02=0;
		System.out.print((cnt02+=3)+"\t");
		System.out.print((cnt02+=3)+"\t");
		System.out.print((cnt02+=3)+"\t");
		System.out.print((cnt02+=3)+"\t");
		System.out.print((cnt02+=3)+"\n");
		
		// ext3) 증가 연산자로 1~10까지 누적합산값을 처리하세요.
		int cnt03=0;
		System.out.print((cnt03+=1)+"\t");
		System.out.print((cnt03+=2)+"\t");
		System.out.print((cnt03+=3)+"\t");
		System.out.print((cnt03+=4)+"\t");
		System.out.print((cnt03+=5)+"\t");
		System.out.print((cnt03+=6)+"\t");
		System.out.print((cnt03+=7)+"\t");
		System.out.print((cnt03+=8)+"\t");
		System.out.print((cnt03+=9)+"\t");
		System.out.print((cnt03+=10)+"\t");
		
		
		// ex) 초기값 cnt04 100을 할당한 후, -5씩 3회 감소 처리 출력
		int cnt04 = 100;
		System.out.println(cnt04+"\t");
		System.out.print((cnt04-=5)+"\t");
		System.out.print((cnt04-=5)+"\t");
		System.out.print((cnt04-=5)+"\n");
		
		
	}

}
