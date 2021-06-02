package net.developia.online.dao;

import java.sql.SQLException;
import java.util.List;

import net.developia.online.dto.CardDTO;

public interface CardDAO {
	List<CardDTO> getCardList() throws SQLException;
	List<CardDTO> getCardListWithKeyword(String keyword) throws SQLException;
	List<CardDTO> getCardListSortedByEnroll() throws SQLException;
	List<CardDTO> getCardListSortedByDeadline() throws SQLException;
}
