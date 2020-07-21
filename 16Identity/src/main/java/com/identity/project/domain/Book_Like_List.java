package com.identity.project.domain;

public class Book_Like_List {
	private int no;
	private String like_date;
	private String isbn;
	private String b_title;
	private String b_thumbnail;
	private String b_authors;
	private int like_count;
	
	
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getLike_date() {
		return like_date;
	}
	public void setLike_date(String like_date) {
		this.like_date = like_date.substring(0, 10);
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_thumbnail() {
		return b_thumbnail;
	}
	public void setB_thumbnail(String b_thumbnail) {
		this.b_thumbnail = b_thumbnail;
	}
	public String getB_authors() {
		return b_authors;
	}
	public void setB_authors(String b_authors) {
		this.b_authors = b_authors;
	}
	
	
}
