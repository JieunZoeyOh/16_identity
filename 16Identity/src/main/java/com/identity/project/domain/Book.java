package com.identity.project.domain;

public class Book {
	private String isbn;
	private String b_title;
	private String b_thumbnail;
	private String b_content;
	private String b_authors;
	private String mbti;
	private String b_publisher;
	private int b_saleprice;
	private String b_datetime;
	private String b_translators;
	private String b_translator;
	
	
	public String getB_translator() {
		return b_translator;
	}
	public void setB_translator(String b_translator) {
		this.b_translator = b_translator;
	}
	public String getB_translators() {
		return b_translators;
	}
	public void setB_translators(String b_translators) {
		this.b_translators = b_translators;
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
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_authors() {
		return b_authors;
	}
	public void setB_authors(String b_authors) {
		this.b_authors = b_authors;
	}
	public String getMbti() {
		return mbti;
	}
	public void setMbti(String mbti) {
		this.mbti = mbti;
	}
	public String getB_publisher() {
		return b_publisher;
	}
	public void setB_publisher(String b_publisher) {
		this.b_publisher = b_publisher;
	}
	public int getB_saleprice() {
		return b_saleprice;
	}
	public void setB_saleprice(int b_saleprice) {
		this.b_saleprice = b_saleprice;
	}
	public String getB_datetime() {
		return b_datetime;
	}
	public void setB_datetime(String b_datetime) {
		this.b_datetime = b_datetime;
	}
	
	
}
