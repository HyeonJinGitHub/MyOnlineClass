package net.developia.online.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import net.developia.online.dto.CommentDTO;
import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.LectureDTO;
import net.developia.online.services.CommentService;
import net.developia.online.services.InstructorService;
import net.developia.online.services.LectureService;

@Slf4j
@Controller
@RequestMapping("/classDetail")
public class LectureDetailController {
	@Autowired
	private LectureService lectureService;

	@Autowired
	private InstructorService instructorService;

	@Autowired
	private CommentService commentService;

	private static Logger logger = LoggerFactory.getLogger(LectureDetailController.class);

	// URL 예시 : http://localhost/online/classDetail/1
	@GetMapping("/{no}")
	@Transactional
	public ModelAndView detail(@PathVariable(required = true) long no, HttpSession session) {
		ModelAndView mav = new ModelAndView("result");

		try {
			// 세션값 + comment 추가
			LectureDTO lectureDTO = lectureService.getLecture(no);
			InstructorDTO instructorDTO = instructorService.getInstructor(no);

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

	
	@GetMapping(value = "/classDetail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<CommentDTO> comment_list(@RequestParam(required = true) long no) throws Exception {
		System.out.println("comment list 수집");
		List<CommentDTO> list = commentService.getCommentList(no);
		return list;
	}
/*
	@PostMapping(value = "/{cno}", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<CommentDTO> comment_update(@ModelAttribute CommentDTO commentDTO, HttpServletRequest request,
			HttpSession session) throws Exception {
		commentDTO.setCom_ip(request.getRemoteAddr());
		commentDTO.setUserDTO((UserDTO) session.getAttribute("userInfo"));

		log.info("comment_update() 메소드 수행");
		log.info(commentDTO.toString());

		boardService.updateComment(commentDTO);
		return boardService.getCommentList(commentDTO);
	}

	@DeleteMapping(value = "/{com_no}", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<CommentDTO> comment_delete(@ModelAttribute CommentDTO commentDTO, HttpServletRequest request,
			HttpSession session) throws Exception {
		commentDTO.setCom_ip(request.getRemoteAddr());
		commentDTO.setUserDTO((UserDTO) session.getAttribute("userInfo"));

		log.info("comment_delete() 메소드 수행");
		log.info(commentDTO.toString());

		boardService.deleteComment(commentDTO);
		return boardService.getCommentList(commentDTO);
	}*/

}
