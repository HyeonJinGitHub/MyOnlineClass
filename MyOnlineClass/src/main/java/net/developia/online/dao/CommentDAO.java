package net.developia.online.dao;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.CommentDTO;

public interface CommentDAO {
	List<CommentDTO> getCommentList(long lectureNo) throws SQLException;

	void insertComment(CommentDTO commentDTO) throws SQLException;

	void deleteComment(CommentDTO commentDTO) throws SQLException;

	int updateComment(CommentDTO commentDTO) throws SQLException;
}
