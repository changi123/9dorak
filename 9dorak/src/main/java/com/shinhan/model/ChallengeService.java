package com.shinhan.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.dto.ChallengeVO;

@Service
public class ChallengeService {

	@Autowired
	ChallengeDAOMybatis dao;

	public List<ChallengeVO> selectAll() {
		return dao.selectAll();
	}

	public ChallengeVO selectByno(int challenge_no) {
		return dao.selectByno(challenge_no);
	}

	public int updateChall(ChallengeVO challenge) {
		return dao.updateChall(challenge);
	}	
}
