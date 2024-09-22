package bean;

import java.util.Objects;

public class ProductDTO {
	private String pd_B_code; /* 상품 대분류 */
	private String pd_code; /* 상품코드(소분류) */
	private String pd_name; /* 상품명 */
	private int pd_price; /* 가격 */
	private int pd_ea; /* 수량 */

	// 상품 대분류
	public String getPd_B_code() {
		return pd_B_code;
	}
	public void setPd_B_code(String pd_B_code) {
		this.pd_B_code = pd_B_code;
	}

	// 상품코드(소분류)
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}

	// 상품명
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	// 가격
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}

	// 수량
	public int getPd_ea() {
		return pd_ea;
	}
	public void setPd_ea(int pd_ea) {
		this.pd_ea = pd_ea;
	}

	@Override
	public boolean equals(Object o) {
		// 두 객체가 동일한 참조를 가리키고 있는지 체크
		if (this == o) {
			return true;
		}

		// o가 null인지, ProductDTO의 인스턴스인지 확인
		if (o == null || getClass() != o.getClass()) {
			return false;
		}

		ProductDTO product = (ProductDTO) o;
		//흠 대분류코드도 추가해야하지 않을까?
		return Objects.equals(pd_code, product.pd_code);
	}

	@Override
	public int hashCode() {
		//대분류도 받아야하지 않을까 > 근데 2개 어떻게 받지
		return Objects.hashCode(pd_code);
	}
}
