package net.developia.online.services;

import java.util.HashMap;

import net.developia.online.dto.LectureDTO;

public interface LectureService {
	public LectureDTO getLecture(long lectureNo) throws Exception;
	
	public void enrollLecture(HashMap<String, Object> map) throws Exception; // 클래스 개설
	
	public void MemberLectureRegister(HashMap<String, Object> map) throws Exception; // 수강신청
}
