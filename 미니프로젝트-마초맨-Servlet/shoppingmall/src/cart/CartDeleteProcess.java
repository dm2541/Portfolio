
package cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartDeleteProcess
 */

@WebServlet("/cartDelete.do")
public class CartDeleteProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated

		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		CartDAO cartDAO = new CartDAO();
		request.setAttribute("num", Integer.parseInt(request.getParameter("num").trim()));
		
		cartDAO.cartDelete(Integer.parseInt(request.getParameter("num").trim()));
		
		out.println("<script>alert('Delete Success.');location.href='/cartList.do';</script>");
		out.flush();	
	}
}
