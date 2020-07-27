package com.hein.empti.buyorders;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BuyordersVO {
	//Buyorders
	String order_no;
	String order_date;
	String buy_sum;
	String company_no;
	String emp_id;
}
