package net.developia.online.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class VodDTO implements Serializable {
	
	private long id;
	private long lesson;
	private String title;
	private String information;
	private String url;
	
}