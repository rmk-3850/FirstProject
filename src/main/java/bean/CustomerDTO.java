package bean;

import java.util.Objects;

public class CustomerDTO {
    private int cus_id;
    private String cus_name;
    private String cus_ph;
    private String cus_mail;
    private String cus_reg;
    private String cus_rank;
    
	public int getCus_id() {
		return cus_id;
	}
	public void setCus_id(int cus_id) {
		this.cus_id = cus_id;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getCus_ph() {
		return cus_ph;
	}
	public void setCus_ph(String cus_ph) {
		this.cus_ph = cus_ph;
	}
	public String getCus_mail() {
		return cus_mail;
	}
	public void setCus_mail(String cus_mail) {
		this.cus_mail = cus_mail;
	}
	public String getCus_reg() {
		return cus_reg;
	}
	public void setCus_reg(String cus_reg) {
		this.cus_reg = cus_reg;
	}
	public String getCus_rank() {
		return cus_rank;
	}
	public void setCus_rank(String cus_rank) {
		this.cus_rank = cus_rank;
	}
	
     @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CustomerDTO customer = (CustomerDTO) o;
        return Objects.equals(cus_id, customer.cus_id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(cus_id);
    }
}
