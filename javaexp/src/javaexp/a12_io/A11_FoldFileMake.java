package javaexp.a12_io;

import java.io.File;
import java.io.IOException;

public class A11_FoldFileMake {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 ex) z01_fold, z02_fold, z03_fold
		 	반복문에 경로를 만들고, 
		 	a01_code.txt~ a09_code.txt를 각 폴드마다
		 	파일이 생성되게 하세요.
		 	# 처리순서
		 	1. 현재경로 path 문자열 선언
		 	2. 추가 경로 생성 - sample
		 		- 반복문을 이용해서 위 경로에 namming 패턴으로 경로 설정
		 		- 추가 경로명 반복문안에 변수명으로 설정
		 	3. 추가 파일 생성 - sample
		 		- 반복문을 이용해서 추가 경로명 안에 파일명으로 생성
		 		- 
		 	# 단계별로 진행
		 	1. z01_fold,a01_code.txt생성
		 	2. 반복문을 통해서 추가 처리.
		 */
		String path = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io";
//		// 1. 폴드 생성(z01_fold)
//		String subPath = path+"\\z01_fold";
//		//	1) File 객체 생성
//		File fold01 = new File(subPath);
//		//  2) 폴드가 있는지 여부 확인 후, 폴드 생성
//		if(!fold01.exists()) {
//			fold01.mkdir();
//		}
		
		// 2. 파일생성(a01_code.txt)
//		File file01 = new File(subPath+"\\"+"a01_code.txt");
//		File file01 = new File(subPath,"a01_code.txt");
			try {
				// 1. 폴드 생성(z01_fold)
				for(int cnt = 1; cnt<=3;cnt++) {
				String subPath = path+"\\z0"+cnt+"_fold";
				//	1) File 객체 생성
				File fold01 = new File(subPath);
				//  2) 폴드가 있는지 여부 확인 후, 폴드 생성
				if(!fold01.exists()) {
					fold01.mkdir();
				}
				
				for(int no=1;no<=9;no++) {
				File file01 = new File(subPath,"a0"+no+"_code.txt");
				
				if(!file01.exists()){
					file01.createNewFile();
				}
			}
		}
		
			} catch (IOException e) {
				// TODO Auto-generated catch block
//				e.printStackTrace();
				System.out.println("파일생성오류:"+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반 오류:"+e.getMessage());
			}
	}
}
