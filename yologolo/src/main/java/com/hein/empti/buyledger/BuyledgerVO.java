package com.hein.empti.buyledger;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BuyledgerVO {
	String ldgr_no;
	String ldgr_date;
	String total_amount;
	String condition;
	String order_no;
	String note;
}
