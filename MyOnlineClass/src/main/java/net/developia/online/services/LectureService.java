package net.developia.online.services;

import java.util.HashMap;

import net.developia.online.dto.LectureDTO;

public interface LectureService {
	public LectureDTO getLecture(long lectureNo) throws Exception;
	
	public void enrollLecture(HashMap<String, Object> map) throws Exception;
}
