package com.zsgl.web.admin;

import com.zsgl.domain.HotelLevel;
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

@RequestMapping("/hotellevels")
@Controller
@RooWebScaffold(path = "hotellevels", formBackingObject = HotelLevel.class)
public class HotelLevelController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid HotelLevel hotelLevel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hotelLevel);
            return "hotellevels/create";
        }
        uiModel.asMap().clear();
        hotelLevel.persist();
        return "redirect:/hotellevels/" + encodeUrlPathSegment(hotelLevel.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new HotelLevel());
        return "hotellevels/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("hotellevel", HotelLevel.findHotelLevel(id));
        uiModel.addAttribute("itemId", id);
        return "hotellevels/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("hotellevels", HotelLevel.findHotelLevelEntries(firstResult, sizeNo));
            float nrOfPages = (float) HotelLevel.countHotelLevels() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("hotellevels", HotelLevel.findAllHotelLevels());
        }
        return "hotellevels/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid HotelLevel hotelLevel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hotelLevel);
            return "hotellevels/update";
        }
        uiModel.asMap().clear();
        hotelLevel.merge();
        return "redirect:/hotellevels/" + encodeUrlPathSegment(hotelLevel.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, HotelLevel.findHotelLevel(id));
        return "hotellevels/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        HotelLevel hotelLevel = HotelLevel.findHotelLevel(id);
        hotelLevel.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/hotellevels";
    }

	void populateEditForm(Model uiModel, HotelLevel hotelLevel) {
        uiModel.addAttribute("hotelLevel", hotelLevel);
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
