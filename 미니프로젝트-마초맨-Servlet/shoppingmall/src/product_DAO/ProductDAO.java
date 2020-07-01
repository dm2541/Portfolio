package product_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn_DAO.ConnectionDAO;
import product_DTO.CategoryBean;
import product_DTO.ProductBean;

public class ProductDAO {
	private static ProductDAO instance;
	private Connection conn;
	private PreparedStatement stmt;

	private ProductDAO() {
		this.conn = ConnectionDAO.getInstance().getConn();
	}

	public static ProductDAO getInstance() {
		return (instance == null) ? instance = new ProductDAO() : instance;

	}
	
	public List<ProductBean> productList(){
		String sql = "select product_code, product_name, product_price, category, sell_id, product_img from product";
		List<ProductBean> productList = null;
		ProductBean productBean = null;
		ResultSet rest = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			rest = stmt.executeQuery();
			
			productList = new ArrayList<ProductBean>();
			while(rest.next()) {
				productBean = new ProductBean();
				productBean.setProduct_code(rest.getString(1));
				productBean.setProduct_name(rest.getString(2));
				productBean.setProduct_price(rest.getInt(3));
				productBean.setCategory(rest.getString(4));
				productBean.setSell_id(rest.getString(5));
				productBean.setProduct_img(rest.getString(6));
				productList.add(productBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return productList;
	}
	
	public ProductBean productSearch(String product_code) {
		String sql = "select product_code, product_name, product_price, category, sell_id, product_img from product where product_code=?";
		ProductBean productBean = null;
		ResultSet rest = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, product_code);
			rest = stmt.executeQuery();
			
			if(rest.next()) {
				productBean = new ProductBean();
				productBean.setProduct_code(rest.getString(1));
				productBean.setProduct_name(rest.getString(2));
				productBean.setProduct_price(rest.getInt(3));
				productBean.setCategory(rest.getString(4));
				productBean.setSell_id(rest.getString(5));
				productBean.setProduct_img(rest.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return productBean;
	}
	
	public void productInsert(int product_price, String... product) {
		String sql = "insert into product values(?,?,?,?,?,?)";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, product[0]);
			stmt.setString(2, product[1]);
			stmt.setInt(3, product_price);
			stmt.setString(4, product[2]);
			stmt.setString(5, product[3]);
			stmt.setString(6, product[4]);
			stmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void productUpdate(int product_price, String... product) {
		String sql = "update product set product_code=?, product_name=?, product_price=? where product_code=?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, product[0]);
			stmt.setString(2, product[1]);
			stmt.setInt(3, product_price);
			stmt.setString(4, product[2]);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void productDelete(String product_code) {
		String sql = "delete from product where product_code=?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, product_code);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public List<ProductBean> categoryProduct(String category){
		String sql = "select product_code, product_name, product_price, category, sell_id, product_img from product where category=?"; 
		List<ProductBean> CategoryProductList = null;
		ProductBean productBean = null;
		ResultSet rest = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, category);
			rest = stmt.executeQuery();
			
			CategoryProductList = new ArrayList<ProductBean>();
			while(rest.next()) {
				productBean = new ProductBean();
				productBean.setProduct_code(rest.getString(1));
				productBean.setProduct_name(rest.getString(2));
				productBean.setProduct_price(rest.getInt(3));
				productBean.setCategory(rest.getString(4));
				productBean.setSell_id(rest.getString(5));
				productBean.setProduct_img(rest.getString(6));
				CategoryProductList.add(productBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return CategoryProductList;
	}
	
	public CategoryBean categorySearch(String category_big) {
		String sql = "select * from category where category_big=?";
		CategoryBean categoryBean = null;
		ResultSet rest = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, category_big);
			rest = stmt.executeQuery();
			
			if(rest.next()) {
				categoryBean = new CategoryBean();
				categoryBean.setCategory_big(rest.getString("category_big"));
				categoryBean.setCategory_small1(rest.getString("category_small1"));
				categoryBean.setCategory_small2(rest.getString("category_small2"));
				categoryBean.setCategory_small3(rest.getString("category_small3"));
				categoryBean.setCategory_small4(rest.getString("category_small4"));
				categoryBean.setCategory_small5(rest.getString("category_small5"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return categoryBean;
	}
	
	public void close() {
		try {
			if(stmt != null) stmt.close();
			if(conn == null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // close() end
	
	// 인스턴스가 가비지 컬렉터에 수집 대상이 되면 처리해라!
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		close();
		super.finalize();
	}
}