package fleaMarket.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

//import fleaMarket.a02_service.Req1000_Service;
@Service
public class FileService {
		// 회원 프로필사진 저장경로

	//일반 Version
	public String insprofileimg(String filepath,MultipartFile report) { 
		String fname = report.getOriginalFilename();
		File f = new File(filepath+fname);
		try {
			report.transferTo(f); // 필수예외 처리 (IO발생)
		} catch (IllegalStateException e) {
			System.out.println("파일업로드 예외1:"+e.getMessage());
		} catch (IOException e) {
			System.out.println("파일업로드 예외2:"+e.getMessage());
		} 
		
		return fname; //db업로드 해야하니까 네임 리턴
	}
	
	//고유ID Version
	public String insprofileimg2(String fileapth,MultipartFile report) {
		
		//고유 ID생성하는 내장 함수 ==> 중복파일 방지
		String uuid = UUID.randomUUID().toString();
		// 고유 ID+파일이름으로 심어줌
		String fname = uuid+"_"+report.getOriginalFilename();
		
		File f = new File(fileapth+fname);
		try {
			report.transferTo(f); // 필수예외 처리 (IO발생)
		} catch (IllegalStateException e) {
			System.out.println("파일업로드 예외1:"+e.getMessage());
		} catch (IOException e) {
			System.out.println("파일업로드 예외2:"+e.getMessage());
		} 
		
		return fname; //db업로드 해야하니까 네임 리턴
	}
	
	
	//파일 삭제처리
	public void DeleteFile(String filepath,String fileinfo) {
		String filePath= filepath+fileinfo;
		File f = new File(filePath);
		if(f.exists()) {f.delete();}
	}
}
