package com.hein.empti.buyorderdetails.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.buyorderdetails.BuyorderdetailsVO;
import com.hein.empti.buyorderdetails.mapper.BuyorderdetailsMapper;
import com.hein.empti.buyorderdetails.service.BuyorderdetailsService;

@Service
public class BuyorderdetailsServiceImpl implements BuyorderdetailsService{
	
	@Autowired BuyorderdetailsMapper mapper;

	@Override
	public void setBuyorderdetailInsert(List<BuyorderdetailsVO> list) {
		mapper.setBuyorderdetailInsert(list);
		System.out.println("구매주문 다중 Insert 완료.");
	}

}
