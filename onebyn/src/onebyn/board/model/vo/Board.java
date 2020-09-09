package onebyn.board.model.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public @Data class Board {
	
	private int boardId;
	private String boardTitle;
	private String writerId;
	private String content;
	private Date enrollDate;
	private String hit;
	private String files;
	private String productCategori;
	private String productName;
	private String delivertTime;
	private String tradeArea;
	private String maxMems;
	private String curMemsList;
	private String limitTradeTime;
	private String tradeStage;
	private String trageStart;
	private String popularBoard;
	private int productPrice;
	private String ownStatus;
	private String tradeKind;
	
}
