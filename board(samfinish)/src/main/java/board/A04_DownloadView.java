package board;
//
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

// downloadView board.A04_DownloadView
public class A04_DownloadView extends AbstractView{
	// 다운로드할 특정한 폴드 공통 위치
	@Value("${user.upload}")
	private String upload;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			HttpServletRequest requst, HttpServletResponse response)
			throws Exception {
		// 1. 파일 객체 생성
		// 		파일다운로드 컨트롤러에서 모델명으로 온 파일명 정보를 가져온다.
		//      model.addAttribute("downloadFile", 파일명)
		//	1) 파일명 선언
		String fname = (String)model.get("downloadFile");
		//	2) 경로명과 함께 파일 객체 생성
		File file = new File(upload+fname);
		
		// 2. 파일 객체를 client에 전달하기 위한 response 객체 속성 선언
		//	1) 파일을 클라이언트 전달하기 위해 contentType 설정
		response.setContentType("application/download;charset=utf-8");
		//	2) 전달할 파일을 크기 설정
		response.setContentLengthLong((int)file.length());
		//  3) 헤더정보에 파일명을 입력하는데, 한글일 경우 encoding을 처리해야 한다.
		fname = URLEncoder.encode(fname,"utf-8").replaceAll("\\+"," ");
		// attachment;filename="파일명"
		response.setHeader("Content-Disposition", 
							"attachment;filename=\""+fname+"\"");
		//  4)헤더정보를 통해서 binary데이터 전송
		response.setHeader("Content-Transfer-Encoding", "binary");
		// 3. FileInputStream으로 파일 객체 탑제, response객체의 OutputStream으로 
		//    스트림으로 client에 보내기
		FileInputStream fis = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		// 	1) FileCopyUtils를 통해 파일 객체를 outstream에 할당.
		FileCopyUtils.copy(fis, out);
		// 4. response객체의 stream 자원 해제..
		out.flush();
	}


	
	
}
