package javaexp.z01_homework;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Scanner;

public class A24_0923 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 1. File객체를 통해 현재 경로 기준으로 room1~3만들고, 
		 Person1.txt~Person10.txt를 생성하세요.
		 1) File 생성할 기준 경로(최상위 경로)
		 2) File(경로) room1의 경로 객체 생성
		 3) File(파일) Person1.txt 파일 객체 생성.
		 4) 위 경로 객체  for 처리
		 5) 위 파일 객체 for 처리..
		 */
//		 정답
		/*
		 String sPath = "C:\\Users\\dbwls\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework";
		
			try {
				 for(int rcnt=1;rcnt<=3;rcnt++) {
				 String roomPath = sPath+"\\room"+rcnt; // 기준경로 + 추가경로 
				 File room = new File(roomPath);
				 if(!room.exists()) room.mkdir();
				 
				 for(int fcnt=1;fcnt<=10;fcnt++) {
					 String fName = roomPath+"\\Person"+fcnt+".txt";
					 File file = new File(fName);
				 			
				 if(!file.exists())file.createNewFile();
				 }
				 }
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
		 
		 */
		 /*
		String path = "C:\Users\dbwls\eclipse-workspace\javaexp\src\javaexp\z01_homework";
	
			
			try {
				for(int cnt=1;cnt<=3;cnt++) {
					String subString = path+"\\room"+cnt;
					File room = new File(subString);
					if(!room.exists())room.mkdir();
				
				for(int no=1;no<=10;no++) {
					File person = new File(subString,"Person"+no+".txt");
					if (!person.exists()) person.createNewFile();
				}
			}
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			*/
		/*
		 3. 기본 OutputStream객체를 생성해서 System.out을 할당하여,
		  byte, byte[]로 데이터를 출력하세요.
		
		OutputStream homework = System.out;
	
		try {
			homework.write(73);
			homework.write(32);
			String hwStr = "can do it!";
			byte[] hwArr = hwStr.getBytes();
			homework.write(hwArr);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		/*
		4. 기본 Writer객체 활용하여 char[], String을 write()로 출력하세요.

		Writer homework = new OutputStreamWriter(System.out);
		try {
			char[] hwArr = {'과','제','를',' ','하','다'};
			homework.write(hwArr);
			homework.write("\nString으로 출력");
			homework.flush();
			homework.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("예외발생:"+e.getMessage());
		}
		*/
		/*
		  5. Reader객체를 통해서 입력된 데이터를 FileWriter를 활용하여 
		  파일에 내용을 기록하세요.
      		ex) 회원정보(아이디/패스워드/이름/포인트) 탭간격처리.

		String perFilePath = "C:\Users\dbwls\eclipse-workspace\javaexp\src\javaexp\z01_homework\\room1\\Person10.txt";
		
	
		Reader perInfo = new InputStreamReader(System.in); 
		System.out.print("회원 아이디: ");
		BufferedReader perInfoBfr = new BufferedReader(perInfo);
		
		try {
			String inputPerID = perInfoBfr.readLine();
			System.out.print("회원 패스워드: ");
			String inputPerPassWd = perInfoBfr.readLine();
			System.out.print("회원 이름: ");
			String inputPerName = perInfoBfr.readLine();
			System.out.print("회원 포인트: ");
			String inputPerPoint = perInfoBfr.readLine();
			Writer perWriter = new FileWriter(perFilePath);
			perWriter.write("아이디\t패스워드\t이름\t포인트\n");
			perWriter.write(inputPerID+"\t");
			perWriter.write(inputPerPassWd+"\t");
			perWriter.write(inputPerName+"\t");
			perWriter.write(inputPerPoint+"\t");

			perInfoBfr.close();
			perWriter.flush();
			perWriter.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		/*
		6. Path 객체를 활용하여 새파일 등록/파일내용 기록/파일 삭제를 처리하세요.
		 1) File객체 만들기
		 2) FileWriter를 활용하여 파일 내용 쓰기 처리..
		 3) Path를 전환 후, 파일 삭제 처리하기.
		*/
