package com.hein.empti.buyorderdetails;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BuyorderdetailsVO {
	String orderdetail_no;
	String order_no;
	String item_no;
	String order_qty;
}