package com.identity.project.domain;

public class Comments {
	private int cmt_no;
	private String isbn;
	private String cmt_id;
	private String cmt_mbti;
	private String cmt_content;
	private String cmt_date;
	private int cmt_like;
	private String cmt_nickname;
	private Book book;
	private String m_file;
	
	
	public String getM_file() {
		return m_file;
	}
	public void setM_file(String m_file) {
		this.m_file = m_file;
	}
	public String getCmt_nickname() {
		return cmt_nickname;
	}
	public void setCmt_nickname(String cmt_nickname) {
		this.cmt_nickname = cmt_nickname;
	}
	public int getCmt_no() {
		return cmt_no;
	}
	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getCmt_id() {
		return cmt_id;
	}
	public void setCmt_id(String cmt_id) {
		this.cmt_id = cmt_id;
	}
	public String getCmt_mbti() {
		return cmt_mbti;
	}
	public void setCmt_mbti(String cmt_mbti) {
		this.cmt_mbti = cmt_mbti;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_date() {
		return cmt_date.substring(0,11);
	}
	public void setCmt_date(String cmt_date) {
		this.cmt_date = cmt_date;
	}
	public int getCmt_like() {
		return cmt_like;
	}
	public void setCmt_like(int cmt_like) {
		this.cmt_like = cmt_like;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
	
}
