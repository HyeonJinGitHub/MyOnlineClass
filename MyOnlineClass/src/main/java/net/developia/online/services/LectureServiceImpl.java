package net.developia.online.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.online.dao.InstructorDAO;
import net.developia.online.dao.LectureDAO;
import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.LectureDTO;


@Slf4j
@Service
public class LectureServiceImpl implements LectureService {
	@Autowired
	private LectureDAO lectureDAO;

	private InstructorDAO insturctorDAO;
	
	@Override
	public InstructorDTO getInstructor(long lectureNo) throws Exception {
		try {
			System.out.println();
			InstructorDTO instructorDTO = insturctorDAO.getInstructor(lectureNo);
			if (instructorDTO == null) {
				throw new RuntimeException("잘못된 클래스 번호입니다.");
			}
			return instructorDTO;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
	
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
	
}
