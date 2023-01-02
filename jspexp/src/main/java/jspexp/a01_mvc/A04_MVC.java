package jspexp.a01_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.vo.Emp;

/**
 * Servlet implementation class A04_MVC
 */
@WebServlet(name = "a04_mvc.do", urlPatterns = { "/a04_mvc.do" })
public class A04_MVC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 	 ex) A04_MVC.java로 모델 데이터를 사원번호, 사원명, 급여를 설정하여,
		a04_view.jsp에서 호출하여 출력하게 하세요.
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("emp", new Emp(7000,"홍길동",3000.0));
		
		String page="\\WEB-INF\\a01_mvc\\a04_view.jsp"; //<h2>MVC 2단계(모델 처리)</h2>
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
