package bean;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class DashboardDTO {
    private String product_name;
    private int product_ea;
    private LocalDateTime reservation_date;
    private LocalDateTime reservation_time;
    private String notice_title;
    private String service_name;

}
