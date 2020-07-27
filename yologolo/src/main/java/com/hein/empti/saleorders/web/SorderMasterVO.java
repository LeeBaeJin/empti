package com.hein.empti.saleorders.web;

import java.util.List;

import com.hein.empti.saleorderdetails.SaleorderdetailsVO;
import com.hein.empti.saleorders.SaleordersVO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SorderMasterVO {
	SaleordersVO vo;
	List<SaleorderdetailsVO> list;
}
