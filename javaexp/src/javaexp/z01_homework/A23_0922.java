package javaexp.z01_homework;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

public class A23_0922 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 1. Stream이 무엇인지 기술하고, 자바의 대표적인 입출력 객체를 선언하세요.
		 Stream이란 물결이라는 뜻으로 프로그래밍에서는 데이터의 흐름을 처리할 떄, 
		 사용하는 객체이다.
		 주로 콘솔창에 입력되는 데이터, 파일을 통해서 입력된 데이터, 네트워크를 통해서
		 전송해오는 데이터를 읽고 쓸때, 중간에 객체로 이동하거나 전송할 때, 활용된다.
		 InputStream, OutpputStream 객체를 상위 객체로 하여, 
		 하위에 여러가지 기능을 추가하는 객체들이 있다. 
		 */
		/*
		 2. InputStream을 이용하여, 70점 이상인지 여부를 확인하여 출력하세요.
		 (byte ==> char ==> String ==> int 변환 필요) 
		
		InputStream is = System.in;
		byte[] scoArr = new byte[2];	// 8일경우,
		System.out.println("점수를 입력하세요.");
		try {
			is.read(scoArr);
			String scoStr = new String(scoArr);
			System.out.println("입력받은 점수:"+ scoStr+"점");
			Integer scoInt = new Integer(scoStr);
			
			if(scoInt>=70) {
				System.out.println("70점 이상입니다!");
			}else {
				System.out.println("70점 이하입니다!");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		/*
		 4. read(byte[])를 활용하여 웹기반 자바프로그램은 무엇인가?
		 라은 질문에 jsp이면 정답 그렇지 않으면 오답으로 처리하세요.
		 
		Reader java = new InputStreamReader(System.in);
		char[] javaArr = new char[3];
		System.out.println("웹기반 자바 프로그램은 무엇인가?");
		try {
			 java.read(javaArr);
			 String inputInfo = new String(javaArr);
			 if(inputInfo.equals("jsp")) {
				 System.out.println("정답^o^");
			 }else {
				 System.out.println("오답ㅠ_ㅠ");
			 }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		/*
		 5. InputStreamReader를 이용하여 물건명, 가격, 갯수를 입력받고, 총계까지 출력하세요.
		 
//		Reader product = new InputStreamReader(System.in);
		BufferedReader proBfr = new BufferedReader(new InputStreamReader(System.in));

			try {
				System.out.print("물건:");
				String inputProName = proBfr.readLine();
				System.out.print("가격:");
				String inputProPrice = proBfr.readLine();
				System.out.print("갯수:");
				String inputProCnt = proBfr.readLine();
				System.out.println("# 입력받은 물건정보 #");
				System.out.print(inputProName+"\t");
				System.out.print(inputProPrice+"원\t");
				System.out.println(inputProCnt+"개");
				Integer price =  Integer.valueOf(inputProPrice);
				Integer cnt =  Integer.valueOf(inputProCnt);
				System.out.print("총계: "+price*cnt);
				proBfr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			*/
		/*
		 7. homework 패키지 하위에 z01_home,z02_home,z02_home 폴드를 만들고 
		 그 하위에 각각 menual1.txt~menual10.txt 파일을 생성하세요
		 
		String path = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home";
		String z01file01 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual1.txt";
		String z01file02 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual2.txt";
		String z01file03 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual3.txt";
		String z01file04 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual4.txt";
		String z01file05 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual5.txt";
		String z01file06 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual6.txt";
		String z01file07 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual7.txt";
		String z01file08 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual8.txt";
		String z01file09 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual9.txt";
		String z01file10 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_home\\menual10.txt";
		String path2 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home";
		String z02file01 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual1.txt";
		String z02file02 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual2.txt";
		String z02file03 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual3.txt";
		String z02file04 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual4.txt";
		String z02file05 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual5.txt";
		String z02file06 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual6.txt";
		String z02file07 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual7.txt";
		String z02file08 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual8.txt";
		String z02file09 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual9.txt";
		String z02file10 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z02_home\\menual10.txt";
		String path3 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home";
		String z03file01 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual1.txt";
		String z03file02 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual2.txt";
		String z03file03 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual3.txt";
		String z03file04 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual4.txt";
		String z03file05 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual5.txt";
		String z03file06 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual6.txt";
		String z03file07 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual7.txt";
		String z03file08 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual8.txt";
		String z03file09 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual9.txt";
		String z03file10 = "C:\\Users\\정유진\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework\\z03_home\\menual10.txt";
		File f1 = new File(path); if(!f1.exists())f1.mkdir();
		File f2 = new File(path2); if(!f2.exists())f2.mkdir();
		File f3 = new File(path3); if(!f3.exists())f3.mkdir();
		File f11 = new File(z01file01);
		File f12 = new File(z01file02);
		File f13 = new File(z01file03);
		File f14 = new File(z01file04);
		File f15 = new File(z01file05);
		File f16 = new File(z01file06);
		File f17 = new File(z01file07);
		File f18 = new File(z01file08);
		File f19 = new File(z01file09);
		File f110 = new File(z01file10);
		File f21 = new File(z02file01);
		File f22 = new File(z02file02);
		File f23 = new File(z02file03);
		File f24 = new File(z02file04);
		File f25 = new File(z02file05);
		File f26 = new File(z02file06);
		File f27 = new File(z02file07);
		File f28 = new File(z02file08);
		File f29 = new File(z02file09);
		File f210 = new File(z02file10);
		File f31 = new File(z03file01);
		File f32 = new File(z03file02);
		File f33 = new File(z03file03);
		File f34 = new File(z03file04);
		File f35 = new File(z03file05);
		File f36 = new File(z03file06);
		File f37 = new File(z03file07);
		File f38 = new File(z03file08);
		File f39 = new File(z03file09);
		File f310 = new File(z03file10);
			try {
				if(!f11.exists())f11.createNewFile();
				if(!f12.exists())f12.createNewFile();
				if(!f13.exists())f13.createNewFile();
				if(!f14.exists())f14.createNewFile();
				if(!f15.exists())f15.createNewFile();
				if(!f16.exists())f16.createNewFile();
				if(!f17.exists())f17.createNewFile();
				if(!f18.exists())f18.createNewFile();
				if(!f19.exists())f19.createNewFile();
				if(!f110.exists())f110.createNewFile();
				if(!f21.exists())f21.createNewFile();
				if(!f22.exists())f22.createNewFile();
				if(!f23.exists())f23.createNewFile();
				if(!f24.exists())f24.createNewFile();
				if(!f25.exists())f25.createNewFile();
				if(!f26.exists())f26.createNewFile();
				if(!f27.exists())f27.createNewFile();
				if(!f28.exists())f28.createNewFile();
				if(!f29.exists())f29.createNewFile();
				if(!f210.exists())f210.createNewFile();
				if(!f31.exists())f31.createNewFile();
				if(!f32.exists())f32.createNewFile();
				if(!f33.exists())f33.createNewFile();
				if(!f34.exists())f34.createNewFile();
				if(!f35.exists())f35.createNewFile();
				if(!f36.exists())f36.createNewFile();
				if(!f37.exists())f37.createNewFile();
				if(!f38.exists())f38.createNewFile();
				if(!f39.exists())f39.createNewFile();
				if(!f310.exists())f310.createNewFile();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		*/	
	}
}
