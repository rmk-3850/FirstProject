package bean;

import java.util.Date;
import java.util.Objects;

public class ReservationDTO {
    private int res_no;
    private Date res_date;
    private Date res_time;
    private String res_comm;
    private int cus_id;
    private String ser_code;

	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public Date getRes_time() {
		return res_time;
	}
	public void setRes_time(Date res_time) {
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
	public int getSer_code() {
		return cus_id;
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
