package com.hein.empti.role.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hein.empti.emp.EmpVO;
import com.hein.empti.role.RoleVO;
import com.hein.empti.role.service.RoleService;

@Controller
public class RoleController {

	@Autowired RoleService roleService;
	
	@RequestMapping("/getRoleList")
	public String getRoleList(Model model, RoleVO roleVO, HttpSession session) {
		//roleVO.setEmp_id(((EmpVO)session.getAttribute("emp_id")).getEmp_id());
		model.addAttribute("roleList", roleService.getRoleList(roleVO));
		return "role/roleList";
	}
	
}