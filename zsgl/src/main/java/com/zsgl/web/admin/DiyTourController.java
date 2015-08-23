package com.zsgl.web.admin;

import com.zsgl.domain.DiyTour;
import com.zsgl.domain.Recommend;
import com.zsgl.domain.TourAddress;
import com.zsgl.domain.TourDay;
import com.zsgl.domain.TourType;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RequestMapping("/diytours")
@Controller
@RooWebScaffold(path = "diytours", formBackingObject = DiyTour.class)
public class DiyTourController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid DiyTour diyTour, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, diyTour);
            return "diytours/create";
        }
        uiModel.asMap().clear();
        diyTour.persist();
        return "redirect:/diytours/" + encodeUrlPathSegment(diyTour.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new DiyTour());
        return "diytours/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("diytour", DiyTour.findDiyTour(id));
        uiModel.addAttribute("itemId", id);
        return "diytours/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("diytours", DiyTour.findDiyTourEntries(firstResult, sizeNo));
            float nrOfPages = (float) DiyTour.countDiyTours() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("diytours", DiyTour.findAllDiyTours());
        }
        return "diytours/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid DiyTour diyTour, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, diyTour);
            return "diytours/update";
        }
        uiModel.asMap().clear();
        diyTour.merge();
        return "redirect:/diytours/" + encodeUrlPathSegment(diyTour.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, DiyTour.findDiyTour(id));
        return "diytours/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DiyTour diyTour = DiyTour.findDiyTour(id);
        diyTour.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/diytours";
    }

	void populateEditForm(Model uiModel, DiyTour diyTour) {
        uiModel.addAttribute("diyTour", diyTour);
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
}
