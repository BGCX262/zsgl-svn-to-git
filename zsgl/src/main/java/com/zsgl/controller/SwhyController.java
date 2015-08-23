package com.zsgl.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.domain.Cases;
import com.zsgl.domain.MeetingHotel;
import com.zsgl.domain.MeetingPlace;
import com.zsgl.domain.MeetingTour;
import com.zsgl.domain.MettingService;

/**
 * 商务会议模块
 * @author 林超
 */
@Controller
public class SwhyController {
	
	static final Logger logger = Logger.getLogger(SwhyController.class);
	
	/**
	 * 显示商务会议页面，此页面没有分页
	 * @param model
	 */
	@RequestMapping({"/hy", "/ajax/hy"})
	public void hy(Model model) {
		logger.info("/hy");
		List<MettingService> services = MettingService.findMettingServiceEntries(0, 1);	//会议服务
		if(services.size() > 0) {
			model.addAttribute("service", services.get(0));
		}
		model.addAttribute("cases", Cases.findAllCaseses());
		model.addAttribute("meetingPlaces", MeetingPlace.findAllMeetingPlaces());		//会议场所
		model.addAttribute("meetingTours", MeetingTour.findAllMeetingTours());			//会议旅游
		model.addAttribute("meetingHotels", MeetingHotel.findAllMeetingHotels());		//会议酒店
	}
	
	/**
	 * 显示成功案例详细
	 * @param page
	 * @param mod
	 */
	@RequestMapping({"/case/view/{id}", "/ajax/case/view/{id}"})
	public void cases(@PathVariable long id, Model model) {
		Cases cases = Cases.findCases(id);
		logger.info("/hy/case/view/" + id);
		model.addAttribute("cases", cases);
		model.addAttribute("title", cases.getName());
		model.addAttribute("prev", cases.prev());
		model.addAttribute("next", cases.next());
	}
	
	/**
	 * 显示会议场所详细
	 * @param page
	 * @param model
	 */
	@RequestMapping({"/place/view/{id}", "/ajax/place/view/{id}"})
	public void place(@PathVariable long id, Model model) {
		logger.info("/hy/place/view/" + id);
		MeetingPlace mp = MeetingPlace.findMeetingPlace(id);
		model.addAttribute("meetingPlace", mp);
		model.addAttribute("title", mp.getName());
		model.addAttribute("prev", mp.prev());
		model.addAttribute("next", mp.next());
		
	}
	
}
