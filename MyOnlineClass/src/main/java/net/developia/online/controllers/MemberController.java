package net.developia.online.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.LectureDTO;
import net.developia.online.dto.MemberDTO;
import net.developia.online.services.MemberService;


@Controller
@RequestMapping("/")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	
	@PostMapping(value="/loginAction")
	@Transactional
	public ModelAndView loginAction(HttpSession session, @RequestParam(required = true) String id, @RequestParam(required = true) String password ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("id : " + id);
		System.out.println("password : " + password);
		map.put("ID", id);
		map.put("PASSWORD", DigestUtils.sha512Hex(password));
		try {
			memberService.login(map);
			List<MemberDTO> output = (List)map.get("MemberList");
			System.out.println(output);
			MemberDTO memberDTO = output.get(0);
			ModelAndView mav = new ModelAndView("result");
			session.setAttribute("id", memberDTO.getId()); 
			session.setAttribute("name", memberDTO.getName());
			session.setAttribute("email", memberDTO.getEmail()); 
			session.setAttribute("phone", memberDTO.getPhone());
			mav.setViewName("classtok");
			return mav;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			return mav;
		}
	}
	
	@GetMapping("/logout")
	@Transactional
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("classtok");
	}
	
	@PostMapping("/changePasswordAction")
	@Transactional
	public ModelAndView changePasswordAction(HttpSession session, @RequestParam(required = true) String pwd, @RequestParam(required = true) String newpwd) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("ID", session.getAttribute("id"));
		map.put("PWD", DigestUtils.sha512Hex(pwd));
		map.put("NEWPWD", DigestUtils.sha512Hex(newpwd));
		
		try {
			memberService.updatePassword(map);
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "비밀번호가 수정되었습니다.");
			mav.addObject("url", "/online/changePassword");
			mav.addObject("title", "성공");
			mav.addObject("type", "success");
			return mav;
			
 		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			return mav;
		}
	}
	
	@PostMapping("/deleteAction")
	@Transactional
	public ModelAndView deleteAction(HttpSession session, @RequestParam(required = true) String pwd) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("ID", session.getAttribute("id"));
		map.put("PWD", DigestUtils.sha512Hex(pwd));
		try {
			memberService.deleteMember(map);
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "탈퇴되었습니다. 이용해 주셔서 감사합니다.");
			mav.addObject("url", "/online/");
			mav.addObject("title", "성공");
			mav.addObject("type", "success");
			session.invalidate();
			return mav;
			
 		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			return mav;
		}
	}
	
	@PostMapping("/updateAction")
	@Transactional
	public ModelAndView updateAction(HttpSession session, @RequestParam(required = true) String uemail, @RequestParam(required = true) String uphone, @RequestParam(required = true) String pwd) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ID", session.getAttribute("id"));
		map.put("PWD", DigestUtils.sha512Hex(pwd));
		map.put("EMAIL", uemail);
		map.put("PHONE", uphone);
		try {
			memberService.updateInfo(map);
			session.setAttribute("email", uemail);
			session.setAttribute("phone", uphone);
			
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "회원정보가 수정되었습니다.");
			mav.addObject("url", "/online/mypage");
			mav.addObject("title", "성공");
			mav.addObject("type", "success");
			return mav;

 		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			return mav;

 		}
	}
	
	@PostMapping("/findIdAction")
	@Transactional
	public ModelAndView findIdAction(@RequestParam(required = true) String uemail) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("EMAIL", uemail);
		try {
			memberService.findId(map);
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", uemail + "로 아이디를 전송하였습니다.");
			mav.addObject("title", "성공");
			mav.addObject("url", "/online/");
			mav.addObject("type", "success");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}
	
	@PostMapping("/findPwAction")
	@Transactional
	public ModelAndView findPwAction(@RequestParam(required = true) String uid) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ID", uid);
		try {
			memberService.findPw(map);
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "계정에 등록된 이메일로 임시 비밀번호를 전송하였습니다.");
			mav.addObject("url", "/online/");
			mav.addObject("type", "success");
			mav.addObject("title", "성공");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}
	
	@PostMapping("/joinAction")
	@Transactional
	public ModelAndView joinAction(@RequestParam(required = true) String uid, @RequestParam(required = true) String uname, @RequestParam(required = true) String uemail, @RequestParam(required = true) String uphone,@RequestParam(required = true) String pwd ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ID", uid);
		map.put("PWD", DigestUtils.sha512Hex(pwd));
		map.put("NAME", uname);
		map.put("EMAIL", uemail);
		map.put("PHONE", uphone);
		try {
			memberService.join(map);
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "회원가입에 성공하였습니다.");
			mav.addObject("url", "/online/login");
			mav.addObject("type", "success");
			mav.addObject("title", "성공");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			mav.addObject("title", "실패");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}
	
	@GetMapping("/mylecture")
	@Transactional
	public ModelAndView mylecture(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ID", session.getAttribute("id"));
		ModelAndView mav = new ModelAndView("mylecture");
		try {
			HashMap<String, Object> lecture_map = new HashMap<String, Object>();
			memberService.getMemberLecture(map);
			List<LectureDTO> data = (List) map.get("MemberLectureList");
			for(LectureDTO dto : data) {
				long lecture_id = dto.getId();
				HashMap<String, Object> new_map = new HashMap<String, Object>();
				List<String> list = new ArrayList<String>();
				new_map.put("MEMBER_ID", session.getAttribute("id"));
				new_map.put("LECTURE_ID", lecture_id);
				memberService.getMemberLectureDate(new_map);
				List tmp_list = (List)new_map.get("MemberLectureDateList");
				HashMap<String, Object> memberLectureDate = (HashMap<String, Object>) tmp_list.get(0);
				list.add(memberLectureDate.get("START_DATE").toString());
				list.add(memberLectureDate.get("END_DATE").toString());
				list.add(Long.toString(lecture_id));
				lecture_map.put(dto.getName(), list);
			}
			mav.addObject("data", lecture_map);
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
		}
		return mav;
	}
	
	
	@GetMapping(value = {"/profile/{id}"})
	@Transactional
	public ModelAndView instructorGetAction(HttpSession session, @PathVariable(value="id") String id) {
		ModelAndView mav = new ModelAndView("instructor");
		try {
			return instructorDetail(mav, id);
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
		}
		return mav;
	}

	@PostMapping(value = {"/profile"})
	@Transactional
	public ModelAndView instructorPostAction(HttpSession session, @RequestParam(value="id") String id) {
		ModelAndView mav = new ModelAndView("instructor");
		try {
			return instructorDetail(mav, id);
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
		}
		return mav;
	}
	
	private ModelAndView instructorDetail(ModelAndView mav, String id) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ID", id);
		memberService.getInstructorInfo(map);
		List tmp_list = (List)map.get("InstructorList");
		List member_list = (List)map.get("MemberList");
		System.out.println("tmp_list : " + tmp_list.toString());
		System.out.println("member_list : " + member_list.toString());
		HashMap<String, Object> instructor = (HashMap<String, Object>) tmp_list.get(0);
		MemberDTO member = (MemberDTO) member_list.get(0);
		mav.addObject("nickname", instructor.get("NICKNAME").toString());
		mav.addObject("phone", member.getPhone());
		mav.addObject("name", member.getName());
		mav.addObject("email", member.getEmail());
		mav.addObject("introduce", instructor.get("INTRODUCE").toString());
		mav.addObject("instructorimage", instructor.get("IMAGE").toString());
		memberService.getInstructorLecture(map);
		List<LectureDTO> lecture_list = (List)map.get("InstructorLectureList");
		System.out.println("lecture list : " + lecture_list.toString());
		HashMap<String, Object> lecture_map = new HashMap<String, Object>();
		for(LectureDTO dto : lecture_list) {
			HashMap<String, Object> count_map = new HashMap<String, Object>();
			count_map.put("ID", dto.getId());
			memberService.getLectureCount(count_map);
			int output = Integer.parseInt(count_map.get("result").toString());
			List<String> list = new ArrayList<String>();
			list.add(Long.toString(dto.getId()));
			list.add(dto.getName());
			list.add(dto.getGenre());
			list.add(dto.getImage());
			list.add(Long.toString(dto.getDuration()));
			list.add(dto.getCaution());
			list.add(dto.getIntroduce());
			list.add(dto.getThumbnail());
			list.add(Integer.toString(output));
			list.add(id);
			lecture_map.put(Long.toString(dto.getId()), list);
		}
		System.out.println(lecture_map);
		mav.addObject("lecture", lecture_map);

		return mav;
	}

	@PostMapping("/getLectureInstructorInfo")
	@Transactional
	@ResponseBody
	public InstructorDTO getLectureInstructorInfo(HttpSession session, @RequestParam(required = true) String id, @RequestParam(required = true) String lecture_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("MEMBER_ID", id);
		map.put("LECTURE_ID", lecture_id);
		InstructorDTO instructorDTO = new InstructorDTO();
		
		try {
			memberService.getLectureInstructorInfo(map);
			List tmp_list = (List)map.get("LectureInstructorList");
			HashMap<String, Object> instructor = (HashMap<String, Object>) tmp_list.get(0);
			instructorDTO.setMember_id(id);
			instructorDTO.setEmail(session.getAttribute("email").toString());
			instructorDTO.setImage(instructor.get("IMAGE").toString());
			instructorDTO.setIntroduce(instructor.get("INTRODUCE").toString());
			instructorDTO.setName(session.getAttribute("name").toString());
			instructorDTO.setNickname(instructor.get("NICKNAME").toString());
			instructorDTO.setPhone(session.getAttribute("phone").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return instructorDTO;
	}
	
	
}
