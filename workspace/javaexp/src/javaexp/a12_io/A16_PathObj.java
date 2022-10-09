package javaexp.a12_io;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class A16_PathObj {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # Path
		 1. 파일을 보다 효과적으로 복사, 삭제 처리
		 
		 */
		String fname="C:\\Users\\dbwls\\eclipse-workspace\\javaexp\\src\\javaexp\\a12_io\\Z03_Test.txt";
		File f00 = new File(fname);
		
		Path filePath = Paths.get(fname);
		File f = filePath.toFile();
		System.out.println(f.getName());
		System.out.println(f.getPath());
		System.out.println(f.exists());
		System.out.println(f.length());
		
		//ex) Z04_newFile.txt 파일 생성. File 객체로 생성.
		//	Path로 처리하고, 해당 정보를 출력하세요.
//		정답
		String fold01 = "C:\\Users\\dbwls\\eclipse-workspace\\javaexp\\src\\javaexp\\a12_io\\";
		File f01 = new File(fold01, "Z04_newFile.txt");
		// ctrl+shift+f(자동 소스 정리)
			try {
				if(!f01.exists())
					f01.createNewFile();
				Path newPath = Paths.get(fold01+"\\"+"Z04_newFile.txt");
				System.out.println(newPath.getFileName());
				System.out.println(newPath.getParent());
				System.out.println(newPath.getNameCount());
				File newFile = newPath.toFile();
				System.out.println("# 다시 파일 객체로 변경#");
				System.out.println(newFile.getName());
				
				
				// 파일 삭제 처리..
				Files.delete(filePath);
				System.out.println(filePath.getFileName()+"삭제 완료"); // Z03_Test.txt 삭제 
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//		내가 한거
		System.out.println("\n#ex#");
		String exfname = "C:\\Users\\dbwls\\eclipse-workspace\\javaexp\\src\\javaexp\\a12_io\\Z04_newFile.txt";
		Path exFilePath = Paths.get(exfname);
		File exf = exFilePath.toFile();
		System.out.println(exf.getName());
		System.out.println(exf.getPath());
		System.out.println(exf.exists());
		System.out.println(exf.length());
		
	}
}
