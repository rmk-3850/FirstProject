package mybean.bean;

import java.util.Objects;

public class ProductDTO {
    private String pd_code;
    private String pd_name;
    private int pd_price;
    private int pd_ea;
    
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public int getPd_ea() {
		return pd_ea;
	}
	public void setPd_ea(int pd_ea) {
		this.pd_ea = pd_ea;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDTO product = (ProductDTO) o;
        return Objects.equals(pd_code, product.pd_code);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(pd_code);
    }
}
