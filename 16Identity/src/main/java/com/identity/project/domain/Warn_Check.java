package com.identity.project.domain;

public class Warn_Check {

	private int wc_no;
	private String m_id;
	private int cmt_no;
	private String wc_date;
	private String wc_reason;
	private String wc_state;

	public String getWc_reason() {
		return wc_reason;
	}

	public void setWc_reason(String wc_reason) {
		this.wc_reason = wc_reason;
	}

	public int getWc_no() {
		return wc_no;
	}

	public void setWc_no(int wc_no) {
		this.wc_no = wc_no;
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

	public String getWc_date() {
		return wc_date;
	}

	public void setWc_date(String wc_date) {
		this.wc_date = wc_date;
	}

	public String getWc_state() {
		return wc_state;
	}

	public void setWc_state(String wc_state) {
		this.wc_state = wc_state;
	}
}
