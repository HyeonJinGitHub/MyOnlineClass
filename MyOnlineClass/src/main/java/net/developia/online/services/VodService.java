package net.developia.online.services;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import net.developia.online.dto.VodDTO;

public interface VodService {
	List<VodDTO> getVodList(long lectureNo) throws SQLException;

	void registerLectureVod(HashMap<String, Object> map) throws SQLException;

	/*
	void registerVod(VodDTO vodDTO) throws SQLException;
	*/
}
