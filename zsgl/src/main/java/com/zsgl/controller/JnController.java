package com.zsgl.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zsgl.domain.OverseasTour;
import com.zsgl.domain.OverseasTourAddress;
import com.zsgl.domain.Tour;
import com.zsgl.domain.TourType;
import com.zsgl.util.Page;

/**
 * 境内外旅游模块
 * @author 林超
 */
@Controller
@RequestMapping({"/jn", "/ajax/jn"})
public class JnController {
	
	static final Logger logger = Logger.getLogger(JnController.class);
	
	static final String JN_PATH = "jn/";
	
	static final String JN_ADDRESS_PATH = "jn/address/";
	
	/**
	 * 不区分地域，默认显示第一页
	 * @param model
	 */
	@RequestMapping
	public void jn(Model model) {
		jn(1, model);
	}
	
	/**
	 * 不去分地域，根据页码显示
	 * @param page
	 * @param model
	 */
	@RequestMapping("{page}")
	public void jn(@PathVariable int page, Model model) {
		logger.info(JN_PATH + page);
		TourType tgn = TourType.findTourType(14L);
		long count = OverseasTour.countOverseasTours() + Tour.countByType(tgn);
		Page p = new Page((int) count, page, 10);
		/* 境外路线 */
		List<OverseasTour> tours = OverseasTour.getSortOverseasTour(
				p.getFirst(), p.getMaxResult());
		/* 国内线路 */
		List<Tour> gnlvs = Tour.getSortTourByType(tgn, (page - 1) * 0, 8);
		p.calePages(3, 7);
		gnlvs.addAll(tours);
		model.addAttribute("tours", gnlvs);
		
		model.addAttribute("page", p);
		model.addAttribute("JN_PATH", JN_PATH);
	}
	
	/**
	 * 根据地域、页码进行分页显示
	 * @param address
	 * @param page
	 * @param model
	 */
	@RequestMapping("/address/{address}/{page}")
	public void address(@PathVariable long address, @PathVariable int page, Model model) {
		String uri = JN_ADDRESS_PATH + address + "/";
		logger.info(uri);
		OverseasTourAddress ota = OverseasTourAddress.findOverseasTourAddress(address);
		Page p = null;
		if (ota.getId() == 5) {
			TourType tgn = TourType.findTourType(14L);
			model.addAttribute("tours", Tour.getSortTourByType(tgn, (page - 1) * 0, (int)Tour.countByType(tgn)));
			p = new Page((int)Tour.countByType(tgn), page, (int)Tour.countByType(tgn));
		}
		else {
			p = new Page((int)OverseasTour.findCount(ota, ""), page, 7);
			model.addAttribute("tours", OverseasTour.find(ota, "", p.getFirst(), p.getMaxResult()));
		}
		
		model.addAttribute("page", p);
		model.addAttribute("JN_PATH", uri);
	}
	
	///////////////////////////////////////////////////////
	/**
	 * 境内外旅游
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	//@RequestMapping("jlwlv")
	public String jlwlv(Model model,
			@RequestParam(required = false, defaultValue = "1") int page) {
		TourType tgn = TourType.findTourType(14L);
		long count = OverseasTour.countOverseasTours() + Tour.countByType(tgn);
		Page p = new Page((int) count, page, 17);
		if (p.getPage() < 1 || p.getPage() > p.getLast()) {
			return "redirect:jlwlv?page=1";
		}
		/* 境外路线 */
		List<OverseasTour> tours = OverseasTour.getSortOverseasTour(
				p.getFirst(), p.getMaxResult());
		/* 国内线路 */
		List<Tour> gnlvs = Tour.getSortTourByType(tgn, (page - 1) * 0, 8);
		p.calePages(3, 7);

		gnlvs.addAll(tours);
		model.addAttribute("tours", gnlvs);
		/*
		 * model.addAttribute("tours", tours); model.addAttribute("gnlvs",
		 * gnlvs);
		 */
		model.addAttribute("page", p);

		return "jlwlv";
	}

	@RequestMapping("jlw")
	public String jlw(Model model,
			@RequestParam(required = false, defaultValue = "0") long city,
			@RequestParam(required = false, defaultValue = "") String content,
			@RequestParam(required = false, defaultValue = "1") int page) {
		OverseasTourAddress otc = OverseasTourAddress.findOverseasTourAddress(city);
		Page p = new Page((int)OverseasTour.findCount(otc, content), page, 7);
		model.addAttribute("page", p);
		model.addAttribute("tours", OverseasTour.find(otc, content, p.getFirst(), p.getMaxResult()));
		model.addAttribute("uri", "jlw?city=" + city + "&content=" + content + "&page=" + page + "&");
		return "jlwlv";
	}

}
