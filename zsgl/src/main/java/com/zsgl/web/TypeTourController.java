package com.zsgl.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zsgl.domain.Recommend;
import com.zsgl.domain.Tour;
import com.zsgl.domain.TourAddress;
import com.zsgl.domain.TourDay;
import com.zsgl.domain.TourType;

/**
 * 处理 后台 国内旅游、散客游、独立用车友
 * @author itachi
 *
 */
@Controller
public class TypeTourController {
	
	/**
	 * 添加表单页面
	 * 跟原来的区别在于，表单里面有一个隐藏字段类型
	 * 用来实现分类插入
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("tours/form")
	public String form(@RequestParam String type, Model model) {
		model.addAttribute("type_id", type);
		model.addAttribute("tour", new Tour());
		model.addAttribute("recommends", Recommend.findAllRecommends());
		model.addAttribute("touraddresses", TourAddress.findAllTourAddresses());
		model.addAttribute("tourdays", TourDay.findAllTourDays());
		model.addAttribute("tourtypes", TourType.findAllTourTypes());
		return "tours/form";
//		return "redirect:/index?type=" + type;
	}
	
	/**
	 * 根据类型，进行分类
	 * @param page
	 * @param size
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("tours/all")
	public String all(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam long type, Model model) {
		TourType tt = TourType.findTourType(type);
		if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            model.addAttribute("tours", Tour.getSortTourByType(tt, firstResult, sizeNo));
            float nrOfPages = (float) Tour.countTours() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("tours", Tour.getSortTourByType(tt, 0, (int)Tour.countTours()));
        }
		return "tours/all";
	}
}
