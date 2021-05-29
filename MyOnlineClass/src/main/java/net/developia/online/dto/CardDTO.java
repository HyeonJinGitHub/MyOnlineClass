package net.developia.online.dto;

import lombok.Data;

@Data
public class CardDTO {
	private long id;
	private String thumbnail;
	private String lectureName;
	private String nickname;
	private String participants;
}
