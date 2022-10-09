package javaexp.a12_io;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class A17_PathCopy {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # Path를 통한 파일 copy
		 
		 */
		// 1. 연습 파일 만들기..
		String path = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io";
		// 2. 폴드만들기..
		File fold01 = new File(path+"\\a01_fold");
		if(!fold01.exists()) fold01.mkdir();
		
		File fold02 = new File(path+"\\a02_fold");
		if(!fold02.exists()) fold02.mkdir();
		
		File file01 = new File(path+"\\a01_fold","a03Show.txt");
			try {
				if(!file01.exists())
				file01.createNewFile();
				// 파일 copy
				String orgFile = path+"\\a01_fold\\a03Show.txt";
				String tarFile = path+"\\a02_fold\\cpyFile01.txt";
				Path oriPath = Paths.get(orgFile);
				Path copPath = Paths.get(tarFile);
				
				//복사 처리.
				Files.copy(oriPath, copPath, StandardCopyOption.REPLACE_EXISTING);
				System.out.println("복사완료");
				// A18_PathCopy.java
				// a02_fold / cpyFile01.txt
				//	==>a03_fold/showcpcpy.txt
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
