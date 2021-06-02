package net.developia.online.controllers;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.developia.online.services.MemberService;

@Controller
@RequestMapping("/check")
public class CheckController {
	@Autowired
	private MemberService memberService;
	
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@PostMapping("/emailcheck")
	@ResponseBody
	@Transactional
	public int emailcheck(@RequestParam(required = true) String email) {
		if(email.equals("")) {
			return 2;
		}
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("EMAIL", email);
			memberService.getMemberByEmail(map);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 1;
		}
		return 0;
	}
	
	@PostMapping("/phonecheck")
	@ResponseBody
	@Transactional
	public int phonecheck(@RequestParam(required = true) String phone) {
		if(phone.equals("")) {
			return 2;
		}
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("PHONE", phone);
			memberService.getMemberByPhone(map);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 1;
		}
		return 0;
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
	@Transactional
	public int idcheck(@RequestParam(required = true) String id) {
		if(id.equals("")) {
			return 2;
		}
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ID", id);
			memberService.getMemberById(map);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 1;
		}
		return 0;
	}
	
	@PostMapping("/nicknamecheck")
	@ResponseBody
	@Transactional
	public int nicknamecheck(@RequestParam(required = true) String nickname) {
		if(nickname.equals("")) {
			return 2;
		}
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("NICKNAME_ID", nickname);
			memberService.getMemberByNickname(map);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 1;
		}
		return 0;
	}
}
