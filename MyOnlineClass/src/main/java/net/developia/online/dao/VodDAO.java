package net.developia.online.dao;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.VodDTO;

public interface VodDAO {
	List<VodDTO> searchVod(String id) throws SQLException;
}
