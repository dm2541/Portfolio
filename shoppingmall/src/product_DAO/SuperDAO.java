package product_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import conn_DAO.ConnectionDAO;

public class SuperDAO {
	protected Connection conn = ConnectionDAO.getInstance().getConn();
	protected PreparedStatement stmt;
	protected ResultSet rest;
}
