package net.developia.online.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.developia.online.dao.CardDAO;
import net.developia.online.dto.CardDTO;

@Service
public class CardServiceImpl implements CardService {
	@Autowired
	private CardDAO cardDAO;
	
	@Override
	public List<CardDTO> getCardList()throws SQLException {
		return cardDAO.getCardList();
	}

	@Override
	public List<CardDTO> getCardListWithKeyword(String keyword) throws SQLException {
		return cardDAO.getCardListWithKeyword(keyword);
	}

	@Override
	public List<CardDTO> getCardListSortedByEnroll() throws SQLException {
		return cardDAO.getCardListSortedByEnroll();
	}

	@Override
	public List<CardDTO> getCardListSortedByDeadline() throws SQLException {
		return cardDAO.getCardListSortedByDeadline();
	}
}
