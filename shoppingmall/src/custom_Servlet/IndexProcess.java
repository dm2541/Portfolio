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

import product_DAO.ProductDAO;
import product_DTO.ProductBean;

/**
 * Servlet implementation class IndexProcess
 */
@WebServlet("/index")
public class IndexProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		List<ProductBean> productList = new ArrayList<ProductBean>();
		
		productList = ProductDAO.getInstance().productList();
		
		if(!session.isNew()) {
			session.invalidate();
			session = request.getSession(true);
		}
		
		session.getServletContext().setAttribute("productList", productList);
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}

}
