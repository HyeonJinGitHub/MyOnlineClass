package net.developia.online.services;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import net.developia.online.dto.MemberDTO;

public interface MemberService {

	public void join(HashMap<String, Object> map) throws Exception;

	public void getMemberById(HashMap<String, Object> map) throws Exception;
	
	public void getMemberByEmail(HashMap<String, Object> map) throws Exception;
	
	public void getMemberByPhone(HashMap<String, Object> map) throws Exception;
	
	public void login(HashMap<String, Object> map) throws Exception;
	
	public void updateInfo(HashMap<String, Object> map) throws Exception;
	
	public void updatePassword(HashMap<String, Object> map) throws Exception;
	
	public List<MemberDTO> getMember() throws SQLException;
	
	public void deleteMember(HashMap<String, Object> map) throws Exception;
	
	public List<MemberDTO> searchMember(String id) throws SQLException;

	public void findId(HashMap<String, Object> map) throws Exception;

	public void findPw(HashMap<String, Object> map) throws Exception;
}
