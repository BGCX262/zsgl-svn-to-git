package com.zsgl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zsgl.domain.Hotel;
import com.zsgl.domain.Tour;
import com.zsgl.util.Page;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	Logger logger = Logger.getLogger(SearchController.class);
	
	/**
	 * 搜索旅游线路
	 * @param content
	 * @param model
	 
	@RequestMapping("/s/tour")
	public String tour(@RequestParam(required = false, defaultValue = "") String q, @RequestParam(required = false, defaultValue = "1") int page, Model model) {
		logger.info("search/tour?q=" + q + " &p=" + page);
		Page p = new Page((int)Tour.countSearch(q), page, 10);
		model.addAttribute("tours", Tour.search(null, null, null, q.trim(), p.getFirst(), p.getMaxResult()));
		model.addAttribute("q", q);
		model.addAttribute("page", p);
		return "search/tour";
	}
	
	
	@RequestMapping("/s/tour")
	public ModelAndView tour(String q, int page) {
		ModelAndView mav = new ModelAndView();
		logger.info("search/tour?q=" + q + "&p=" + page);
		Page p = new Page((int)Tour.countSearch(q), page, 10);
		mav.addObject("tours", Tour.search(null, null, null, q.trim(), p.getFirst(), p.getMaxResult()));
		mav.addObject("page", p);
		mav.addObject("q", q);
		mav.setViewName("s/tour");
		return mav;
	}
	*/
	/**
	 * 搜索酒店
	 * @param content
	 * @param model
	 
	@RequestMapping("/s/hotel")
	public void hotel(@RequestParam(required = false, defaultValue = "") String q, @RequestParam(required = false, defaultValue = "1") int page, Model model) {
		logger.info("search/hotel?q=" + q + "&p=" + page);
		Page p = new Page(Hotel.countSearch(null, null, q), page, 6);
		List<Hotel> list = Hotel.search(null, null, q, p.getFirst(), p.getMaxResult());
		model.addAttribute("page", p);
		model.addAttribute("hotels", list);
		model.addAttribute("q", q);
	}
	*/
	
	/**
	 * 搜索旅游线路
	 * @param address
	 * @param type
	 * @param day
	 * @param content
	 * @param model
	 * @return
	 */
	@RequestMapping("tour")
	public String search(
			@RequestParam(value = "tourAddress", required = false, defaultValue = "0") long address,
			@RequestParam(value = "tourType", required = false, defaultValue = "0") long type,
			@RequestParam(value = "tourDay", required = false, defaultValue = "0") long day,
			@RequestParam(value = "q", required = false, defaultValue = "") String q,
			@RequestParam(required = false, defaultValue = "1") int page, Model model) {
		/*
		TourAddress tourAddress = null;
		TourType tourType = null;
		TourDay tourDay = null;
		if(address != 0) {
			tourAddress = TourAddress.findTourAddress(address);
		}
		if(type != 0) {
			tourType = TourType.findTourType(type);
		}
		if(day != 0) {
			tourDay = TourDay.findTourDay(day);
		}
		List<Tour> list = Tour.search(tourAddress, tourType, tourDay, content.trim());
		
		model.addAttribute("tours", list);
		model.addAttribute("tType", tourType);
		*/
		
		logger.info("search/tour?q=" + q + " &p=" + page);
		Page p = new Page((int)Tour.countSearch(q), page, 10);
		model.addAttribute("tours", Tour.search(null, null, null, q.trim(), p.getFirst(), p.getMaxResult()));
		model.addAttribute("q", q);
		model.addAttribute("page", p);
		
		return "search_tour";
	}
	
	/**
	 * 搜索酒店
	 * @param address
	 * @param level
	 * @param content
	 * @param model
	 * @return
	 */
	@RequestMapping("hotel")
	public String search(
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "hotelAddress", required = false, defaultValue = "0") long address,
			@RequestParam(value = "hotelLevel", required = false, defaultValue = "0") long level,
			@RequestParam(value = "q", required = false, defaultValue = "") String q, Model model, HttpServletRequest request) {
		/*
		HotelAddress hotelAddress = null;
		HotelLevel hotelLevel = null;
		if(address != 0) {
			hotelAddress = HotelAddress.findHotelAddress(address);
		}
		if(level != 0) {
			hotelLevel = HotelLevel.findHotelLevel(level); 
		}
		*/
		Page p = new Page(Hotel.countSearch(null, null, q), page, 6);
		p.calePages(3, 6);
		
		List<Hotel> list = Hotel.search(null, null, q, p.getFirst(), p.getMaxResult());
		model.addAttribute("page", p);
		model.addAttribute("hotels", list);
		//model.addAttribute("hAddress", null);
		model.addAttribute("q", q);
		logger.info("q : " + q);
		/*
		StringBuilder params = new StringBuilder();
		int i = 0;
		
		for (Object o : request.getParameterMap().keySet()) {
			String paramName = (String)o;
			if (i++ > 0) params.append("&");
			if ("page".equals(o)) continue;
			params.append(paramName + "=" + request.getParameter(paramName));
		}
		model.addAttribute("params", params.toString());
		*/
		return "search_hotel";
	}
	
	
}
