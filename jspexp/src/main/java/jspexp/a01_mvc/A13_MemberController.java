package jspexp.a01_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A13_MemberController
 */
@WebServlet(name = "member.do", urlPatterns = { "/member.do" })
public class A13_MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A14_MemberService service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A13_MemberController() {
        super();
        // TODO Auto-generated constructor stub
        service = new A14_MemberService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		if(id==null){
			request.getRequestDispatcher("WEB-INF\\a01_mvc\\a12_memberReg.html").forward(request,response);
		}else{
			PrintWriter out = response.getWriter();
			out.print(service.checkIdJson(id));
		}
	}

}
