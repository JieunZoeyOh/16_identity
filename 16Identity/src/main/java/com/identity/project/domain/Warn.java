package com.identity.project.domain;

import java.util.List;

public class Warn {
	private int w_no;
	private String m_id;
	private int cmt_no;
	private String w_reason;
	private String w_date;
	private int w_count;
	private List<Warn_Check> warn_check;
	private Comments comments;
	
	public int getW_no() {
		return w_no;
	}
	public void setW_no(int w_no) {
		this.w_no = w_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getCmt_no() {
		return cmt_no;
	}
	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
	}
	public String getW_reason() {
		return w_reason;
	}
	public void setW_reason(String w_reason) {
		this.w_reason = w_reason;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public int getW_count() {
		return w_count;
	}
	public void setW_count(int w_count) {
		this.w_count = w_count;
	}
	public List<Warn_Check> getWarn_check() {
		return warn_check;
	}
	public void setWarn_check(List<Warn_Check> warn_check) {
		this.warn_check = warn_check;
	}
	public Comments getComments() {
		return comments;
	}
	public void setComments(Comments comments) {
		this.comments = comments;
	}
}
