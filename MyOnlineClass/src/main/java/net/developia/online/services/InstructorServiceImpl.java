package net.developia.online.services;

import java.util.List;

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
}
