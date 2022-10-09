package javaexp.a12_io;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class A15_FileWriter {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//		A15_FileWriter.java
		//		Z02_Test.txt 파일에 문자, 문자배열, 문자열을 선언하고
		//		할당처리하세요.
		String fname = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io\\Z02_Test.txt";
		
		
		Writer ex;
		try {
			ex = new FileWriter(fname);
			ex.write(65);
			ex.append('문');	
			ex.append('자');	
			ex.append('\n');	
			char []arrc = {'문','자','배','열','\n'};
			ex.write(arrc);
			ex.write("문자열");
			
			ex.flush();
			ex.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("IO에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반에러:"+e.getMessage());
		}
	}
}
