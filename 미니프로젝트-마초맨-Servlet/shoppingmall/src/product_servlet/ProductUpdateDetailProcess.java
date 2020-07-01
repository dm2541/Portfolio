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
 * Servlet implementation class ProductUpdateDetailProcess
 */
@WebServlet("/productUpdateDetail.do")
public class ProductUpdateDetailProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		ProductDAO productDAO = ProductDAO.getInstance();
		ProductBean productBean = (ProductBean) request.getSession().getAttribute("productBean");
		
		String product_codeOld = productBean.getProduct_code();
		String product_code = request.getParameter("product_code");
		String product_name = request.getParameter("product_name");
		int product_price = Integer.parseInt(request.getParameter("product_price").trim().intern());
		
		productDAO.productUpdate(product_price, product_code, product_name, product_codeOld);
		request.getRequestDispatcher("/productList.do").forward(request, response);
	}

}
