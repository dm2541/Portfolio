package product_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import product_DTO.ProductBean;

public class ProductDAO extends SuperDAO {
	private static ProductDAO instance;

	private ProductDAO() {

	}

	public static ProductDAO getInstance() {
		return (instance == null) ? instance = new ProductDAO() : instance;
	}

	public List<ProductBean> productList() {
		String sql = "select product_code, product_name, product_price, category, sell_id, product_img from product";
		List<ProductBean> productList = null;
		ProductBean productBean = null;

		try {
			stmt = conn.prepareStatement(sql);
			rest = stmt.executeQuery();

			productList = new ArrayList<ProductBean>();
			while (rest.next()) {
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
		} finally {
			resultSetClose(rest);
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

			if (rest.next()) {
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
		} finally {
			resultSetClose(rest);
		}

		return productBean;
	}

	public Boolean productInsert(int product_price, String... product) {
		String sql = "insert into product values(?,?,?,?,?,?)";
		int result = 0;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, product[0]);
			stmt.setString(2, product[1]);
			stmt.setInt(3, product_price);
			stmt.setString(4, product[2]);
			stmt.setString(5, product[3]);
			stmt.setString(6, product[4]);
			result = stmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			resultSetClose(rest);
		}
		
		if(result != 1) return false;
		else return true;
	}

	public Boolean productUpdate(int product_price, String... product) {
		String sql = "update product set product_code=?, product_name=?, product_price=? where product_code=?";
		int result = 0;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, product[0]);
			stmt.setString(2, product[1]);
			stmt.setInt(3, product_price);
			stmt.setString(4, product[2]);
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			resultSetClose(rest);
		}
		
		if(result != 1) return false;
		else return true;
	}

	public Boolean productDelete(String product_code) {
		String sql = "delete from product where product_code=?";
		int result = 0;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, product_code);
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			resultSetClose(rest);
		}
		
		if(result != 1) return false;
		else return false;	
		
	}

	public List<ProductBean> categoryProduct(String category) {
		String sql = "select product_code, product_name, product_price, category, sell_id, product_img from product where category=?";
		List<ProductBean> CategoryProductList = null;
		ProductBean productBean = null;
		ResultSet rest = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, category);
			rest = stmt.executeQuery();

			CategoryProductList = new ArrayList<ProductBean>();
			while (rest.next()) {
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
		} finally {
			resultSetClose(rest);
		}

		return CategoryProductList;
	}

	public void resultSetClose(ResultSet rest) {
		try {
			if (rest != null)
				rest.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (stmt != null)
				stmt.close();
			if (conn == null)
				conn.close();
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