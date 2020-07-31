package com.hein.empti.authorities;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hein.empti.authorities.service.AuthoritiesService;

@Controller
public class AuthoritiesController {

	@Autowired
	AuthoritiesService authoritiesService;
	
//	@RequestMapping("/getRoleList")
//	public 
}
