package javaexp.a12_io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

public class A07_Reader {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # Reader
		 1. 문자 기반 입력 스트림의 최상위 클래스로 추상 클래스
		 				Reader
		 	FileReader	BufferReader	InputStreamReader
		 	==> 2byte이상의 문자에 대한 처리 가능 (한글 입력이 가능)
		 2. 주요기능메서드
		 	1) int read() : 입력 스트림으로부터 한개의 문자를 읽고 리턴한다.
		 	2) int read(char[] cbuf) : 입력 스트림으로부터 읽은 문자들을 
		 		매개값으로 주어진 문자 배열 cbuf에 저장하고 실제로 읽은 문자수를 리턴한다.
		 	3) int read(char[] cbuf, int off, int len)
		 		문자의 배열 입력받았을 때, 시작 위치와 크기를 지정할 때, 
		 		속성값 매개변수로 설정.
		 		
		 	4) void close() : 시스템 자원을 반납하고 입력 스트림을 닫는다.
		 */
		// 1. 리더 객체 선언
		//InputStream is = System.in; 1바이트 문자만 입력
		Reader reader = new InputStreamReader(System.in); //2바이트 문자 처리
		// 2. 입력한 문자열 갯수 ==> 유동적으로 문자열 입력받기 위해서 BufferReader가 필요
		BufferedReader bfr = new BufferedReader(reader);
		/*
		 # Stream 객체는 특정 기능을 추가할 때, 
		 상속에 기반하여 하위 객체를 처리하는데, 추가기능 메서드를
		 생성자로 하위객체가 상위객체를 포함하는 형태로 처리한다.
		 	최상위스트림1
		 	하위스트림2
		 	최하위스트림3
		 	
		 	new 최하위스트림3(new 하위스트림2(new 최상위 스트림1)));
		 	
		 */
//		char[] chArr = new char[5];
		System.out.println("인삿말을 입력하세요:");
		try {
//			reader.read(chArr);
			String inputLine = bfr.readLine();
//			String greet = new String(chArr);
//			System.out.println("입력한 인삿말:"+greet);
			System.out.println("입력한 인삿말:"+inputLine);
			reader.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
