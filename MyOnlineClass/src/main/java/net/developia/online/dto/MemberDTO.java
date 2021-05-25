package net.developia.online.dto;

import java.io.Serializable;

import org.apache.commons.codec.digest.DigestUtils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO implements Serializable {
	private String id;
	private String password;
	private String name;
	private String email;
	private String phoneNumber;

	public void setPassword(String password) {
		this.password = DigestUtils.sha512Hex(password);
	}

}
