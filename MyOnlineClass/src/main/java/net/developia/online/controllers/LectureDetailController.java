package net.developia.online.controllers;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.LectureDTO;
import net.developia.online.services.InstructorService;
import net.developia.online.services.LectureService;
import net.developia.online.services.MemberService;

@Slf4j
@Controller
@RequestMapping("/")
public class LectureDetailController {
	@Autowired
	private LectureService lectureService;

	@Autowired
	private InstructorService instructorService;

	@Autowired
	private MemberService memberService;

	private static Logger logger = LoggerFactory.getLogger(LectureDetailController.class);

	// URL 예시 : http://localhost/online/classdetail/1
	@GetMapping("/classdetail/{no}")
	@Transactional
	public ModelAndView detail(@PathVariable(required = true) long no, HttpSession session) {
		ModelAndView mav = new ModelAndView("result");

		boolean already = false; // 수강생 확인
		boolean teacher = false; // 강사 확인
		try {
			LectureDTO lectureDTO = lectureService.getLecture(no);
			InstructorDTO instructorDTO = instructorService.getInstructor(no);

			HashMap<String, Object> checkmap = new HashMap<String, Object>();
			checkmap.put("ID", session.getAttribute("id"));
			List<LectureDTO> data = memberService.checkMemberLecture(checkmap);

			for (LectureDTO dto : data) {
				long lecture_id = dto.getId();
				if (lecture_id == no) {
					// 현재 로그인한 회원이 이미 강의를 수강중인 경우
					already = true;
				}
			}

			if (instructorDTO.getMember_id().equals(session.getAttribute("id"))) {
				teacher = true;
			}

			mav.addObject("already", already);
			mav.addObject("teacher", teacher);
			mav.addObject("lectureDTO", lectureDTO);
			mav.addObject("instructorDTO", instructorDTO);
			mav.addObject("url", "/online/lecturedetail");
			mav.setViewName("lectureDetail");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}

	@GetMapping("/enroll")
	public ModelAndView enroll() throws Exception {

		return new ModelAndView("enroll");
	}

	@PostMapping(value = "/enrollAction")
	public ModelAndView enrollAction(HttpSession session, HttpServletRequest request,
			@RequestParam(required = true) String lecturename, @RequestParam(required = true) String genre,
			@RequestParam(required = true) long duration, @RequestParam(required = true) String caution,
			@RequestParam(required = true) String introduce, @RequestParam("thumbnail") MultipartFile file1,
			@RequestParam("image") MultipartFile file2) throws Exception {
		String path = "C:\\online\\resources\\lecture\\" + lecturename;
		File folder = new File(path);
		if (!folder.exists()) {
			try {
				File folder1 = new File(path + "\\thumbnail");
				File folder2 = new File(path + "\\image");
				folder1.mkdirs();
				folder2.mkdirs();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		/* 이미지 업로드 */
		String image1 = file1.getOriginalFilename();
		System.out.println(image1);
		String path1 = "C:/online/resources/lecture/" + lecturename + "/thumbnail";
		if (!file1.getOriginalFilename().isEmpty()) {
			file1.transferTo(new File(path1, image1));
		}

		String image2 = file2.getOriginalFilename();
		System.out.println(image2);
		String path2 = "C:/online/resources/lecture/" + lecturename + "/image";
		if (!file2.getOriginalFilename().isEmpty()) {
			file2.transferTo(new File(path2, image2));
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("MEMBERID", session.getAttribute("id"));
		map.put("LECTURENAME", lecturename);
		map.put("GENRE", genre);
		map.put("DURATION", duration);
		map.put("CAUTION", caution);
		map.put("INTRODUCE", introduce);
		map.put("THUMBNAIL", image1);
		map.put("IMAGE", image2);

		try {
			lectureService.enrollLecture(map);
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "강의 등록에 성공하였습니다.");
			mav.addObject("url", "/online/");
			mav.addObject("title", "성공");
			mav.addObject("type", "success");
			return mav;
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			return mav;
		}
	}

}
