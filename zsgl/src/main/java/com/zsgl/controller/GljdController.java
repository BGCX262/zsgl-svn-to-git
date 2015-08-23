package com.zsgl.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.domain.Hotel;
import com.zsgl.domain.HotelAddress;
import com.zsgl.domain.HotelLevel;
import com.zsgl.util.Page;

/**
 * 酒店模块
 * @author 林超
 */
@Controller
@RequestMapping({"/hotel", "/ajax/hotel"})
public class GljdController {

	static final Logger logger = Logger.getLogger(GljdController.class);
	
	static final String HOTEL_PATH = "hotel/";
	
	static final String HOTEL_CITY_PATH = "hotel/city/";
	
	static final String HOTEL_LEVEL_PATH = "hotel/level/";
	
	/**
	 * 不区分地域星级显示，默认为第一页
	 * @param model
	 * @return
	*/
	@RequestMapping
	public void hotel(Model model) {
		hotel(1, model);
	}
	
	/**
	 * 不区分地域星级显示，根据页码进行显示
	 * @param page
	 * @param model
	 */
	@RequestMapping("/{page}")
	public void hotel(@PathVariable int page, Model model) {
		logger.info(HOTEL_PATH + page);
		Page p = new Page(Hotel.countSearch(null, null, ""), page, 6);
		List<Hotel> list = Hotel.search(null, null, "", p.getFirst(), p.getMaxResult());
		model.addAttribute("page", p);
		model.addAttribute("hotels", list);
		model.addAttribute("HOTEL_PATH", HOTEL_PATH);
	}
	
	/**
	 * 根据城市分类进行分页显示
	 * @param city
	 * @param page
	 */
	@RequestMapping("/city/{city}/{page}")
	public void city(@PathVariable long city, @PathVariable int page, Model model) {
		String uri = HOTEL_CITY_PATH + city + "/";
		logger.info(uri + page);
		HotelAddress ha = HotelAddress.findHotelAddress(city);
		Page p = new Page(Hotel.countSearch(ha, null, ""), page, 6);
		List<Hotel> list = Hotel.search(ha, null, "", p.getFirst(), p.getMaxResult());
		model.addAttribute("page", p);
		model.addAttribute("hotels", list);
		model.addAttribute("HOTEL_PATH", uri);
		model.addAttribute("typeName", ha.getName());
	}
	
	/**
	 * 根据酒店星级分类进行分页显示
	 * @param level
	 * @param page
	 */
	@RequestMapping("/level/{level}/{page}")
	public void level(@PathVariable long level, @PathVariable int page, Model model) {
		String uri = HOTEL_LEVEL_PATH + level + "/";
		logger.info(uri + page);
		HotelLevel hl = HotelLevel.findHotelLevel(level);
		Page p = new Page(Hotel.countSearch(null, hl, ""), page, 6);
		List<Hotel> list = Hotel.search(null, hl, "", p.getFirst(), p.getMaxResult());
		model.addAttribute("page", p);
		model.addAttribute("hotels", list);
		model.addAttribute("HOTEL_PATH", uri);
		model.addAttribute("typeName", hl.getName());
	}
	
	/**
	 * 根据酒店ID查看酒店
	 * @param id
	 * @param model
	 */
	@RequestMapping("/view/{id}")
	public void view(@PathVariable long id, Model model) {
		logger.info("hotel/view/" + id);
		Hotel hotel = Hotel.findHotel(id);
		model.addAttribute("hotel", hotel);
		model.addAttribute("prev", hotel.prev());
		model.addAttribute("next", hotel.next());
		model.addAttribute("title", hotel.getName());
		model.addAttribute("typeName", hotel.getAddress().getName());
		model.addAttribute("keywords", hotel.getKeywords());
		model.addAttribute("description", hotel.getDescription());
	}

}
