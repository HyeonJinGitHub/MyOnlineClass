package net.developia.online.dto;

import lombok.Data;

@Data
public class VodDTO{
	
	private long id;
	private String title;
	private String time="12:23";
	private String src;
	
	//임의로 추가
	private int isCheck= 0;
	
	private long cnt;
	//private String poster="https://i.ibb.co/dBLbrRV/bg1.jpg";
	public String thumbnail;
	
	
	
}