package com.zsgl.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.domain.DiyTour;
import com.zsgl.domain.Tour;
import com.zsgl.util.Page;

@Controller
@RequestMapping({"/zz", "/ajax/zz"})
public class ZZController {
	
	static final Logger logger = Logger.getLogger(ZZController.class);
	
	static final String ZZ_PATH = "zz/";
	
	@RequestMapping
	public void zz(Model model) {
		zz(1, model);
	}
	
	@RequestMapping("{page}")
	public void zz(@PathVariable int page, Model model) {
		logger.info(ZZ_PATH + page);
		Page p = new Page((int) DiyTour.countDiyTours(), page, 17);
		List<DiyTour> tours = Tour.getSortEntities(p.getFirst(),
				p.getMaxResult(), DiyTour.class);
		p.calePages(3, 7);
		model.addAttribute("tours", tours);
		model.addAttribute("page", p);
		model.addAttribute("ZZ_PATH", ZZ_PATH);
	}
	
}
