package bean;

import java.util.Objects;

public class ServiceDTO {
    private String ser_code;
    private String ser_name;
    private int ser_price;
    private int ser_cnt;

	public String getSer_code() {
		return ser_code;
	}
	public void setSer_code(String ser_code) {
		this.ser_code = ser_code;
	}
	public String getSer_name() {
		return ser_name;
	}
	public void setSer_name(String ser_name) {
		this.ser_name = ser_name;
	}
	public int getSer_price() {
		return ser_price;
	}
	public void setSer_price(int ser_price) {
		this.ser_price = ser_price;
	}
	public int getSer_cnt() {
		return ser_cnt;
	}
	public void setSer_cnt(int ser_cnt) {
		this.ser_cnt = ser_cnt;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ServiceDTO service = (ServiceDTO) o;
        return Objects.equals(ser_code, service.ser_code);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(ser_code);
    }
}
