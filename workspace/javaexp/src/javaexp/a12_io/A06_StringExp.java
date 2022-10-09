package javaexp.a12_io;

import java.io.IOException;
import java.io.InputStream;

public class A06_StringExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// ex) 검색할 문건명(영문)으로 입력하고, "apple" 와 동일하면
		//		검색되었습니다. 그렇지 않으면 없습니다. 출력
		InputStream is = System.in;
		System.out.print("물건명(영문): ");
		byte[] proArr = new byte[5];
		try {
			is.read(proArr);
			String inproName = new String(proArr);
			System.out.println("입력한 물건명:"+inproName);
			if(inproName.equals("apple")) {
				System.out.println("검색되었습니다.");
			}else {
				System.out.println("해당 물건은 없습니다.");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
