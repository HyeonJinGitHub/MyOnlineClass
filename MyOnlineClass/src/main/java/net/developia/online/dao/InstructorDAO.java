package net.developia.online.dao;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.InstructorDTO;

public interface InstructorDAO {
	InstructorDTO getInstructor(long lectureNO) throws Exception;
	List<InstructorDTO> getInstructorList() throws SQLException;
	void registerInstructor(InstructorDTO instructorDTO) throws Exception;
	InstructorDTO getInstFlag(String id) throws Exception;
}
