package net.developia.online.controllers;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import net.developia.online.dto.LectureDTO;
import net.developia.online.services.LectureService;
import net.developia.online.util.DateFormatClass;

@Slf4j
@Controller
@RequestMapping("/memberLecture")
public class MemberLectureController {
	@Autowired
	private LectureService lectureService;

	private static Logger logger = LoggerFactory.getLogger(LectureDetailController.class);
	// 수강신청 컨트롤러!
	// URL 예시 : http://localhost/online/memberLecture/{no}
	@GetMapping("/{no}")
	@Transactional
	public ModelAndView memberLecture(@PathVariable(required = true) long no, HttpSession session) {
		ModelAndView mav = new ModelAndView("result");
		try {
			LectureDTO lectureDTO = lectureService.getLecture(no);
			System.out.println("★★★" + lectureDTO.toString());
			session.setAttribute("lecture_duration", lectureDTO.getDuration());
			mav.addObject("lectureDTO", lectureDTO);
			mav.addObject("url", "/online/memberLecture");
			mav.setViewName("memberLecture");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}

	// URL 예시 : http://localhost/online/memberLectureAction/{no}
	@GetMapping("/Action/{no}")
	@Transactional
	public ModelAndView memberLectureAction(@PathVariable(required = true) long no, HttpSession session) {
		ModelAndView mav = new ModelAndView("result");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String member_id = (String) session.getAttribute("id");
		if(member_id == null) {
			mav.addObject("msg", "로그인이 필요합니다.");
			mav.addObject("url", "/online/login");
			return mav;
		}
		System.out.println("action");
		try {
			LectureDTO lectureDTO = lectureService.getLecture(no);
			String now = DateFormatClass.strDateNow();
			String end = DateFormatClass.strDateEnd(lectureDTO.getDuration());
			map.put("lecture_id", no);
			map.put("member_id", member_id);
			map.put("start_date", now);
			map.put("end_date", end);
			lectureService.MemberLectureRegister(map);
			mav.addObject("msg", "수강신청이 완료되었습니다.");
			mav.addObject("url", "/online/mylecture");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}

	}
}
