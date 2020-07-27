package com.hein.empti.company;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CompanyVO {
	String company_no;
	String company_name;
	String phone;
	String address;
	String ceo_name;
	String dealer_name;
	String dealer_phone;
	String bank_name;
	String account_no;
	String note;
}