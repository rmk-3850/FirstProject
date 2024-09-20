package bean;

import java.util.Objects;

public class AdminDTO {
    private String ad_id;
    private String ad_pw;
    private String ad_name;
    private String ad_ph;
    private String ad_mail;
	
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_pw() {
		return ad_pw;
	}
	public void setAd_pw(String ad_pw) {
		this.ad_pw = ad_pw;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getAd_ph() {
		return ad_ph;
	}
	public void setAd_ph(String ad_ph) {
		this.ad_ph = ad_ph;
	}
	public String getAd_mail() {
		return ad_mail;
	}
	public void setAd_mail(String ad_mail) {
		this.ad_mail = ad_mail;
	}
	
     @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdminDTO admin = (AdminDTO) o;
        return Objects.equals(ad_id, admin.ad_id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(ad_id);
    }
}
