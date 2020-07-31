package com.hein.empti.saleledger;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SaleledgerVO {
	String ldgr_no;
	String ldgr_date;
	String total_amount;
	String condition;
	String order_no;
	String note;
}