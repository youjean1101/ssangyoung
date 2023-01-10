package jspexp.a01_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A11_AjaxDept
 */
@WebServlet(name = "ajaxDept.do", urlPatterns = { "/ajaxDept.do" })
public class A11_AjaxDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A12_DeptService service; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A11_AjaxDept() {
        super();
        // TODO Auto-generated constructor stub
        service = new A12_DeptService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		
		
		if(dname==null) {
			request.getRequestDispatcher("WEB-INF\\a01_mvc\\a11_ajaxDept.html").forward(request, response);
		}else {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(service.getDeptAjax(dname,loc));
		}
		
	}

}
