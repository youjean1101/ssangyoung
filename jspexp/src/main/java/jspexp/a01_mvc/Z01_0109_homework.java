package jspexp.a01_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Z01_1109_homework
 */
@WebServlet(name = "0109_homework.do", urlPatterns = { "/0109_homework.do" })
public class Z01_0109_homework extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Z01_0109_Service service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Z01_0109_homework() {
        super();
        // TODO Auto-generated constructor stub
        service = new Z01_0109_Service();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		if(id==null) {
			request.getRequestDispatcher("WEB-INF\\a01_mvc\\0109_homework.html").forward(request, response);
		}else {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(service.getcheckID(id));
		}
		
	}

}
