package net.developia.online.dto;

import lombok.Data;

@Data
public class InstructorDTO {
	private String id;
	private String name; // member table
	private String nickname;
	private String introduce;
	private String image;
	private String email; // member table
	private String phone; // member table
}
