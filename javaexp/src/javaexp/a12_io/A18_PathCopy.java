package javaexp.a12_io;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class A18_PathCopy {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// A18_PathCopy.java
		// a02_fold / cpyFile01.txt
		//	==>a03_fold/showcpcpy.txt
		String path="C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\a12_io\\";

		String orFile = path+"a02_fold\\cpyFile01.txt";
		String cpyFile = path+"a03_fold\\showcpcpy.txt";
		Path orPath = Paths.get(orFile);
		Path cpyPath = Paths.get(cpyFile);
		
		try {
			Files.copy(orPath, cpyPath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
