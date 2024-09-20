package bean;

import java.time.LocalDate;

public class DateDTO {
	private LocalDate today = LocalDate.now() ;
	
	public int getMonth () {
		return today.getMonthValue();
	}
	
	public int getDay () {
		return today.getDayOfMonth();
	}
	
}
