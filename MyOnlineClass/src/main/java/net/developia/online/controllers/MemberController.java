package net.developia.online.controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
			MemberDTO memberDTO = output.get(0);
			ModelAndView mav = new ModelAndView("result");
			session.setAttribute("id", memberDTO.getId()); 
			session.setAttribute("name", memberDTO.getName());
			session.setAttribute("email", memberDTO.getEmail()); 
			session.setAttribute("phone", memberDTO.getPhoneNumber());
			mav.setViewName("classtok");
			return mav;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}
	
	@GetMapping("/logout")
	@Transactional
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("home");
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
			mav.addObject("url", "/online/move/changePassword");
			return mav;
			
 		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
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
			session.invalidate();
			return mav;
			
 		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
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
			mav.addObject("url", "/online/move/mypage");
			return mav;

 		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
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
			mav.addObject("url", "/online/");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
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
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
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
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}
}
