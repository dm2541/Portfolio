package buy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import cart.CartBean;
import cart.CartDAO;
import product_DAO.ProductDAO;

/**
 * Servlet implementation class BuyProcess
 */
@WebServlet("/buy.do")
public class BuyProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();

		List<CartBean> cartList = (List<CartBean>) session.getAttribute("cartList");
		List<BuyBean> buyList = new ArrayList();

		for (CartBean cartBean : cartList) {
			BuyBean buyBean = new BuyBean();
			buyBean.setCart_count(cartBean.getCount());
			buyBean.setCust_id(cartBean.getCust_id());
			buyBean.setProduct_code(cartBean.getProduct_code());
			buyBean.setProduct_price(cartBean.getProduct_price());
			buyBean.setSell_id(ProductDAO.getInstance().productSearch(cartBean.getProduct_code()).getSell_id());
			buyList.add(buyBean);
		}

		BuyDAO.getInstance().buyInsert(buyList);
		
		CartDAO cartDAO = new CartDAO();
		
		
		cartDAO.cartDeleteAfterBuy(cartList.get(0).getCust_id());

		request.getRequestDispatcher("/mainLogin.jsp").forward(request, response);

	}

}
