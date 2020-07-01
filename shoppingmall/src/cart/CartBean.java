package cart;

public class CartBean {

	private int count;
	private String product_name;
	private String product_code;
	private String cust_id;
	private int num;
	private int product_price;
	private String product_img;

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + count;
		result = prime * result + ((cust_id == null) ? 0 : cust_id.hashCode());
		result = prime * result + num;
		result = prime * result + ((product_code == null) ? 0 : product_code.hashCode());
		result = prime * result + ((product_img == null) ? 0 : product_img.hashCode());
		result = prime * result + ((product_name == null) ? 0 : product_name.hashCode());
		result = prime * result + product_price;
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
		CartBean other = (CartBean) obj;
		if (count != other.count)
			return false;
		if (cust_id == null) {
			if (other.cust_id != null)
				return false;
		} else if (!cust_id.equals(other.cust_id))
			return false;
		if (num != other.num)
			return false;
		if (product_code == null) {
			if (other.product_code != null)
				return false;
		} else if (!product_code.equals(other.product_code))
			return false;
		if (product_img == null) {
			if (other.product_img != null)
				return false;
		} else if (!product_img.equals(other.product_img))
			return false;
		if (product_name == null) {
			if (other.product_name != null)
				return false;
		} else if (!product_name.equals(other.product_name))
			return false;
		if (product_price != other.product_price)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CartBean [count=" + count + ", product_name=" + product_name + ", product_code=" + product_code
				+ ", cust_id=" + cust_id + ", num=" + num + ", product_price=" + product_price + ", product_img="
				+ product_img + "]";
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getCust_id() {
		return cust_id;
	}

	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}

}
