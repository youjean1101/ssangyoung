package javaexp.z02_util;

public class A01_Random {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # 임의의 수를 처리하는 Math.random()
		 1. Math.random()는 Math클래스 하위에 static 메서드로
		  	0.0<=Math.random()<1.0
		 2. 임의의 수를 처리하기
		 	0.0*10<=Math.random()*10<1.0*10
		 	0.0*10<=Math.random()*10<10.0
		 	0<=(int)(Math.random()*10)<10 0~9 10가지 경우수
		 	1<=(int)(Math.random()*10+1)<11 1~10 10가지 경우수
		 		1~10까지 10가지의 임의의 정수처리.
		 3. 임의의 정수 처리 공식
		 	(int)(Math.random()*경우의수+시작수)
		 	1) 주사위를 임의로 처리하기
		 		6가지의 경우수
		 		1~6 : 시작은 1부터
		 */
		double r1 = Math.random();
		System.out.println(r1);
		System.out.println(r1*10);
		System.out.println((int)(r1*10));
		System.out.println((int)(r1*10+1));
		
		int dice01 = (int)(Math.random()*6+1);
		int dice02 = (int)(Math.random()*6+1);
		System.out.println("주사위1:"+dice01);
		System.out.println("주사위2:"+dice02);
		System.out.println("주사위 합:"+(dice01+dice02));
		
		//ex1> 홀짝을 임의로 처리를 1,2가 임의로 나오게 하세요.
		// 2가지의 경우수, 시작수는 1
		int gIdx = (int)(Math.random()*2+1); // 두가지(*2)의경우 시작점1(+1)
		System.out.println("홀짝 index:"+gIdx);
		System.out.println(gIdx==1?"홀":"짝");
		
		//ex2> 가위, 바위, 보를 위한 0,1,2가 임의로 나오게 하세요.
		// 경우의 수 3가지, 시작 0
		int  gIdx2= (int)(Math.random()*3);
		System.out.println("가위/바위/보 idx:"+gIdx2);
		System.out.println(gIdx2==0?"가위":(gIdx2==1)?"바위":"보");
		
		//ex3> 100만점 점수(0~100)가 임의로 나오게 하세요.
		// 경우의 수 1~100가 100, 0부터 시작하기에 경우의 수는 101가지
		// 시작수는 0
		int point = (int)(Math.random()*101);
		System.out.println("임의의 점수 : "+point);
		
	}

}
