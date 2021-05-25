package net.developia.online.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.MemberDTO;
import net.developia.online.services.InstructorService;

@RestController
public class ClassTokController {
	@Autowired
	private InstructorService instructorService;
	
	@RequestMapping(value="instructorJson", produces = "application/json; charset=UTF-8")
	public List<InstructorDTO> getInstructor() throws Exception {
		List<InstructorDTO> list = instructorService.getInstructorList();
		
		return list;
	}
}
