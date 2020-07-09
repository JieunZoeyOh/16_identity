package com.identity.project.domain;

public class Deliver {
	private int no;
	private String m_id;
	private String isbn;
	private String deliver_date;
	private String state;
	private Book book;
	private Member member;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getDeliver_date() {
		return deliver_date.substring(0, 7);
	}
	public void setDeliver_date(String deliver_date) {
		this.deliver_date = deliver_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}

}
