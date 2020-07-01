package custom_Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cust_DAO.UpdateCustomerDAO;
import cust_DTO.CustomerBean;

/**
 * Servlet implementation class CustomerDeleteProcess
 */
@WebServlet("/delete.do")
public class CustomerDeleteProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");		
		HttpSession session = request.getSession(true);
		CustomerBean bean = (CustomerBean)session.getAttribute("customerList");
		UpdateCustomerDAO dao = UpdateCustomerDAO.getInstance();
		
		session.setAttribute("customerList", bean);
		
		int update = dao.customerDelete(bean);
		System.out.println(bean+"\n"+update);
		
		String nextPage = "main.jsp";
		if(update != 1) {
			request.setAttribute("errorMsg", "업데이트가 실행되지 않았어. 다시 해봐");
			nextPage="/update.do?id="+request.getParameter("id");
		}				
		response.sendRedirect(nextPage);
	}
}
