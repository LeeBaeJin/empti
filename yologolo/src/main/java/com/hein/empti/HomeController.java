package com.hein.empti;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping("/")
	public String home(Model model) {
		return "common/login";
	}
	
	@RequestMapping("/main")
	public String main(Model model) {
		return "admin/index";
	}
}
