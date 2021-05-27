package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.CommentDTO;

public interface CommentService {
	List<CommentDTO> getCommentList(long lectureNo) throws SQLException;

	void insertComment(CommentDTO commentDTO) throws SQLException;

	void deleteComment(CommentDTO commentDTO) throws SQLException;

	void updateComment(CommentDTO commentDTO) throws SQLException;
}
