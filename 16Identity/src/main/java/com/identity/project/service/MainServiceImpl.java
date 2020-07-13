package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO dao;
	
	@Override
	public List<String> getMbtiList() {
		return dao.mbtiList();
	}

}
