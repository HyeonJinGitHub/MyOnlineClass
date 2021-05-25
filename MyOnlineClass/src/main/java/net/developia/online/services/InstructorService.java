package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.InstructorDTO;

public interface InstructorService {
	List<InstructorDTO> getInstructorList() throws Exception;
}
