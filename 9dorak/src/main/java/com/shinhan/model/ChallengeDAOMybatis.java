package com.shinhan.model;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.dto.AnnoVO;
import com.shinhan.dto.ChallengeVO;
import com.shinhan.dto.ChalllikeVO;

@Repository
public class ChallengeDAOMybatis {

	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(ChallengeDAOMybatis.class);
	String NAMESPACE = "net.firstzone.challenge.";

	public List<ChallengeVO> selectAll() {
		List<ChallengeVO> chlist = sqlSession.selectList(NAMESPACE + "selectAll");
		logger.info("selectAll :  {}", chlist.size());
		return chlist;
	}

	public ChallengeVO selectByno(int challenge_no) {
		ChallengeVO chall = sqlSession.selectOne(NAMESPACE + "selectByno", challenge_no);
		return chall;
	}

	public int updateChall(ChallengeVO challenge) {
		int result = sqlSession.update(NAMESPACE + "updateChall", challenge);
		return result;
	}

	public int insertChal(ChallengeVO challenge) {
		int result = sqlSession.insert(NAMESPACE + "insertChal", challenge);
		return result;
	}

	public int getLike(int challenge_no) {
		int result = sqlSession.selectOne(NAMESPACE + "getLike", challenge_no);
		return result;
	}

	public int deleteChal(int challenge_no) {

		int result = sqlSession.delete(NAMESPACE + "deleteChal", challenge_no);

		return result;
	}

	public int selectBoardListCnt(ChallengeVO ChallengeVO) {
		return sqlSession.selectOne(NAMESPACE + "selectBoardListCnt", ChallengeVO);
	}


	public List<Map<String, Object>> list(ChallengeVO ChallengeVO) {
		return sqlSession.selectList(NAMESPACE + "list", ChallengeVO);
	}

	public int updatelikeChal(int challenge_no) {
		int result = sqlSession.update(NAMESPACE + "updatelikeChal", challenge_no);
		return result;
	}

	public int getLikecheck(ChalllikeVO challlike) {
		int result = sqlSession.selectOne(NAMESPACE + "getLikecheck", challlike);
		return result;
	}

	public int insertlikeChall(ChalllikeVO challlike) {
		int result = sqlSession.update(NAMESPACE + "insertlikeChall", challlike);
		return result;
	}

	public int delelelikeChall(ChalllikeVO challlike) {
		int result = sqlSession.update(NAMESPACE + "delelelikeChall", challlike);
		return result;
	}

	public List<ChallengeVO> selectByMakeAll() {
		List<ChallengeVO> clist = sqlSession.selectList(NAMESPACE + "selectByMakeAll");
		return clist;
	}

	public List<ChalllikeVO> selectByMakeLike() {
		List<ChalllikeVO> clikelist = sqlSession.selectList(NAMESPACE + "selectByMakeLike");
		return clikelist;
	}

	public List<ChallengeVO> selectByMakeAllTop3() {
		List<ChallengeVO> clisttop3 = sqlSession.selectList(NAMESPACE + "selectByMakeAllTop3");
		return clisttop3;
	}

	public List<ChallengeVO> selectByMakeAlllike() {
		List<ChallengeVO> clistlike = sqlSession.selectList(NAMESPACE + "selectByMakeAlllike");
		return clistlike;
	}

	public List<ChalllikeVO> selectByMakemylike(String mem_id) {
		List<ChalllikeVO> clistmylike = sqlSession.selectList(NAMESPACE + "selectByMakemylike", mem_id);
		return clistmylike;
	}

	public List<ChallengeVO> selectOrderbyNew() {
		List<ChallengeVO> mlist = sqlSession.selectList(NAMESPACE + "selectOrderbyNew");
		return mlist;
	}

	public List<ChallengeVO> selectOrderbyLike() {
		List<ChallengeVO> mlist = sqlSession.selectList(NAMESPACE + "selectOrderbyLike");
		return mlist;
	}

	public List<ChallengeVO> selectByMakeAllOrderlike() {
		List<ChallengeVO> clistlike = sqlSession.selectList(NAMESPACE + "selectByMakeAllOrderlike");
		return clistlike;
	}

}
