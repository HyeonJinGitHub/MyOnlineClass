package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.online.dao.CommentDAO;
import net.developia.online.dto.CommentDTO;
import net.developia.online.dto.InstructorDTO;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public List<CommentDTO> getCommentList(long lectureNo) throws SQLException {
		return commentDAO.getCommentList(lectureNo);
	}

	@Override
	public void insertComment(CommentDTO commentDTO) throws SQLException {
		try {
			commentDAO.insertComment(commentDTO);
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		}
	}

	@Override
	public void deleteComment(CommentDTO commentDTO) throws SQLException {
		try {
			commentDAO.deleteComment(commentDTO);
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		}
	}

	@Override
	public void updateComment(CommentDTO commentDTO) throws SQLException {
		try {
			commentDAO.updateComment(commentDTO);
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		}
	}
}
