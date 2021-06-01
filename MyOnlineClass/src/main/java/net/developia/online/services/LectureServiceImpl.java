package net.developia.online.services;

import java.util.HashMap;
import java.util.List;

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
			lectureDAO.MemberLectureRegister(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<LectureDTO> getLectureName(String term) throws Exception {
		return lectureDAO.getLectureName(term);
	}
	
	@Override
	public void deleteLecture(long lectureNo) {
		
		try {
			lectureDAO.deleteLecture(lectureNo);
			}
			catch(Exception e) {
				System.out.println("삭제 에러");
				System.out.println(e);
			}
			
		
	}
}
