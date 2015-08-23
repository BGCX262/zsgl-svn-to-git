package com.zsgl.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.domain.Cases;
import com.zsgl.domain.Hotel;
import com.zsgl.domain.MeetingPlace;
import com.zsgl.domain.Scenic;
import com.zsgl.domain.Strategy;
import com.zsgl.domain.Tour;
import com.zsgl.util.Generator;

/**
 * 生成静态页
 * @author 林超
 */
@Controller
@RequestMapping("/static")
public class StaticController {
	
	@Autowired
	Generator generator;
	
	@RequestMapping("/toHtml")
	public void toHtml(String uri, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (uri != null && !uri.equals("")) {
			if (!uri.startsWith("/")) {
				uri = "/" + uri;
			}
			if (!uri.endsWith(".html")) {
				uri += ".html";
			}
			ServletContext context = request.getSession().getServletContext();
			String dir = (String) context.getAttribute("WEBROOT");
			toHtml(request, response, dir, uri);
		}
	}
	
	@RequestMapping("/ly")
	public void ly(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		List<Tour> list = Tour.findAllTours();
		for (Tour o : list) {
			toHtml("ly/view/" + o.getId() + ".html", request, response);
		}
		list.clear();
	}
	
	@RequestMapping("/hotel")
	public void hotel(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		List<Hotel> list = Hotel.findAllHotels();
		for (Hotel o : list) {
			toHtml("hotel/view/" + o.getId() + ".html", request, response);
		}
		list.clear();
	}
	
	@RequestMapping("/gl")
	public void gl(HttpServletRequest request,
			HttpServletResponse response) throws Exception{ 
		List<Strategy> list = Strategy.findAllStrategys();
		for (Strategy o : list) {
			toHtml("gl/view/" + o.getId() + ".html", request, response);
		}
		list.clear();
	}
	
	@RequestMapping("/jd")
	public void jd(HttpServletRequest request,
			HttpServletResponse response) throws Exception{ 
		List<Scenic> list = Scenic.findAllScenics();
		for (Scenic o : list) {
			toHtml("jd/view/" + o.getId() + ".html", request, response);
		}
		list.clear();
	}
	
	@RequestMapping("/case")
	public void cases(HttpServletRequest request,
			HttpServletResponse response) throws Exception{ 
		List<Cases> list = Cases.findAllCaseses();
		for (Cases o : list) {
			toHtml("case/view/" + o.getId() + ".html", request, response);
		}
		list.clear();
	}
	
	@RequestMapping("/place")
	public void place(HttpServletRequest request,
			HttpServletResponse response) throws Exception{ 
		List<MeetingPlace> list = MeetingPlace.findAllMeetingPlaces();
		for (MeetingPlace o : list) {
			toHtml("place/view/" + o.getId() + ".html", request, response);
		}
		list.clear();
	}
	
	@RequestMapping("/about")
	public void about(HttpServletRequest request,
			HttpServletResponse response) throws Exception{ 
		toHtml("about.html", request, response);
	}
	
	@RequestMapping("/gszh")
	public void gszh(HttpServletRequest request,
			HttpServletResponse response) throws Exception{ 
		toHtml("gszh.html", request, response);
	}
	
	@RequestMapping("/hy")
	public void hy(HttpServletRequest request,
			HttpServletResponse response) throws Exception{ 
		toHtml("hy.html", request, response);
	}
	
	@RequestMapping("/index")
	public void index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{ 
		toHtml("index.html", request, response);
	}
	
	@RequestMapping("/all")
	public void all(HttpServletRequest request,
			HttpServletResponse response) throws Exception{ 
		this.about(request, response);
		this.cases(request, response);
		this.gl(request, response);
		this.gszh(request, response);
		this.hotel(request, response);
		this.hy(request, response);
		this.jd(request, response);
		this.ly(request, response);
		this.place(request, response);
	}
	
	/**
	 * 生成完整页跟ajax页面
	 * @param request
	 * @param response
	 * @param dir
	 * @param uri
	 * @throws Exception
	 */
	public void toHtml(HttpServletRequest request,
			HttpServletResponse response, String dir, String uri) throws Exception {
		
		String fileName = dir + uri;
		String ajaxFileName = dir + "/ajax" + uri;
		//生成完整页面跟ajax页面，自动创建文件夹，删除旧文件
		File file = new File(fileName);
		File ajaxFile = new File(ajaxFileName);
		file.mkdirs();
		file.delete();
		ajaxFile.mkdirs();
		ajaxFile.delete();
		generator.GenerationPage(request, response, uri, file);
		generator.GenerationPage(request, response, "/ajax" + uri, ajaxFile);
	}
	
}
