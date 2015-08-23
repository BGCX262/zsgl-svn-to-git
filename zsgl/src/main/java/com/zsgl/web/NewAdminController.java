package com.zsgl.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.listener.ApplicationListener;

@Controller
@RequestMapping("/admin")
public class NewAdminController {
	
	@RequestMapping({"", "/index"})
	public String index() {
		return "admin";
	}
	
	@RequestMapping("/header")
	public void header() {}
	
	@RequestMapping("/footer")
	public void footer() {}
	
	@RequestMapping("/center")
	public void center() {}
	
	@RequestMapping("/left")
	public void left() {}
	
	@RequestMapping("/right")
	public void right() {}
	
	@RequestMapping("/gc")
	public String gc() {
		System.gc();
		return "admin/right";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request) {
		ApplicationListener.loadCommonnData(request.getSession().getServletContext());
		return "admin/right";
	}
	
}
