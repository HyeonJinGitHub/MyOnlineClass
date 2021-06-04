package net.developia.online.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import net.developia.online.dto.VodDTO;

public interface VodDAO {
	//List<VodDTO> searchVod(String id) throws SQLException;

	List<VodDTO> getVodList(long lectureNo) throws SQLException;
	/*
	 * select *
		from video
		where id IN (select video_id
					from lecture_video
					where lecture_id = #{lectureNo})
	 * 
	 * */

	void insertDTO(VodDTO vodDTO) throws SQLException;
	
	void register_lecture_video(HashMap<String, Object> map) throws SQLException;
	
	void delete_video(long vodNo) throws SQLException;
}

