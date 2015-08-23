package com.zsgl.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.domain.Strategy;
import com.zsgl.domain.StrategyType;
import com.zsgl.util.Page;

/**
 * 旅游攻略模块
 * @author 林超
 */
@Controller
@RequestMapping({"/gl", "/ajax/gl"})
public class LyglController {
	
	static final Logger logger = Logger.getLogger(LyglController.class);
	
	static final String GL_PATH = "gl/";
	
	static final String GL_TYPE_PATH = "gl/type/";
	
	int pageCount = 10;
	
	/**
	 * 不区分分类显示，默认显示第一页
	 * @param model
	*/
	@RequestMapping
	public void gl(Model model) {
		logger.info(GL_PATH);
		gl(1, model);
	}
	
	@RequestMapping("/{page}")
	public void gl(@PathVariable int page, Model model) {
		logger.info(GL_PATH + page);
		Page p = new Page((int)Strategy.countStrategys(), page, pageCount);
		model.addAttribute("strategys", Strategy.findStrategyEntries(p.getFirst(), p.getMaxResult()));
		model.addAttribute("strategyTypes", StrategyType.findAllStrategyTypes());
		model.addAttribute("page", p);
		model.addAttribute("GL_PATH", GL_PATH);
	}
	
	@RequestMapping("/type/{type}/{page}")
	public void type(@PathVariable long type, @PathVariable int page, Model model) {
		String uri = GL_TYPE_PATH + type + "/";
		logger.info(uri + page);
		StrategyType st = StrategyType.findStrategyType(type);
		Page p = new Page((int)Strategy.countType(st), page, pageCount);
		List<Strategy> strategys = Strategy.getSortStrategyByType(st, p.getFirst(), p.getMaxResult());
		model.addAttribute("strategys", strategys);
		model.addAttribute("strategyTypes", StrategyType.findAllStrategyTypes());
		model.addAttribute("typeName", st.getName());
		model.addAttribute("page", p);
		model.addAttribute("GL_PATH", uri);
	}
	
	@RequestMapping("/view/{id}")
	public void view(@PathVariable long id, Model model) {
		logger.info("gl/view/" + id);
		Strategy strategy = Strategy.findStrategy(id);
		model.addAttribute("strategy", strategy);
		model.addAttribute("title", strategy.getName());
		model.addAttribute("typeName", strategy.getType().getName());
		model.addAttribute("prev", strategy.prev());
		model.addAttribute("next", strategy.next());
	}
	
}
