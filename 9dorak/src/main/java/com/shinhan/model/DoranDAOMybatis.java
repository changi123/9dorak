package com.shinhan.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.dto.DoranVO;


@Repository 
public class DoranDAOMybatis {

	@Autowired
	SqlSession sqlSession; 
	Logger logger = LoggerFactory.getLogger(DoranDAOMybatis.class);
	String NAMESPACE = "net.firstzone.doran.";

	public List<DoranVO> selectAll() {
		List<DoranVO> dlist = sqlSession.selectList(NAMESPACE + "selectAll");
		System.out.println(dlist);
		logger.info("selectAll :  {}", dlist.size());
		return dlist;
	}

	public int insertDoran(DoranVO doran) {
		System.out.println("inserting :"+doran);
		return sqlSession.insert(NAMESPACE + "insertDoran", doran);
		
	}

//	public BoardVO selectById(int bno) {
//		BoardVO board = sqlSession.selectOne(NAMESPACE + "selectById", bno);
//		logger.info("selectById :  {}", board.toString());
//		return board;
//	}
//
//	public int updateViewCount(int bno) {
//		int result = sqlSession.update(NAMESPACE + "viewcntIncrement", bno);
//		logger.info("updateViewCount :  {}�� ����", result);
//		return result;
//	}
//
//	public int insert(BoardVO board) {
//		int result = sqlSession.insert(NAMESPACE + "insert", board);
//		logger.info("insert :  {}�� �Է�", result);
//		return result;
//	}
//
//	public int update(BoardVO board) {
//		int result = sqlSession.update(NAMESPACE + "update", board);
//		logger.info("update :  {}�� updated", result);
//		return result;
//	}
//
//	public int delete(int bno) {
//		int result = sqlSession.delete(NAMESPACE + "delete", bno);
//		logger.info("delete :  {}�� ����", result);
//		return result;
//	}

}