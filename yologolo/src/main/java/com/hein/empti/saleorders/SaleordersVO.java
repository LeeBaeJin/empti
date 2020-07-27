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
	String stock_no;
	String company_no;
}
//	판매주문
//	
//	주문번호 order_no -number
//	주문일자	order_date -date
//	판매합계	sale_sum number
//	배송상태	del_status string
//  ---가져오는 data (fk)---
//	사원번호	emp_no (fk) number
//	입출고 번호	stock_no (fk) number
//	거래처 코드	 company_no (fk) number
//
