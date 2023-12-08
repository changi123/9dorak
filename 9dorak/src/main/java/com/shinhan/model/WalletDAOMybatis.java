package com.shinhan.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.shinhan.dto.BasketVO;
import com.shinhan.dto.PayVO;

@Repository
public class WalletDAOMybatis {

	@Autowired
	SqlSession sqlSession; 
	Logger logger = LoggerFactory.getLogger(WalletDAOMybatis.class);
	String NAMESPACE = "net.firstzone.wallet.";
	
	// 장바구니 select all
	public List<BasketVO> selectAllBasket() {
		List<BasketVO> blist = sqlSession.selectList(NAMESPACE + "selectAllBasket");
		System.out.println(blist);
		logger.info("selectAllBasket :  {}", blist.size());
		return blist;
	}
	
	// 결제하기 select all
	public List<PayVO> selectAllPay() {
		List<PayVO> plist = sqlSession.selectList(NAMESPACE + "selectAllPay");
		System.out.println(plist);
		logger.info("selectAllPay : {}", plist.size());
		return plist;
	}
	
	
}