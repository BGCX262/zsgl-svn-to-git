package com.zsgl.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

@Controller
@RequestMapping("/password")
public class PasswordController {
	
	@Autowired
	JdbcTemplate template;
	
	@RequestMapping(method = RequestMethod.GET)
	public void password() {}
	
	@RequestMapping("/success")
	public void success() {}
	
	@RequestMapping("/error")
	public void error() {}
	
	@RequestMapping(method = RequestMethod.POST)
	public String password(String password1, String password2) {
		boolean hasError = false;
		if(password1 == null || password2 == null || password1.trim().length() == 0 || password2.trim().length() == 0 || password1.equals(password2)) {
			hasError = true;
		} else {
			int rows = template.queryForInt("select count(*) from users where username = 'sa' and password = ?", password1);
			if (rows == 0) {
				hasError =  true;
			} else {
				template.update("update users set password = ? where username = 'sa'", password2);
			}
		}
		if (hasError) {
			return "password/error";
		}
		return "password/success";
	}
	
	
	
}
