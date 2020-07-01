package product_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product_DAO.ProductDAO;
import product_DTO.ProductBean;

/**
 * Servlet implementation class ProductUpdateProcess
 */
@WebServlet("/productUpdate.do")
public class ProductUpdateProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		
		String product_code = request.getParameter("product_code");
		ProductDAO productDAO = ProductDAO.getInstance();
		ProductBean productBean = productDAO.productSearch(product_code);
		
		request.getSession().setAttribute("productBean", productBean);
		request.getRequestDispatcher("/productUpdateDetail.jsp").forward(request, response);
	}

}
