package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import net.developia.online.dto.InstructorDTO;

public interface InstructorService {
	public InstructorDTO getInstructor(long lectureNo) throws Exception;
	
	List<InstructorDTO> getInstructorList() throws Exception;
	
	void registerInstructor(InstructorDTO instructorDTO) throws Exception;
	
	public InstructorDTO getInstFlag(String id) throws Exception;

	public List<InstructorDTO> getNickname(String term) throws Exception;
}
