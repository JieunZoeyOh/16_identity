package com.identity.project.domain;

import java.util.List;

public class Joinlist {
	private String m_id;
	private List<Subscribe> subscribe;
	private String[] month;
	
	public List<Subscribe> getSubscribe() {
		return subscribe;
	}
	public void setSubscribe(List<Subscribe> subscribe) {
		this.subscribe = subscribe;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String[] getMonth() {
		return month;
	}
	public void setMonth(String[] month) {
		this.month = month;
	}
}
