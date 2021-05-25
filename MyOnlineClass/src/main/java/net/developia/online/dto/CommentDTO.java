package net.developia.online.dto;

import lombok.Data;

@Data
public class CommentDTO {
	private String member_id;
	private long lecture_id;
	private String content;
	private String regdate;
}
