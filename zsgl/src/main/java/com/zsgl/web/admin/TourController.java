package com.zsgl.web.admin;

import com.zsgl.domain.Recommend;
import com.zsgl.domain.Tour;
import com.zsgl.domain.TourAddress;
import com.zsgl.domain.TourDay;
import com.zsgl.domain.TourType;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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

@RequestMapping("/tours")
@Controller
@RooWebScaffold(path = "tours", formBackingObject = Tour.class)
public class TourController {

	@Autowired
	RestTemplate restTemplate;
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Tour tour, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tour);
            return "tours/create";
        }
        uiModel.asMap().clear();
        tour.persist();
        createPage(tour, httpServletRequest);
        return "redirect:/tours/" + encodeUrlPathSegment(tour.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Tour());
        return "tours/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("tour", Tour.findTour(id));
        uiModel.addAttribute("itemId", id);
        return "tours/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("tours", Tour.findTourEntries(firstResult, sizeNo));
            float nrOfPages = (float) Tour.countTours() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("tours", Tour.findAllTours());
        }
        return "tours/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Tour tour, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tour);
            return "tours/update";
        }
        uiModel.asMap().clear();
        tour.merge();
        createPage(tour, httpServletRequest);
        return "redirect:/tours/" + encodeUrlPathSegment(tour.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Tour.findTour(id));
        return "tours/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Tour tour = Tour.findTour(id);
        tour.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
//        return "redirect:/tours";
        return "redirect:/tourss?type=" + tour.getType().getId();
    }

	void populateEditForm(Model uiModel, Tour tour) {
        uiModel.addAttribute("tour", tour);
        uiModel.addAttribute("recommends", Recommend.findAllRecommends());
        uiModel.addAttribute("touraddresses", TourAddress.findAllTourAddresses());
        uiModel.addAttribute("tourdays", TourDay.findAllTourDays());
        uiModel.addAttribute("tourtypes", TourType.findAllTourTypes());
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
	void createPage(Tour o, HttpServletRequest request) {
		restTemplate.getForEntity("http://" + request.getServerName() + "/static/toHtml?uri={uri}", null, "/ly/view/" + o.getId() + ".html");
	}
}
