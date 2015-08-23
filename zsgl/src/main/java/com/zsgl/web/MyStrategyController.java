package com.zsgl.web;

import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zsgl.domain.Strategy;
import com.zsgl.domain.StrategyType;

@Controller
public class MyStrategyController {
	
	@RequestMapping("strategys/strategy")
	public String strategy(long type, Model model) {
		model.addAttribute("strategy", new Strategy());
		model.addAttribute("strategy_updatetime_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        model.addAttribute("strategytypes", StrategyType.findAllStrategyTypes());
		model.addAttribute("type_id", type);
		return "strategys/form";
	}
	
	@RequestMapping("strategys/all")
	public String all(long type, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
		if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("strategys", Strategy.getSortStrategyByType(StrategyType.findStrategyType(type), firstResult, sizeNo));
            float nrOfPages = (float) Strategy.countStrategys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("strategys", Strategy.getSortStrategyByType(StrategyType.findStrategyType(type), 0, (int)Strategy.countType(StrategyType.findStrategyType(type))));
        }
		uiModel.addAttribute("type_id", type);
		return "strategys/all";
	}
	
}
