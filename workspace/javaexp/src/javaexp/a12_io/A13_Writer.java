package javaexp.a12_io;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;

public class A13_Writer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # Writer
		 1. 문자 기반 출력 스트림의 최상위 클래스로 추상 클래스
		 2. 하위 클래스
		 	FileWriter
		 	BufferedWriter
		 	PintWriter
		 	OutputStreamWriter
		 3. 주소 메서드
		 	writer(int c) 출력 스트림으로 매개값으로 주어진 한 문자를 보낸다.
		 	writer(char[]) 출력 스트림에 매기값으로 주어진 문자 배열의 모든 문자를 보낸다.
		 	writer(String str) : 출력 스트림에 매개값으로 주어진 문자열을 전부 보낸다.
		 	flush()
		 	close
		 */
		Writer out = new OutputStreamWriter(System.out);
		Writer out2 = new PrintWriter(System.out);
		// File 처리
		String file01="C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io\\Z01_Test.txt";
//		OutputStream os = new FileOutputStream(file01);
		try {
			// 1. byte 단위 처리
			OutputStream os = new FileOutputStream(file01);
			os.write(65);//A
			byte []b = {66,67,68,69}; // B,C,D,E
			os.write(b);
			os.flush();
			os.close();
			
			//2. 2byte이상 문자열 단위 처리..
			Writer writer = new FileWriter(file01);
//			writer.write((int)'진');
			char []arry = {'반','갑','습','니','다'};
			writer.write(arry);
			writer.flush();
			writer.close();
			
			out.write(65);
//			out2.write(65);
			char[] arr = {'안','녕','하','세','요'};
			out.write(arr);
			out.write("반갑습니다.");
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
