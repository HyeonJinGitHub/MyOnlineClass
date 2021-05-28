package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.developia.online.dao.VodDAO;
import net.developia.online.dto.VodDTO;

@Service
public class VodServiceImpl implements VodService {
	@Autowired
	private VodDAO vodDAO;
	
	@Override
	public List<VodDTO> getVodList(long lectureNo) throws SQLException {
		
		return vodDAO.getVodList(lectureNo);
	}
	
	
	@Override
	public void registerVod(VodDTO vodDTO) throws SQLException{
		vodDAO.insertDTO(vodDTO);	
		
	}
	
	
}
