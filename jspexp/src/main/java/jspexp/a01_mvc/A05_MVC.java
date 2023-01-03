package jspexp.a01_mvc;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a13_database.A02_EmpDao;
import jspexp.vo.Emp;

/**
 * Servlet implementation class A05_MVC
 */
@WebServlet(name = "mvc05.do", urlPatterns = { "/mvc05.do" })
public class A05_MVC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 모델 데이터
		A02_EmpDao dao = new A02_EmpDao();
		request.setAttribute("empList", dao.getEmpSch(new Emp("","",0,9999)));
		// view 호출
		String page = "\\WEB-INF\\a01_mvc\\a05_EmpListView.jsp";
		request.getRequestDispatcher(page).forward(request,response);
	}

}
