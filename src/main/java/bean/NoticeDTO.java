package bean;

import java.time.LocalDate;

import lombok.Data;

@Data
public class NoticeDTO {
	int notice_no;
	String notice_title;
	String notice_content;
	LocalDate notice_reg;

}
