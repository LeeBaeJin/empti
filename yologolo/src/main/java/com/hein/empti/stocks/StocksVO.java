package com.hein.empti.stocks;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StocksVO {
		String stock_no;
		String stock_date;
		String stock_qty;
		String stock_category;
		String strg_no;
		String item_no;
		String stock_status;
		String sorder_no;
		String border_no;
		
		//JOIN
		String item_name;
		String company_name;
		String strg_category;

		//검색
		/*
		 * String selectCategory; String startDate; String endDate;
		 */
}
