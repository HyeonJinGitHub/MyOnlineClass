package net.developia.online.services;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.online.dao.LectureDAO;
import net.developia.online.dto.LectureDTO;


@Slf4j
@Service
public class LectureServiceImpl implements LectureService {
	@Autowired
	private LectureDAO lectureDAO;
	
	@Override
	public LectureDTO getLecture(long lectureNo) throws Exception {
		try {
			LectureDTO lectureDTO = lectureDAO.getLecture(lectureNo);
			if (lectureDTO == null) {
				throw new RuntimeException("잘못된 클래스 번호입니다.");
			}
			return lectureDTO;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}


	@Override
	public void enrollLecture(HashMap<String, Object> map) throws Exception {
		try {
			lectureDAO.enroll(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}
	

	@Override
	public void MemberLectureRegister(HashMap<String, Object> map) throws Exception {
		try {
			//이미 수강중인 멤버인 경우 -> 동영상 페이지로 이동
			//본인 강의에 수강하려는 경우 -> 불가!
			lectureDAO.MemberLectureRegister(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
}
