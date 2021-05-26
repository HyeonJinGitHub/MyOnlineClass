package net.developia.online.dto;

import lombok.Data;

@Data
public class CommentDTO {
	private long no;
	private String member_id;
	private String member_name;
	private long lecture_id;
	private String content;
	private String regdate;
}
