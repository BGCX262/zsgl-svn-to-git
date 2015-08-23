package com.zsgl.web;


import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.zsgl.domain.Strategy;
import com.zsgl.domain.StrategyType;

/**
 * 更新攻略
 * 参考 http://www.mafengwo.cn 攻略格式，进行挖掘
 * @author itachi
 */
@Controller
@RequestMapping("/xt")
public class ThiefController {
	
	@Autowired
	RestTemplate restTemplate;
	
	static final String start = "<div class=\"a_con_text cont\" id=\"pnl_contentinfo\" val=\"{val}\" vaname=\"{name}\">";
	
	static final String end = "</div>";
	
	static final String spanStart = "<span class=\"link\">";
	
	static final String spanEnd = "</span>";
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(String u) throws Exception {
		return parseAndSave(request(u));
	}
	
	@RequestMapping("/view")
	@ResponseBody
	public String view(String u) throws Exception {
		return request(u);
	}
	
	@RequestMapping("/parse")
	public String parseAndSave(@RequestParam(required = false, defaultValue = "") String s) throws Exception {
		//去除连接
		String[] links = StringUtils.substringsBetween(s, spanStart, spanEnd);
		for (String link : links) {
			s = StringUtils.remove(s, spanStart + link + spanEnd);
		}
		//标题
		String name = StringUtils.substringBetween(s, "<h1>", "</h1>");
		//匹配特征
		String vname = StringUtils.substringBetween(s, "vaname=\"", "\">");
		String val = StringUtils.substringBetween(s, "val=\"", "\"");
		//内容
		String content = StringUtils.substringBetween(s, start.replace("{name}", vname).replace("{val}", val), end);
		Strategy strategy = Strategy.findByName(name);
		//不存在则添加，否则直接返回
		if (strategy == null) {
			strategy = new Strategy();
			strategy.setName(name);
			strategy.setContent(content);
			strategy.setKeywords(name);
			strategy.setDescription(name);
			strategy.setUpdateTime(new Date(System.currentTimeMillis()));
			strategy.setType(StrategyType.findStrategyType(1L));
			strategy.persist();
		}
		return "redirect:/gl/view/" + strategy.getId() + ".html";
	}
	
	public String request(String url) {
		url = url.replace("www.mafengwo.cn", "119.254.76.148");
		return restTemplate.getForObject(url, String.class);
	}
	
}
