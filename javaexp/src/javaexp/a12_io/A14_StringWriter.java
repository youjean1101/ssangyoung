package javaexp.a12_io;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class A14_StringWriter {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String file01="C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io\\Z01_Test.txt";
		try {
			Writer writer = new FileWriter(file01);
			writer.write(65);
			char c = '홍';
			//기존에 문자열에 추가 처리..
			writer.append(c);
			char []arrc = {'안','녕','하','세','요'};
			writer.write(arrc);
			writer.write("해당 문자열 입니다!!!!");
			// 버퍼에 잔류하고 있는 문자들을 출력하고, 버퍼를 비움.
			writer.flush();
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ex) A15_FileWriter.java
		//		Z02_Test.txt 파일에 문자, 문자배열, 문자열을 선언하고
		//		할당처리하세요.
		
	}

}
