package onebyn.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public @Data class Member {
	private String id;
	private String pw;
	private String name;
	private String phone;
}
