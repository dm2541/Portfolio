package cust_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn_DAO.ConnectionDAO;
import cust_DTO.CustomerBean;

public class ListCustomerDAO {
	private Connection conn;
	private PreparedStatement stmt;
	
	public ListCustomerDAO() {
		this.conn = ConnectionDAO.getInstance().getConn();
	}
	
	public List<CustomerBean> customerList(){
		String sql = "select cust_id, cust_tel, cust_addr, cust_name from customer";
		List<CustomerBean> customerList = null;
		CustomerBean customerBean = null;
		ResultSet rest = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			rest = stmt.executeQuery();
			
			customerList = new ArrayList<CustomerBean>();
			while(rest.next()) {
				customerBean = new CustomerBean();
				customerBean.setCust_id(rest.getString(1));
				customerBean.setCust_tel(rest.getString(2));
				customerBean.setCust_addr(rest.getString(3));
				customerBean.setCust_name(rest.getString(4));
				customerList.add(customerBean);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return customerList;
	}
}
