package net.developia.online.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import net.developia.online.dto.MemberDTO;

public interface MemberDAO {
	void insert(HashMap<String, Object> map) throws Exception;

	void selectMemberById(HashMap<String, Object> map) throws SQLException;
	
	void selectMemberByEmail(HashMap<String, Object> map) throws SQLException;
	
	void selectMemberByPhone(HashMap<String, Object> map) throws SQLException;
	
	void selectMember(HashMap<String, Object> map) throws SQLException;
	
	void updateInfo(HashMap<String, Object> map) throws SQLException;
	
	void updatePassword(HashMap<String, Object> map) throws SQLException;
	
	void findId(HashMap<String, Object> map) throws SQLException;
	
	void deleteMember(HashMap<String, Object> map) throws SQLException;
	
	List<MemberDTO> searchMember(String id) throws SQLException;

	void findPw(HashMap<String, Object> map) throws SQLException;
	
	void getMemberLecture(HashMap<String, Object> map) throws SQLException;

	void getMemberLectureDate(HashMap<String, Object> new_map) throws SQLException;

	void getInstructorInfo(HashMap<String, Object> map) throws SQLException;

	void getInstructorLecture(HashMap<String, Object> map) throws SQLException;
	
	void getLectureCount(HashMap<String, Object> map) throws SQLException;

	void getLectureInstructorInfo(HashMap<String, Object> map) throws SQLException;

}
