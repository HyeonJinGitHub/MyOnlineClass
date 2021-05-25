package net.developia.online.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/move")
public class MoveController {
	
	@GetMapping("/login")
	public ModelAndView login() throws Exception {
		return new ModelAndView("login");
	}
	
	@GetMapping("/home")
	public ModelAndView home() throws Exception {
		return new ModelAndView("home");
	}
	@GetMapping("/mylecture")
	public ModelAndView mylecture() throws Exception {
		return new ModelAndView("mylecture");
	}
	@GetMapping("/popular")
	public ModelAndView popular() throws Exception {
		return new ModelAndView("popular");
	}
	
	@GetMapping("/new")
	public ModelAndView new_page() throws Exception {
		return new ModelAndView("new");
	}
	
	@GetMapping("/event")
	public ModelAndView event() throws Exception {
		return new ModelAndView("event");
	}
	
	@GetMapping("/exhibition")
	public ModelAndView exhibition() throws Exception {
		return new ModelAndView("exhibition");
	}
	
	@GetMapping("/freeboard")
	public ModelAndView freeboard() throws Exception {
		return new ModelAndView("freeBoard");
	}
	
	@GetMapping("/mypage")
	public ModelAndView mypage() throws Exception {
		return new ModelAndView("mypage");
	}
	
	@GetMapping("/changePassword")
	public ModelAndView changePassword() throws Exception {
		return new ModelAndView("changePassword");
	}
	
	@GetMapping("/delete")
	public ModelAndView delete() throws Exception {
		return new ModelAndView("delete");
	}
	
	@GetMapping("/findId")
	public ModelAndView findId() throws Exception {
		return new ModelAndView("findId");
	}
	
	@GetMapping("/findPw")
	public ModelAndView findPw() throws Exception {
		return new ModelAndView("findPw");
	}
	
	@GetMapping("/join")
	public ModelAndView join() throws Exception {
		return new ModelAndView("join");
	}
}
