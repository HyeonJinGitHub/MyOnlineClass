package net.developia.online.dao;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.LectureDTO;

public interface LectureDAO {
	LectureDTO getLecture(long lectureNo) throws Exception;
}
