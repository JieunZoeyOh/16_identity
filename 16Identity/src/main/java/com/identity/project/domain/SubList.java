package com.identity.project.domain;

import java.util.List;

public class SubList {
	private String m_id;
	private List<Subscribe> sublist;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public List<Subscribe> getSublist() {
		return sublist;
	}
	public void setSublist(List<Subscribe> sublist) {
		this.sublist = sublist;
	}
}
