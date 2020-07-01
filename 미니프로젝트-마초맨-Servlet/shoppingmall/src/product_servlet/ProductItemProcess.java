package product_servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product_DAO.ProductDAO;
import product_DTO.ProductBean;

/**
 * Servlet implementation class ProductItemProcess
 */
@WebServlet("/productItem.do")
public class ProductItemProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String category_big = request.getParameter("category_big");
		List<ProductBean> categoryProductList = ProductDAO.getInstance().categoryProduct(category_big);
		
		session.setAttribute("categoryProductList", categoryProductList);
		request.getRequestDispatcher("/product.jsp").forward(request, response);
	}

}
