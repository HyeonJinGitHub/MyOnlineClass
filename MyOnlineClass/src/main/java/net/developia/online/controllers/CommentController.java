package net.developia.online.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import net.developia.online.dto.CommentDTO;
import net.developia.online.services.CommentService;

@RestController
public class CommentController {

	@Autowired
	private CommentService commentService;
	

	@GetMapping(value = "/classdetail/{no}/{co}", produces = "application/json; charset=UTF-8")
	public List<CommentDTO> comment_list(@PathVariable("no") long no, @PathVariable("co") long co,@ModelAttribute("comments") CommentDTO comments) throws Exception {

		System.out.println("comment list 수집");
		List<CommentDTO> commentlist = commentService.getCommentList(no);

		System.out.println("★★★" + commentlist.toString());
		return commentlist;
	}
	
}
