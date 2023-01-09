package jspexp.a01_mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.vo.Dept;

/**
 * Servlet implementation class A09_DeptController
 */
@WebServlet(name = "deptList.do", urlPatterns = { "/deptList.do" })
public class A09_DeptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A10_Service service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A09_DeptController() {
    	service = new A10_Service();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		Dept sch = new Dept(dname,loc);
		request.setAttribute("deptList", service.deptList(sch));
		String page="\\WEB-INF\\a01_mvc\\a08_deptList.jsp";
		request.getRequestDispatcher(page).forward(request,response);
	}

}
