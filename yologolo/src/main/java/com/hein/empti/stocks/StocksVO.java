package com.hein.empti.stocks;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StocksVO {
	
		String	stock_no;
		String	stock_qty;
		String 	stock_date;
		String	note;
		String	stock_price;
		String	stock_category;
		String	detail_no;
		String	item_no;
		String	strg_no;

}
