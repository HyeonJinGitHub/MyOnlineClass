package net.developia.online.util;

import lombok.Data;

@Data
public class PagingUtil {

	private int page;
	private int perPageNum; // 출력할 댓글 개수
	private int rowStart;
	private int rowEnd;
	
	public PagingUtil() {
		this.page = 1;
		this.perPageNum = 4;
	}
	
	public void setPage(long commentpage) {
		if (commentpage <= 0) {
			this.page = 1;
			return;
		}
		this.page = (int) commentpage;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}
	
}
