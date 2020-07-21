package com.identity.project.domain;

public class Review_Like_List {
	private String b_thumbnail;
	private String b_title;
	private String b_authors;
	private String cmt_like_date;
	private int cmt_like;
	private String cmt_content;
	private String m_nickname;
	private String cmt_id;
	private String isbn;
	
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getB_thumbnail() {
		return b_thumbnail;
	}
	public void setB_thumbnail(String b_thumbnail) {
		this.b_thumbnail = b_thumbnail;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_authors() {
		return b_authors;
	}
	public void setB_authors(String b_authors) {
		this.b_authors = b_authors;
	}
	public String getCmt_like_date() {
		return cmt_like_date;
	}
	public void setCmt_like_date(String cmt_like_date) {
		this.cmt_like_date = cmt_like_date.substring(0, 10);
	}
	public int getCmt_like() {
		return cmt_like;
	}
	public void setCmt_like(int cmt_like) {
		this.cmt_like = cmt_like;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getCmt_id() {
		return cmt_id;
	}
	public void setCmt_id(String cmt_id) {
		this.cmt_id = cmt_id;
	}
}
