package net.developia.online.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 4;
	private PagingUtil pageUtil;
	
	public void setpu(PagingUtil pageUtil) {
		this.pageUtil = pageUtil;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	 
	private void calcData() {
		endPage = (int) (Math.ceil(pageUtil.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)pageUtil.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * pageUtil.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(long commentpage) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", commentpage)
							.queryParam("perPageNum", pageUtil.getPerPageNum())
							.build();
		System.out.println("URI" + uriComponents.toUriString());
		return uriComponents.toUriString();
	}
}