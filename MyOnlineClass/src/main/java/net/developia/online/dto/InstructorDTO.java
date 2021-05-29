package net.developia.online.dto;

import lombok.Data;
// private String id; 에서 -> member_id로 수정 // 김남수(5/29 5:23)
@Data
public class InstructorDTO {
	private String member_id;
	private String name; // member table
	private String nickname;
	private String introduce;
	private String image;
	private String email; // member table
	private String phone; // member table
}
