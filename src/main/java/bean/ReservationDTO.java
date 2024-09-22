package bean;

import java.util.Objects;


public class ReservationDTO {
    private int res_no;
    private String res_date;
    private String res_time;
    private String res_comm;
    private int cus_id;
    private String cus_name;
    private String ser_name;
    private int ser_cnt;

    public int getSer_cnt() {
		return ser_cnt;
	}
	public void setSer_cnt(int ser_cnt) {
		this.ser_cnt = ser_cnt;
	}

	private String ser_code;

	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getSer_name() {
		return ser_name;
	}
	public void setSer_name(String ser_name) {
		this.ser_name = ser_name;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	public String getRes_comm() {
		return res_comm;
	}
	public void setRes_comm(String res_comm) {
		this.res_comm = res_comm;
	}
	public int getCus_id() {
		return cus_id;
	}
	public void setCus_id(int cus_id) {
		this.cus_id = cus_id;
	}

	public String getSer_code() {
		return ser_code;
	}
	public void setSer_code(String ser_code) {
		this.ser_code = ser_code;
	}
	
	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReservationDTO reservation = (ReservationDTO) o;
        return Objects.equals(res_no, reservation.res_no);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(res_no);
    }

}