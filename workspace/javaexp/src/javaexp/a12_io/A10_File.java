package javaexp.a12_io;

import java.io.File;
import java.io.IOException;

public class A10_File {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "C:\\a01.javaexp\\workspace\\javaexp\\src\\javaexp\\a12_io";

				try {
					String fname = "Z02_Test.txt";
					// new File("경로명", "파일명");
					File f01 = new File(path, fname);
					if(!f01.exists()) f01.createNewFile();
				
					// 상위ㅣ for을 통해서 경로를 생성..
					for(int cnt=1;cnt<=3;cnt++) {
						// path : 경로를 만들 상위 경로를 설정. 
						// 반복문을 통한 directory 생성
						// - 추가될 경로를 설정
						String subPath = path +"\\z01_path"+cnt;
						File p01 = new File(subPath);
						// 
						if(!p01.exists()) p01.mkdir();	// 폴드를 만들 경로
						// 하위 for를 통해서 파일을 생성
						for(int no=0;no<=9;no++) {
							File f02 = new File(subPath,"a01_menu"+no+".txt");
							if(!f02.exists()) f02.createNewFile();
						}
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
	}

}
