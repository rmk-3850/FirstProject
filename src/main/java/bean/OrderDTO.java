package bean;

import lombok.Data;

@Data
public class OrderDTO {
	private String product_B_code; /* 상품 대분류 */
	private String product_code; /* 상품코드(소분류) */
	private String product_name; /* 상품명 */
	private int product_price; /* 가격 */
	private int product_ea; /* 수량 */
	private String branch_code;

}
