package net.developia.online.services;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.LectureDTO;

public interface LectureService {
	public LectureDTO getLecture(long lectureNo) throws Exception;
	public void MemberLectureRegister(HashMap<String, Object> map) throws Exception;
}
