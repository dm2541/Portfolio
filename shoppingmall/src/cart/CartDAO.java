package cart;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conn_DAO.ConnectionDAO;

public class CartDAO {

	private PreparedStatement stmt;
	
	// ��ٱ��� ��� ����
	public List<CartBean> cartList(String cust_id){
		
		List<CartBean> cartList = null;
		CartBean cartBean = null;
		ResultSet rSet = null;
		
		String sql = "SELECT a.count, a.product_name,"
				+ " a.product_code, a.cust_id, a.num, b.product_price, b.product_img "
				+ "from cart a, product b where a.product_name = b.product_name and cust_id = ?";
		
		
		try {
			stmt = ConnectionDAO.getInstance().getConn().prepareStatement(sql);
			stmt.setString(1, cust_id);
			rSet = stmt.executeQuery();
			
			cartList = new ArrayList();
			while(rSet.next()) {
				cartBean = new CartBean();
				cartBean.setCount(rSet.getInt(1));
				cartBean.setProduct_name(rSet.getString(2));
				cartBean.setProduct_code(rSet.getString(3));
				cartBean.setCust_id(rSet.getString(4));
				cartBean.setNum(rSet.getInt(5));
				cartBean.setProduct_price(rSet.getInt(6));
				cartBean.setProduct_img(rSet.getString(7));
				cartList.add(cartBean);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cartList;
	}
	
	
	
	// ��ٱ��� ��� ��ư ������ ���� ��� �Է�
	public void cartInsert(CartBean cartBean) {
		
		String sql = "insert into cart(count, product_name, product_code, cust_id) values(?,?,?,?)";
		int result = 0;
		try {
		stmt = ConnectionDAO.getInstance().getConn().prepareStatement(sql);
		stmt.setInt(1, cartBean.getCount());
		stmt.setString(2, cartBean.getProduct_name());
		stmt.setString(3, cartBean.getProduct_code());
		stmt.setString(4, cartBean.getCust_id());
		
		stmt.executeUpdate();
		stmt.close();
		
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	// ��ٱ��� �� ���� ���
	public int priceSum(String cust_id) {
		int priceSum = 0;
		String id = null;
		ResultSet rSet = null;
		
		  String sql =
		  "select sum(a.count * b.product_price) allsum from cart a, product b "
		  + "where (a.product_code = b.product_code) and a.cust_id = ?"
		  ;
		 
		
		
		try {
		stmt = ConnectionDAO.getInstance().getConn().prepareStatement(sql);
		stmt.setString(1, cust_id);
		rSet = stmt.executeQuery();
		while(rSet.next()) {
		priceSum = rSet.getInt(1);}
		stmt.close();
		
		}catch(Exception e) {
			
		}
		
		return priceSum;
		
	}
	
	public void cartDelete(int num) {
		String sql = "delete from cart where num=?";
		
		try {
			stmt = ConnectionDAO.getInstance().getConn().prepareStatement(sql);
			stmt.setInt(1, num);
			
			stmt.executeUpdate();
			stmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void cartDeleteAfterBuy(String cust_id) {
		String sql = "delete from cart where cust_id=?";

		try {
			stmt = ConnectionDAO.getInstance().getConn().prepareStatement(sql);
			stmt.setString(1, cust_id);

			stmt.executeUpdate();
			stmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	
	  public static void main(String[] args) { 
	  
	  CartDAO cartDAO = new CartDAO();
	  
	  System.out.println(cartDAO.priceSum("lee1234"));
	  
	  }
	 
}
