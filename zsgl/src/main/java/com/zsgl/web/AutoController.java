package com.zsgl.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/auto")
public class AutoController {
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	ThiefController thiefController;
	
	@RequestMapping(method = RequestMethod.GET)
	public void index() {
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public void update(String https, Model model, HttpServletRequest request) throws Exception {
		int count = 0;
		if (https != null) {
			String[] http = https.trim().split("\n");
			count = http.length;
			for (String url : http) {
				//restTemplate.getForObject("http://" + request.getServerName() + "/xt?u={u}", String.class, url);
				thiefController.index(url);
			}
		}
		model.addAttribute("count", count);
	}
	
//	public static void main(String[] args) {
//		RestTemplate restTemplate = new RestTemplate();
//		String url;
//		url = "http://www.baidu.com";
//		url = "http://www.mafengwo.cn/i/556451.html";
//		url = "http://www.mafengwo.cn/i/1056414.html";
//		String result = restTemplate.getForObject(url, String.class);
//		System.out.println(result);
//	}
	
	
	
}
