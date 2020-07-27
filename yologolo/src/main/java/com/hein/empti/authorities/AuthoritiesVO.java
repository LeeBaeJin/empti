package com.hein.empti.authorities;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AuthoritiesVO {
	//Authorities
	String dept_id;
	String menu_no;
	
	//Menu
	String menu_name;
	String menu_addr;
}
