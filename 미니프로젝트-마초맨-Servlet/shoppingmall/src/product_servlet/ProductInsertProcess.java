package product_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product_DAO.ProductDAO;
import seller_DTO.SellerBean;

/**
 * Servlet implementation class ProductInsertProcess
 */
@WebServlet("/productInsert.do")
public class ProductInsertProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		
		HttpSession session = request.getSession();
		SellerBean sellerBean = new SellerBean();
		sellerBean = (SellerBean)session.getAttribute("sellerBean");
		
		String product_code = request.getParameter("product_code");
		String product_name = request.getParameter("product_name");
		int product_price = Integer.parseInt(request.getParameter("product_price").trim().intern());
		String category = request.getParameter("category");
		String product_img = (String)session.getAttribute("img_path");
		String sell_id = sellerBean.getSell_id();
		
		ProductDAO productDAO = ProductDAO.getInstance();
		productDAO.productInsert(product_price, product_code, product_name, category, sell_id,product_img);
		
		request.getRequestDispatcher("/admin.jsp").forward(request, response);;
		
	}

}
