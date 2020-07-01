package product_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product_DAO.ProductDAO;

/**
 * Servlet implementation class ProductDeleteProcess
 */
@WebServlet("/productDelete.do")
public class ProductDeleteProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");

		PrintWriter out = response.getWriter();

		String[] product_code = request.getParameterValues("product_code");
		ProductDAO productDAO = ProductDAO.getInstance();

		for (String code : product_code) {
			Boolean isDelete = productDAO.productDelete(code);
			if (!isDelete)
				out.println("<script>alert('" + code + "삭제 실패')");
		}

		out.println("<script>alert('Delete Success');location.href='/productList.do';</script>");
		out.flush();
	}
}
