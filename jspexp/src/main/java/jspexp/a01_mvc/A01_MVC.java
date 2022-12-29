package jspexp.a01_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A01_MVC
 */
@WebServlet(name = "mvc01.do", urlPatterns = { "/mvc01.do" })
public class A01_MVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// http://localhost:7080/mvc01.do
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청값 처리
		
		// 2. 모델데이터 처리
		
		// 3. view단 호출
		String page = "\\WEB-INF\\a01_mvc\\a01_view.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
	// ex) "\\WEB-INF\\a01_mvc\\a02_view.jsp"; 두번째 view단입니다.
	//		A02_MVC.java	mvc02.do로 설정하여 출력하세요.
}
