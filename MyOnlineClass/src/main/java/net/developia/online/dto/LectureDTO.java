package net.developia.online.dto;

import lombok.Data;

@Data
public class LectureDTO {
	private long id;
	private String name;
	private String genre;
	private String image;
	private long duration;
	private String caution;
	private String introduce;
	private String thumbnail;
}