//		정답
			String sPath2 = "C:\\a01.javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework";
			String fname2 = "z01_show99.txt";
			File f = new File(sPath2, fname2);
			
				try {
					if(f.exists()) f.createNewFile();
					// 파일명 ==> File ==> FileWriter ==> PrintWriter
					// 생성자로 담기
					FileWriter fw = new FileWriter(f);
					// 파일 내용에 쓰기 처리
					PrintWriter out = new PrintWriter(fw);
					out.print("문자열을 파일에 입력 처리합니다!!");
					out.close();
					fw.close();
					Path delFile = Paths.get(sPath2+"\\"+fname2);
					Files.delete(delFile);
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
		/*
		String path = "C:\Users\dbwls\eclipse-workspace\javaexp\src\javaexp\z01_homework";
		Path hwFile = Paths.get(path,"A01_hwFile.txt");
		File newFile = hwFile.toFile(); //새파일 등록
		try {
			Writer hw = new FileWriter(newFile); 
			hw.write("과제를 하는중 입니다."); // 파일내용 기록
			hw.flush();
			hw.close();
			Files.delete(hwFile);
			System.out.println(hwFile.getFileName()+"삭제 완료"); //파일삭제
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		/*
		7. Files와 Path를 활용하여 경로2개를 만들고, 경로1의 파일을 5개 임의로 만들어,
		 경로2에 1~5번이 numbering된 파일을 만드세요.
		 
		 room3에 있는 파일을 newRoom4에 복사하면서 
		 Person1.txt ~ Person5.txt
		  ==> 
		 1001File.txt ~ 1005File.txt로 만들기 처리
		 */
				/*
				 client1 ==> show.txt ==> server
				 							DB - 1001.txt(저장될 파일명) show.txt 상세정보
				 							File서버 - 1001.txt(저장될 파일명)
				 client2 ==> show.txt ==> server 
				 							DB - 1002.txt(저장될 파일명) show.txt 상세정보
				 							File서버 - 1002.txt(저장될 파일명)
				 client3 <== show.txt ==> 	DB - 1002.txt show.txt
				 							File서버 - 1002.txt(저장될 파일명)
				 */
//			정답		
			try {
				for(int fcnt=1;fcnt<=5;fcnt++) {
				String path1 ="C:\\a01.javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework\\room3";
				String org1 = path1 +"\\Person"+fcnt+".txt";
				String path2 ="C:\\a01.javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework\\newRoom4";
				String tar1 = path2+"\\1001File"+fcnt+".txt";
				Path orgFile = Paths.get(org1);
				Path tarFile = Paths.get(tar1);
				Files.copy(orgFile, tarFile, StandardCopyOption.REPLACE_EXISTING);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			/*
			 
		String path = "C:\\Users\\dbwls\\eclipse-workspace\\javaexp\\src\\javaexp\\z01_homework";
		Path foldPath1 = Paths.get(path,"a01_hwfold");
		Path foldPath2 = Paths.get(path,"a02_hwfold");
		try {
			Files.createDirectory(foldPath1);
			Files.createDirectory(foldPath2);
			
			for(int no=1;no<=5;no++) {
			Path filesPath = Paths.get(path,"a01_hwfold\\"+no+"_hwFile1");
			Files.createFile(filesPath);
			
			Path copPath = Paths.get(path,"a02_hwfold\\"+no+"_hwFile2");
			Files.copy(filesPath, copPath, StandardCopyOption.REPLACE_EXISTING);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
*/
	
		/*
		  8. 일기장 시스템 만들기. Scanner를 이용해서 오늘날짜를 입력하면 @@@@년@@월@@일.txt 파일이 생성되고
      날짜를 포함하여 오늘의 일기를 기록하고 Q!를 입력시 입력이 종료되면 해당 파일에 기록이 되게 처리하세요.
      1) 파일생성
      	파일명을 입력받아서, File 객체에 파일을 생성하기
      	- 기준 경로
      	- 입력된 내용을 파일명 만들기..
      2) 입력된 내용으로 파일 쓰기
      	- File ==> PrintWriter
      	- 반복문을 통해서 계속 내용 입력 후, 
      	- Q! 통해서 파일 쓰기 종료 처리..
      */
			Scanner sc = new Scanner(System.in);
			System.out.print("일기장 등록할 날짜입력(YYYYMMDD): ");
			String date = sc.next(); // \n을 빼고 입력
			System.out.println("입력할 파일명: "+date+".txt");
			String dPath = "C:\\a01.javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_diary\\";
			File df = new File(dPath+date+".txt");
				try {
					if(!df.exists()) df.createNewFile();
					System.out.println("내용을 입력하세요!");
					// 파일명 ==> File() ==> FileWriter()
					FileWriter fw = new FileWriter(df);
					PrintWriter out = new PrintWriter(fw);
					out.write("날짜:"+date+"\n");
					StringBuffer sbf = new StringBuffer();
			
					while(true) {
						// 라인별로 문자열을 받아서
						String data = sc.nextLine();
						// 마지막 라인에서 Q!를 입력시, 
						if(data.equals("Q!")) {
							break;
						}
						sbf.append(data+"\n");
					}
					//최종적으로 입력받은 문자열을 쓰기 처리..
					out.print(sbf.toString());
					System.out.println("일기 쓰기 종료");
					out.flush();
					// 자원해제..
					out.close();
					fw.close();
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			/*
		
		String path = "C:\\Users\\정유진\\git\\repository\\javaexp\\src\\javaexp\\z01_homework";
		Scanner sc = new Scanner(System.in);
		System.out.print("오늘의 날짜(@@@@년@@월@@일): ");
		String date = sc.nextLine();

			try {
				File mkFile = new File(path, date+".txt");
				if(!mkFile.exists())mkFile.createNewFile();
				Writer daily = new FileWriter(mkFile);
				daily.write("#"+date+"의 일기#\n");
				System.out.println(date+"의 일기를 작성해주세요.");
				String inputDairy = sc.nextLine();
				daily.write(inputDairy);
				
				daily.flush();
				daily.close();
				sc.close();
			
			} catch (IOException e) {
				// TODO Auto-generated catch block
//				e.printStackTrace();
				System.out.println("예외 발생:"+e.getMessage());
			}
			*/
	}
}
