package com.zsgl.web.admin;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.zsgl.domain.Strategy;
import com.zsgl.domain.StrategyType;

@RequestMapping("/strategys")
@Controller
@RooWebScaffold(path = "strategys", formBackingObject = Strategy.class)
public class StrategyController {
	
	@Autowired
	RestTemplate restTemplate;
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Strategy strategy, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, strategy);
            return "strategys/create";
        }
        uiModel.asMap().clear();
        strategy.persist();
        createPage(strategy, httpServletRequest);
        return "redirect:/strategys/" + encodeUrlPathSegment(strategy.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Strategy());
        return "strategys/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("strategy", Strategy.findStrategy(id));
        uiModel.addAttribute("itemId", id);
        return "strategys/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("strategys", Strategy.findStrategyEntries(firstResult, sizeNo));
            float nrOfPages = (float) Strategy.countStrategys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("strategys", Strategy.findAllStrategys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "strategys/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Strategy strategy, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, strategy);
            return "strategys/update";
        }
        uiModel.asMap().clear();
        strategy.merge();
        createPage(strategy, httpServletRequest);
        return "redirect:/strategys/" + encodeUrlPathSegment(strategy.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Strategy.findStrategy(id));
        return "strategys/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Strategy strategy = Strategy.findStrategy(id);
        strategy.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
//        return "redirect:/strategys";
        return "redirect:/strategys/all?type=" + strategy.getType().getId();
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("strategy_updatetime_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, Strategy strategy) {
        uiModel.addAttribute("strategy", strategy);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("strategytypes", StrategyType.findAllStrategyTypes());
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
	
	/**
	 * 生成页面
	 * @param tour
	 * @param request
	 */
	void createPage(Strategy o, HttpServletRequest request) {
		restTemplate.getForEntity("http://" + request.getServerName() + "/static/toHtml?uri={uri}", null, "/gl/view/" + o.getId() + ".html");
	}
	
}
