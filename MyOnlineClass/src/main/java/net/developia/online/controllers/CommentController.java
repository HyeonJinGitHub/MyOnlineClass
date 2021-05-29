package net.developia.online.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import net.developia.online.dto.CommentDTO;
import net.developia.online.services.CommentService;
import net.developia.online.util.DateFormatClass;

@RestController
public class CommentController {

	@Autowired
	private CommentService commentService;

	@GetMapping(value = "/classdetail/{no}/{cno}", produces = "application/json; charset=UTF-8")
	public List<CommentDTO> comment_list(@PathVariable("no") long no, @PathVariable("cno") long co,
			@ModelAttribute("comments") CommentDTO comments) throws Exception {
		List<CommentDTO> commentlist = commentService.getCommentList(no);
		System.out.println("★★★" + commentlist.toString());
		return commentlist;
	}

	@PostMapping(value = "/classdetail/{no}", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<CommentDTO> comment_insert(@PathVariable("no") long no, @ModelAttribute("comments") CommentDTO comments,
			HttpServletRequest request, HttpSession session) throws Exception {
		comments.setLecture_id(no);
		comments.setMember_id((String) session.getAttribute("id"));
		comments.setContent(null);
		comments.setName((String) session.getAttribute("name"));
		comments.setRegdate(DateFormatClass.strDateNow());

		try {
			commentService.insertComment(comments);
			return commentService.getCommentList(no);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	/*
	 * @PostMapping(value = "/classdetail/{no}/{cno}", produces =
	 * "application/json; charset=UTF-8")
	 * 
	 * @ResponseBody public List<CommentDTO> comment_update(@ModelAttribute
	 * CommentDTO commentDTO, HttpServletRequest request, HttpSession session)
	 * throws Exception { commentDTO.setCom_ip(request.getRemoteAddr());
	 * commentDTO.setUserDTO((UserDTO) session.getAttribute("userInfo"));
	 * 
	 * log.info("comment_update() 메소드 수행"); log.info(commentDTO.toString());
	 * 
	 * boardService.updateComment(commentDTO); return
	 * boardService.getCommentList(commentDTO); }
	 * 
	 * @DeleteMapping(value = "/{com_no}", produces =
	 * "application/json; charset=UTF-8")
	 * 
	 * @ResponseBody public List<CommentDTO> comment_delete(@ModelAttribute
	 * CommentDTO commentDTO, HttpServletRequest request, HttpSession session)
	 * throws Exception { commentDTO.setCom_ip(request.getRemoteAddr());
	 * commentDTO.setUserDTO((UserDTO) session.getAttribute("userInfo"));
	 * 
	 * log.info("comment_delete() 메소드 수행"); log.info(commentDTO.toString());
	 * 
	 * boardService.deleteComment(commentDTO); return
	 * boardService.getCommentList(commentDTO); }
	 */
}