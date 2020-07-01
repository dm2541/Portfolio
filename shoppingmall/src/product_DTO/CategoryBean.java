package product_DTO;

public class CategoryBean {
	private String category_big;
	private String category_small1;
	private String category_small2;
	private String category_small3;
	private String category_small4;
	private String category_small5;

	public String getCategory_big() {
		return category_big;
	}

	public String getCategory_small1() {
		return category_small1;
	}

	public String getCategory_small2() {
		return category_small2;
	}

	public String getCategory_small3() {
		return category_small3;
	}

	public String getCategory_small4() {
		return category_small4;
	}

	public String getCategory_small5() {
		return category_small5;
	}

	public void setCategory_big(String category_big) {
		this.category_big = category_big;
	}

	public void setCategory_small1(String category_small1) {
		this.category_small1 = category_small1;
	}

	public void setCategory_small2(String category_small2) {
		this.category_small2 = category_small2;
	}

	public void setCategory_small3(String category_small3) {
		this.category_small3 = category_small3;
	}

	public void setCategory_small4(String category_small4) {
		this.category_small4 = category_small4;
	}

	public void setCategory_small5(String category_small5) {
		this.category_small5 = category_small5;
	}

	@Override
	public String toString() {
		return "CategoryBean [category_big=" + category_big + ", category_small1=" + category_small1
				+ ", category_small2=" + category_small2 + ", category_small3=" + category_small3 + ", category_small4="
				+ category_small4 + ", category_small5=" + category_small5 + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((category_big == null) ? 0 : category_big.hashCode());
		result = prime * result + ((category_small1 == null) ? 0 : category_small1.hashCode());
		result = prime * result + ((category_small2 == null) ? 0 : category_small2.hashCode());
		result = prime * result + ((category_small3 == null) ? 0 : category_small3.hashCode());
		result = prime * result + ((category_small4 == null) ? 0 : category_small4.hashCode());
		result = prime * result + ((category_small5 == null) ? 0 : category_small5.hashCode());
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
		CategoryBean other = (CategoryBean) obj;
		if (category_big == null) {
			if (other.category_big != null)
				return false;
		} else if (!category_big.equals(other.category_big))
			return false;
		if (category_small1 == null) {
			if (other.category_small1 != null)
				return false;
		} else if (!category_small1.equals(other.category_small1))
			return false;
		if (category_small2 == null) {
			if (other.category_small2 != null)
				return false;
		} else if (!category_small2.equals(other.category_small2))
			return false;
		if (category_small3 == null) {
			if (other.category_small3 != null)
				return false;
		} else if (!category_small3.equals(other.category_small3))
			return false;
		if (category_small4 == null) {
			if (other.category_small4 != null)
				return false;
		} else if (!category_small4.equals(other.category_small4))
			return false;
		if (category_small5 == null) {
			if (other.category_small5 != null)
				return false;
		} else if (!category_small5.equals(other.category_small5))
			return false;
		return true;
	}

}
