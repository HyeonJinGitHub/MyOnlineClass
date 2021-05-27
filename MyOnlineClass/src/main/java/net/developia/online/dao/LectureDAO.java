package net.developia.online.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import net.developia.online.dto.LectureDTO;

public interface LectureDAO {
	LectureDTO getLecture(long lectureNo) throws Exception;
	void MemberLectureRegister(HashMap<String, Object> map) throws Exception;
}
