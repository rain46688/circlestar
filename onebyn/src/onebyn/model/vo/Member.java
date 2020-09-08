package onebyn.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public @Data class Member {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickname;
	private String phone;
	private String address;
	private String email;
	private Date enrollDate;
	private String grade;
	private String curRoomCnt;
	private String maxRoomCnt;
	private String reportCnt;
	private String point;
	private Boolean leaveMem;
	private String curTradeList;
	private String tradeList;
	private String likeList;
	
}
