package net.developia.online.dto;

import lombok.Data;

@Data
public class VodDTO{
	
	private long id;
	private String title;
	private String time;
	private String src;
	
	//임의로 추가
	private int isCheck= 0;
	private String thumbnail;
}