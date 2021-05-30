package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.online.dao.InstructorDAO;
import net.developia.online.dao.MemberDAO;
import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.MemberDTO;

@Slf4j
@Service
public class InstructorServiceImpl implements InstructorService {
	@Autowired
	private InstructorDAO instructorDAO;

	@Override
	public List<InstructorDTO> getInstructorList() throws Exception {
		return instructorDAO.getInstructorList();
	}
	
	@Override
	public InstructorDTO getInstructor(long lectureNo) throws Exception {
		try {
			System.out.println();
			InstructorDTO instructorDTO = instructorDAO.getInstructor(lectureNo);
			if (instructorDTO == null) {
				throw new RuntimeException("강사 정보를 받아올 수 없습니다.");
			}
			return instructorDTO;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void registerInstructor(InstructorDTO instructorDTO) throws Exception {
		instructorDAO.registerInstructor(instructorDTO);
	}

	@Override
	public InstructorDTO getInstFlag(String id) throws Exception {
		return instructorDAO.getInstFlag(id);
	}

	@Override
	public List<InstructorDTO> getNickname(String term) throws Exception {
		return instructorDAO.getNickname(term);
	}
}