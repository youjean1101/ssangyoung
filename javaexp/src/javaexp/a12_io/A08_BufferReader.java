package javaexp.a12_io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

public class A08_BufferReader {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// ex) BufferedReader 객체를 활용하여 좋아하는 음악과 가수명을 입력받아 출력하세요.
//		Reader music = new InputStreamReader(System.in);
		
		BufferedReader musicBfr = new BufferedReader(new InputStreamReader(System.in));
			try {
				System.out.println("좋아하는 음악을 입력하세요.");
				String inputMusic = musicBfr.readLine();
				System.out.println("음악의 가수를 입력하세요");
				String inputSinger = musicBfr.readLine();
				System.out.println("입력한 음악:"+inputMusic);
				System.out.println("입력한 가수:"+inputSinger);
//			music.close();
			musicBfr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		
	}

}
