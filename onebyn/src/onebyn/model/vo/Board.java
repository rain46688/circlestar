package onebyn.model.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public @Data class Board {
	
	private int id;
	private String title;
	private String writerId;
	private String content;
	private Date regdate;
	private String hit;
	private String files;
	
}
