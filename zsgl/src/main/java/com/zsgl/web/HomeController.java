package com.zsgl.web;

import java.io.File;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.zsgl.domain.Hotel;
import com.zsgl.domain.Strategy;
import com.zsgl.domain.Tour;
import com.zsgl.util.Common;

/**
 * 首页管理
 * 待拓展
 * @author 林超
 */
@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	RestTemplate restTemplate;
	
	@RequestMapping(method = RequestMethod.GET)
	public void home(HttpServletRequest request, Model model) throws Exception{ 
		ServletContext application = request.getSession().getServletContext();
		File file = new File(application.getRealPath("index.html"));
		if (file.exists()) {
			 //栏目相关页面数
			 model.addAttribute("lyPages", Tour.countTours());
			 model.addAttribute("hotelPages", Hotel.countHotels());
			 model.addAttribute("glPages", Strategy.countStrategys());
			 //实际生成的静态页
			 File lyPages2 = new File(application.getRealPath("ly/view")); 
			 File hotelPages2 = new File(application.getRealPath("hotel/view"));
			 File glPages2 = new File(application.getRealPath("gl/view"));
			 
			 if (lyPages2.exists()) {
				 model.addAttribute("lyPages2", lyPages2.list().length);
			 }
			 if (hotelPages2.exists()) {
				 model.addAttribute("hotelPages2", hotelPages2.list().length);
			 }
			 if (glPages2.exists()) {
				 model.addAttribute("glPages2", glPages2.list().length);
			 }
			 model.addAttribute("lastDate", Common.accurateDateFormat.format(new Date(file.lastModified())));
			 model.addAttribute("exists", true);
			 lyPages2 = null;
			 hotelPages2 = null;
			 glPages2 = null;
		}
		file = null;
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request) {
		restTemplate.getForObject("http://" + request.getServerName() + "/static/index", String.class);
		return "redirect:/home";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		ServletContext application = request.getSession().getServletContext();
		File file = new File(application.getRealPath("index.html"));
		File ajaxFile = new File(application.getRealPath("ajax/index.html"));
		if (file.exists()) {
			file.delete();
		}
		if (ajaxFile.exists()) {
			ajaxFile.delete();
		}
		file = null;
		ajaxFile = null;
		return "success";
	}
	
	
}
