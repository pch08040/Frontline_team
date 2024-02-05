package com.spring.frontline.dto;

public class SearchDTO {
	private String searchColumn;
	private String searchText;
	
	public String getSearchColumn() {
		return searchColumn;
	}
	public void setSearchColumn(String searchColumn) {
		this.searchColumn = searchColumn;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
			
	@Override
	public String toString() {
		return "SearchDTO [searchColumn=" + searchColumn + ", searchText=" + searchText + "]";
	}
	
}
