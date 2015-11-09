package by.bigsoft.javaee.entity;

import java.io.Serializable;

public class SearchMusic implements Serializable{
	private String search;

	public SearchMusic() {
	}

	public SearchMusic(String search) {
		super();
		this.search = search;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}
