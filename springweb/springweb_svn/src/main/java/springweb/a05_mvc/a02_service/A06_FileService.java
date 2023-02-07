package springweb.a05_mvc.a02_service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class A06_FileService {
	@Value("${file2.upload}")
	private String upload;
	
	public String uploadFile(MultipartFile report) {
		String fname = report.getOriginalFilename();
		if(fname!=null && !fname.equals("")) {
			File fObj = new File(upload+fname);
			
			try {
				report.transferTo(fObj); // 필수예외 처리(IO발생)
			} catch (IllegalStateException e) {
				System.out.println("파일업로드 예외1:"+e.getMessage());
			} catch (IOException e) {
				System.out.println("파일업로드 예외2:"+e.getMessage());
			}
		}
		return fname;
	}
}
