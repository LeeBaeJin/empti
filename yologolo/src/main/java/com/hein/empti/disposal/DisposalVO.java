package com.hein.empti.disposal;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DisposalVO {
	String disposal_no;
	String disposal_qty;
	String price;
	String disposal_date;
	String category;
	String strg_no;
	String item_no;
	
	//Join
	String item_name;
	String strg_category;
}
