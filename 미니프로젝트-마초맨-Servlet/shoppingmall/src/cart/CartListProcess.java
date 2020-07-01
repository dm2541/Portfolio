package cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cust_DTO.CustomerBean;
import product_DAO.ProductDAO;
import product_DTO.ProductBean;

/**
 * Servlet implementation class CartListProcess
 */
@WebServlet("/cartList.do")
public class CartListProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		CartDAO cartDAO = new CartDAO();
		CustomerBean customerBean = new CustomerBean();
		customerBean = (CustomerBean) session.getAttribute("customerList");

		ProductDAO productDAO = ProductDAO.getInstance();
		ProductBean productBean = new ProductBean();

		List<CartBean> cartList = new ArrayList();
		
		
		//상단 메뉴바에 있는 장바구니 클릭시 장바구니 조회 
		try{ cartList = cartDAO.cartList(customerBean.getCust_id().trim()); }
		catch (Exception e) {
			request.getRequestDispatcher("cartList.jsp").forward(request, response);
		}
		finally {
			
			session.setAttribute("priceSum", cartDAO.priceSum(customerBean.getCust_id().trim()));
			session.setAttribute("cartList", cartList);
			request.getRequestDispatcher("cartList.jsp").forward(request, response);

		}
	}

}
