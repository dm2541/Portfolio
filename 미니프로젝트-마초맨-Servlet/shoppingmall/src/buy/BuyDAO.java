package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import conn_DAO.ConnectionDAO;

public class BuyDAO {

	private static BuyDAO instance;
	private Connection conn;

	private BuyDAO() {
		this.conn = ConnectionDAO.getInstance().getConn();
	}

	public static BuyDAO getInstance() {
		return (instance == null) ? instance = new BuyDAO() : instance;
	}
	
	
	
	// DB Buy ���̺� �������� �Է�
	public void buyInsert(List<BuyBean> buyList) {

		PreparedStatement stmt = null;

		String sql = "insert into buy values(?,?,?,?,?)";

		try {

			stmt = conn.prepareStatement(sql);

			for (BuyBean buyBean : buyList) {

				stmt.setInt(1, buyBean.getCart_count());
				stmt.setString(2, buyBean.getCust_id());
				stmt.setString(3, buyBean.getProduct_code());
				stmt.setInt(4, buyBean.getProduct_price());
				stmt.setString(5, buyBean.getSell_id());

				stmt.executeUpdate();
			}

			stmt.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}