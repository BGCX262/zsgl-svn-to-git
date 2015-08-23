package com.zsgl.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zsgl.domain.Scenic;
import com.zsgl.domain.ScenicAddress;
import com.zsgl.util.Page;

/**
 * 景点介绍模块
 * @author 林超
 */
@Controller
@RequestMapping({"/jd", "/ajax/jd"})
public class JdjsController {
	
	static final Logger logger = Logger.getLogger(JdjsController.class);
	
	static final String JD_PATH = "jd/";
	
	static final String JD_ADDRESS_PATH = "jd/address/";
	
	/**
	 * 不区分城市，默认显示第一页
	 * @param model
	 * @return
	*/
	@RequestMapping
	public void jd(@RequestParam(required = false, defaultValue = "") String content, Model model) {
		logger.info(JD_PATH);
		jd(1, content,  model);
	}
	
	/**
	 * 不区分城市，根据页码进行显示
	 * @param page
	 * @param model
	 */
	@RequestMapping("/{page}")
	public void jd(@PathVariable int page, @RequestParam(required = false, defaultValue = "") String content, Model model) {
		logger.info(JD_PATH);
//		Page p = new Page((int) Scenic.findCount(null, content), page, 7);
//		List<Scenic> scenics = Scenic.getSortScenics(p.getFirst(), p.getMaxResult());
		Page p = new Page((int) Scenic.findCount(null, content), page, 7);
		List<Scenic> scenics = Scenic.find(null, content, p.getFirst(), p.getMaxResult());
		model.addAttribute("scenics", scenics);
		model.addAttribute("page", p);
		model.addAttribute("JD_PATH", JD_PATH);
	}
	
	/**
	 * 根据地址分类进行分页显示
	 * @param address
	 * @param page
	 * @param model
	 */
	@RequestMapping("/address/{address}/{page}")
	public void address(@PathVariable long address, @PathVariable int page, Model model) {
		String uri = JD_ADDRESS_PATH + address + "/";
		logger.info(uri + page);
		ScenicAddress scenicAddress = ScenicAddress.findScenicAddress(address);
		Page p = new Page((int) Scenic.findCount(scenicAddress, ""), page, 7);
		model.addAttribute("scenics", Scenic.find(scenicAddress, "", p.getFirst(), p.getMaxResult()));
		model.addAttribute("typeName", scenicAddress.getName());
		model.addAttribute("page", p);
		model.addAttribute("title", scenicAddress.getName());
		model.addAttribute("JD_PATH", uri);
	}
	
	/**
	 * 显示景点详细
	 * @param id
	 * @param model
	 */
	@RequestMapping("/view/{id}")
	public void view(@PathVariable long id, Model model) {
		logger.info("jd/view/" + id);
		Scenic scenic = Scenic.findScenic(id);
		model.addAttribute("scenic", scenic);
		model.addAttribute("prev", scenic.prev());
		model.addAttribute("next", scenic.next());
		model.addAttribute("title", scenic.getName());
		model.addAttribute("typeName", scenic.getAddress().getName());
		model.addAttribute("keywords", scenic.getKeywords());
		model.addAttribute("description", scenic.getDescription());
	}
	
	
	///////////////////////////以下为旧代码//////////////////////////////////
	
	/**
	 * 景点介绍
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	//@RequestMapping("jingdian")
	public String jingdian(Model model,
			@RequestParam(required = false, defaultValue = "1") int page) {
		Page p = new Page((int) Scenic.countScenics(), page, 7);
		if (p.getPage() < 1 || p.getPage() > p.getLast()) {
			return "redirect:jingdian?page=1";
		}
		List<Scenic> scenics = Scenic.getSortScenics(p.getFirst(),
				p.getMaxResult());
		p.calePages(3, 7);
		model.addAttribute("scenics", scenics);
		model.addAttribute("page", p);
		return "jingdian";
	}

	//@RequestMapping("jd")
	public String jingdian(Model model,
			@RequestParam(defaultValue = "0", required = false) long address,
			@RequestParam(required = false, defaultValue = "") String content,
			@RequestParam(required = false, defaultValue = "1") int page) {
		ScenicAddress scenicAddress = ScenicAddress.findScenicAddress(address);
		Page p = new Page((int) Scenic.findCount(scenicAddress, content), page, 7);
		p.calePages(3, 7);
		model.addAttribute("scenics", Scenic.find(scenicAddress, content.trim(), p.getFirst(), p.getMaxResult()));
		model.addAttribute("page", p);
		model.addAttribute("uri", "jd?address=" + address + "&content=" + content + "&");
		return "jingdian";
	}

	/**
	 * 景点详情
	 * @param model
	 * @param id
	 * @return
	 */
	//@RequestMapping("jingd_xq")
	public String jd_xq(Model model, @RequestParam long id) {
		Scenic scenic = Scenic.findScenic(id);
		if (scenic == null) {
			return "redirect:404";
		}
		model.addAttribute("scenic", scenic);
		// model.addAttribute("prev", scenic.prev());
		// model.addAttribute("next", scenic.next());
		return "jingd_xq";
	}
}
