package cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cust_DTO.CustomerBean;
import product_DTO.ProductBean;

/**
 * Servlet implementation class cartInsert
 */
@WebServlet("/cartInsert.do")

public class CartInsertProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		ProductBean productBean = new ProductBean();
		productBean = (ProductBean) session.getAttribute("productBean");

		CustomerBean customerbean1 = new CustomerBean();
		customerbean1 = (CustomerBean) session.getAttribute("customerList");

		CartBean cartBean = new CartBean();
		PrintWriter out = response.getWriter();
		try {
			
			String num = (String) request.getParameter("count").trim();
			cartBean.setCount(Integer.parseInt(num));
			cartBean.setCust_id(customerbean1.getCust_id().trim());
			cartBean.setProduct_name(productBean.getProduct_name().trim());
			cartBean.setProduct_code(productBean.getProduct_code().trim());
			
			CartDAO cartDAO = new CartDAO();
			cartDAO.cartInsert(cartBean);
			out.println("<script>alert('Success.');location.href='/cartList.do';</script>");
			out.flush();
			

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
