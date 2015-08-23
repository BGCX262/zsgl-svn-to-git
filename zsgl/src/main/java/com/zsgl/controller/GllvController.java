package com.zsgl.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.domain.Tour;
import com.zsgl.domain.TourAddress;
import com.zsgl.domain.TourDay;
import com.zsgl.domain.TourType;
import com.zsgl.util.Page;

/**
 * 旅游路线模块
 * @author 林超
 */
@Controller
@RequestMapping({"/ly", "/ajax/ly"})
public class GllvController {
	
	static final Logger logger = Logger.getLogger(GllvController.class);
	
	static final String LY_PATH = "ly/";
	
	static final String LY_ADDRESS_PATH = "ly/address/";
	
	static final String LY_TYPE_PATH = "ly/type/";
	
	static final String LY_DAY_PATH = "ly/day/";
	
	/**
	 * 所有分类分页显示，默认显示第一页
	 * @param model
	 * @return
	*/
	@RequestMapping
	public void ly(Model model) {
		ly(1, model);
	}
	
	/**
	 * 所有分类分页显示
	 * @param page
	 * @param model
	 */
	@RequestMapping({"/{page}"})
	public void ly(@PathVariable int page, Model model) {
		logger.info(LY_PATH + page);
		Page p = new Page((int)Tour.countTours(), page, 15);
		model.addAttribute("tours", Tour.getSortTour(p.getFirst(), p.getMaxResult()));
		model.addAttribute("page", p);
		model.addAttribute("LY_PATH", LY_PATH);
	}
	
	/**
	 * 按地域分页显示
	 * @param address
	 * @param page
	 * @param model
	 */
	@RequestMapping("/address/{address}/{page}")
	public void address(@PathVariable long address, @PathVariable int page, Model model) {
		String uri = LY_DAY_PATH + address + "/";	 
		logger.info(uri + page);
		TourAddress ta = TourAddress.findTourAddress(address);
		Page p = new Page((int)Tour.countByAddress(ta), page, 15);
		model.addAttribute("tours", Tour.search(ta, null, null, "", p.getFirst(), p.getMaxResult()));
		model.addAttribute("page", p);
		model.addAttribute("LY_PATH", uri);
		model.addAttribute("typeName", ta.getName());
	}
	
	/**
	 * 按类型分页显示
	 * @param type
	 * @param page
	 * @param model
	 */
	@RequestMapping("/type/{type}/{page}")
	public void type(@PathVariable long type, @PathVariable int page, Model model) {
		String uri = LY_TYPE_PATH + type + "/";
		logger.info(uri + page);
		TourType tt = TourType.findTourType(type);
		Page p = new Page((int)Tour.countByType(tt), page, 15);
		model.addAttribute("tours", Tour.search(null, tt, null, "", p.getFirst(), p.getMaxResult()));
		model.addAttribute("page", p);
		model.addAttribute("LY_PATH", uri);
		model.addAttribute("typeName", tt.getName());
		model.addAttribute("title", tt.getName());
	}
	
	/**
	 * 按旅游天数分页显示
	 * @param day
	 * @param page
	 * @param model
	 */
	@RequestMapping("/day/{day}/{page}")
	public void level(@PathVariable long day, @PathVariable int page, Model model) {
		String uri = LY_DAY_PATH + day + "/";
		logger.info(uri + page);
		TourDay td = TourDay.findTourDay(day);
		Page p = new Page((int)Tour.countByDay(td), page, 15);
		model.addAttribute("tours", Tour.search(null, null, td, "", p.getFirst(), p.getMaxResult()));
		model.addAttribute("page", p);
		model.addAttribute("LY_PATH", uri);
		model.addAttribute("typeName", td.getName());
		model.addAttribute("title", td.getName());
	}
	
	/**
	 * 显示路线详情
	 * @param id
	 * @param model
	 */
	@RequestMapping("/view/{id}")
	public void view(@PathVariable long id, Model model) {
		logger.info("ly/view/" + id);
		Tour tour = Tour.findTour(id);
		model.addAttribute("prev", tour.prev());
		model.addAttribute("next", tour.next());
		model.addAttribute("tour", tour);
		model.addAttribute("title", tour.getName());
		model.addAttribute("typeName", tour.getType().getName());
		model.addAttribute("keywords", tour.getKeywords());
		model.addAttribute("description", tour.getDescription());
	}
	
}
