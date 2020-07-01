package custom_Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cust_DAO.ListCustomerDAO;
import cust_DTO.CustomerBean;

/**
 * Servlet implementation class CustomerListProcess
 */
@WebServlet("/customerList.do")
public class CustomerListProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ListCustomerDAO listCustomerDAO = new ListCustomerDAO();
		List<CustomerBean> customerList = listCustomerDAO.customerList();
		
		request.setAttribute("customerList", customerList);
		request.getRequestDispatcher("/customerList.jsp").forward(request, response);
	}

}
