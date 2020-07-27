package com.hein.empti.saleorders;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SaleordersVO {
	String order_no;
	String order_date;
	String sale_sum;
	String del_status;
	String emp_id;
	String company_no;
	
	//부가 프로퍼티
	String company_name;
	String name;
}
