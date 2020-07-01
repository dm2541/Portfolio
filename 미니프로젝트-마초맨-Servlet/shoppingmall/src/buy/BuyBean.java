package buy;

public class BuyBean {

	private int cart_count;
	private String cust_id;
	private String product_code;
	private int product_price;
	private String sell_id;

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cart_count;
		result = prime * result + ((cust_id == null) ? 0 : cust_id.hashCode());
		result = prime * result + ((product_code == null) ? 0 : product_code.hashCode());
		result = prime * result + product_price;
		result = prime * result + ((sell_id == null) ? 0 : sell_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BuyBean other = (BuyBean) obj;
		if (cart_count != other.cart_count)
			return false;
		if (cust_id == null) {
			if (other.cust_id != null)
				return false;
		} else if (!cust_id.equals(other.cust_id))
			return false;
		if (product_code == null) {
			if (other.product_code != null)
				return false;
		} else if (!product_code.equals(other.product_code))
			return false;
		if (product_price != other.product_price)
			return false;
		if (sell_id == null) {
			if (other.sell_id != null)
				return false;
		} else if (!sell_id.equals(other.sell_id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BuyBean [cart_count=" + cart_count + ", cust_id=" + cust_id + ", product_code=" + product_code
				+ ", product_price=" + product_price + ", sell_id=" + sell_id + "]";
	}

	public int getCart_count() {
		return cart_count;
	}

	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}

	public String getCust_id() {
		return cust_id;
	}

	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getSell_id() {
		return sell_id;
	}

	public void setSell_id(String sell_id) {
		this.sell_id = sell_id;
	}

}
