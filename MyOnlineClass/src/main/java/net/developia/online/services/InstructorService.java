package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.InstructorDTO;

public interface InstructorService {
	public InstructorDTO getInstructor(long lectureNo) throws Exception;
	
	List<InstructorDTO> getInstructorList() throws Exception;
}
