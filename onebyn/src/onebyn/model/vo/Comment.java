package onebyn.model.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public @Data class Comment {
	
	private String comId;
	private String cboardId;
	private String comment;
	private String cwriterId;
	private Date cenrollDate;
	private Boolean secret;
}
