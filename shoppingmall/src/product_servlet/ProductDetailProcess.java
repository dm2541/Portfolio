package product_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product_DAO.ProductDAO;
import product_DTO.ProductBean;

/**
 * Servlet implementation class ProductDetailProcess
 */
@WebServlet("/product_detail.do")
public class ProductDetailProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String product_code = request.getParameter("product_code");
		ProductBean productBean = ProductDAO.getInstance().productSearch(product_code);
		
		session.setAttribute("productBean", productBean);
		request.getRequestDispatcher("/productDetail.jsp").forward(request, response);
	}

}
