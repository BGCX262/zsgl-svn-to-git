package com.zsgl.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.domain.Hotel;
import com.zsgl.domain.HotelAddress;
import com.zsgl.domain.HotelLevel;
import com.zsgl.domain.MeetingPlace;
import com.zsgl.domain.OverseasTour;
import com.zsgl.domain.Poster;
import com.zsgl.domain.Scenic;
import com.zsgl.domain.Tour;
import com.zsgl.domain.TourDay;
import com.zsgl.domain.TourType;

@Controller
public class IndexController {
	
	static final Logger logger = Logger.getLogger(IndexController.class);
	
	/**
	 * 首页，使用静态页
	 * @param model
	 * @return
	 */
	@RequestMapping({"/index", "/ajax/index"})
	public void home(Model model, HttpServletRequest request) throws Exception {
		logger.info("/");
		/* 分类 */
		TourType tglsk = TourType.findTourType(12L); 						 // 桂林散客游
		TourType tdlyc = TourType.findTourType(13L); 						 // 独立用车游
		TourType tgn = TourType.findTourType(14L);							 // 国内游
		HotelAddress gl = HotelAddress.findHotelAddress(1L); 				 // 桂林酒店
		HotelAddress ys = HotelAddress.findHotelAddress(4L); 				 // 阳朔酒店
		List<TourDay> tourDays = TourDay.findAllTourDays(); 				 	// 旅游天数
		List<HotelLevel> hotelLevels = HotelLevel.findAllHotelLevels();		 // 酒店等级
		
		/* 各种内容 */
		List<Poster> posters = Poster.findAllPosters();						 //广告
		List<Tour> glsks = Tour.getSortTourByType(tglsk, 0, 5); 			 	 // 桂林散客游
		List<Tour> dlycs = Tour.getSortTourByType(tdlyc, 0, 5); 			 	 // 独立用车游
		List<Tour> gnlvs = Tour.getSortTourByType(tgn, 0, 8);				 // 国内线路
		List<OverseasTour> cjys = OverseasTour.getSortOverseasTour(0, 8);	 // 出境游
		List<Hotel> glHotels = Hotel.getSortHotelsByAddress(gl, 0, 8); 		 // 桂林酒店
		List<Hotel> ysHotels = Hotel.getSortHotelsByAddress(ys, 0, 8); 		 // 阳朔酒店
		List<Scenic> scenics = Scenic.getSortScenics(0, 10);				 //景点介绍
		List<MeetingPlace> mettingPlaces = MeetingPlace.getSortEntries(0, 4);//会议场所
		
		List<List<Tour>> tourDayList = new ArrayList<List<Tour>>();
		for (TourDay day : tourDays) {
			tourDayList.add(Tour.getSortEntitiesByDay(day, 0, 8, Tour.class));
		}
		List<List<Hotel>> hotelList = new ArrayList<List<Hotel>>();
		for (HotelLevel level : hotelLevels) {
			hotelList.add(Hotel.getSortHotelsByLevel(level, 0, 8));
		}
		
		model.addAttribute("tglsk", tglsk);
		model.addAttribute("tdlyc", tdlyc);
		model.addAttribute("gl", gl);
		model.addAttribute("ys", ys);
		model.addAttribute("tgn", tgn);
		
		model.addAttribute("posters", posters);
		model.addAttribute("glsks", glsks);
		model.addAttribute("dlycs", dlycs);
		model.addAttribute("gnlvs", gnlvs);
		model.addAttribute("cjys", cjys);
		model.addAttribute("tourDays", tourDays);
		model.addAttribute("hotelLevels", hotelLevels);
		model.addAttribute("glHotels", glHotels);
		model.addAttribute("ysHotels", ysHotels);
		model.addAttribute("scenics", scenics);
		model.addAttribute("mettingPlaces", mettingPlaces);
		model.addAttribute("tourDayList", tourDayList);
		model.addAttribute("hotelList", hotelList);
	}

	
}
