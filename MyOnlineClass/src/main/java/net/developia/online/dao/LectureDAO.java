package net.developia.online.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import net.developia.online.dto.LectureDTO;

public interface LectureDAO {
	LectureDTO getLecture(long lectureNo) throws Exception;
	
	void enrollLecture(HashMap<String, Object> map) throws SQLException;
	
	void enroll(HashMap<String, Object> map) throws Exception;
}
