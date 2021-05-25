package net.developia.online.controllers;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.LectureDTO;
import net.developia.online.services.LectureService;

@Controller
@RequestMapping("/")
public class LectureDetailController {
	@Autowired
	private LectureService lectureService;

	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	// URL 예시 : http://localhost/online/classDetail?no=1
	@GetMapping("/classDetail")
	@Transactional
	public ModelAndView detail(@RequestParam(required = true) long no, HttpSession session) {
		ModelAndView mav = new ModelAndView("result");
		System.out.println("lecture no :" + no);

		try {
			// 세션값 + comment 추가
			LectureDTO lectureDTO = lectureService.getLecture(no);
			InstructorDTO instructorDTO = lectureService.getInstructor(no);

			System.out.println("★★★" + lectureDTO.toString());

			mav.addObject("lectureDTO", lectureDTO);
			mav.addObject("instructorDTO", instructorDTO);
			mav.addObject("url", "/online/lectureDetail");
			mav.setViewName("lectureDetail");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
}
