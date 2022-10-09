package javaexp.a12_io;

import java.io.File;
import java.io.IOException;

public class Atest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "C:\\a01.javaexp\\workspace\\javaexp\\src\\javaexp\\a12_io";

		try {
			String fname = "Test_Test.txt";
			File f01 = new File(path, fname);
			if(!f01.exists()) f01.createNewFile();
			System.out.println("파일생성성공");
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
