package net.developia.online.services;

import java.util.HashMap;
import java.util.List;

import net.developia.online.dto.LectureDTO;

public interface LectureService {
	public LectureDTO getLecture(long lectureNo) throws Exception;

	public void enrollLecture(HashMap<String, Object> map) throws Exception; // 클래스 개설

	public void MemberLectureRegister(HashMap<String, Object> map) throws Exception; // 수강신청

	//public void MemberLectureRegister(String MemberId) throws Exception; // 수강생 여부 확인

	public List<LectureDTO> getLectureName(String term) throws Exception;
	
	public void deleteLecture(long lectureNo) throws Exception;
}
