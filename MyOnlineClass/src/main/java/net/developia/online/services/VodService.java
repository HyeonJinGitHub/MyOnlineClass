package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.VodDTO;

public interface VodService {
	List<VodDTO> getVodList(long lectureNo) throws SQLException;
}
