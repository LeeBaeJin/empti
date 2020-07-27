package com.hein.empti.saleorderdetails;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SaleorderdetailsVO {
	String orderdetail_no;
	String order_no;
	String order_qty;
	String item_no;
}