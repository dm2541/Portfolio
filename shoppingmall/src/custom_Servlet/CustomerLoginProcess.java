package custom_Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cust_DAO.LoginCustomerDAO;
import cust_DTO.CustomerBean;
import product_DAO.ProductDAO;
import product_DTO.CategoryBean;
import product_DTO.ProductBean;
import seller_DTO.SellerBean;

/**
 * Servlet implementation class CustomerLoginProcess
 */
@WebServlet("/login.do")
public class CustomerLoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");	
		Boolean isLogin = false;
		
		LoginCustomerDAO dao = new LoginCustomerDAO();
		String cust_id = request.getParameter("cust_id").trim().intern();
		String cust_pw = request.getParameter("cust_pw").trim().intern();

		SellerBean sellerBean = new SellerBean();
		sellerBean = dao.sellerSearch(cust_id, cust_pw);
		CustomerBean customerBean = new CustomerBean();
		customerBean = dao.nameSearch(cust_id, cust_pw);

		HttpSession session = request.getSession();
		List<ProductBean> productList = (List<ProductBean>) session.getAttribute("productList");
		
		session.setAttribute("productList", productList);
		session.setMaxInactiveInterval(60*60);
		if (sellerBean != null) {
			if (cust_id.equals(sellerBean.getSell_id()) && cust_pw.equals(sellerBean.getSell_pw())) {
				isLogin = true;
				session.setAttribute("isLogin", isLogin);
				session.setAttribute("sellerBean", sellerBean);
				request.getRequestDispatcher("/seller.jsp").forward(request, response);

			}

		} else if (customerBean != null) {
			if (cust_id.equals(customerBean.getCust_id()) && cust_pw.equals(customerBean.getCust_pw())) {
				isLogin = true;
				session.setAttribute("isLogin", isLogin);
				session.setAttribute("customerList", customerBean);
				request.getRequestDispatcher("/mainLogin.jsp").forward(request, response);

			}
		} else if (sellerBean == null && customerBean == null){
			isLogin = false;
			session.setAttribute("isLogin", isLogin);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

	}
//		LoginCustomerDAO dao = new LoginCustomerDAO();
//		String cust_id = request.getParameter("cust_id").trim();
//		String cust_pw = request.getParameter("cust_pw").trim();
//		HttpSession session = request.getSession(true);
//		
//		session.setAttribute("customerList", dao.nameSearch(cust_id, cust_pw));		
//		request.getRequestDispatcher("/mainLogin.jsp").forward(request, response);
	

}
