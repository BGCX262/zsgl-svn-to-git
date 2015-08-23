package com.zsgl.web.admin;

import com.zsgl.domain.Scenic;
import com.zsgl.domain.ScenicAddress;
import com.zsgl.domain.Strength;
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

@RequestMapping("/scenics")
@Controller
@RooWebScaffold(path = "scenics", formBackingObject = Scenic.class)
public class ScenicController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Scenic scenic, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, scenic);
            return "scenics/create";
        }
        uiModel.asMap().clear();
        scenic.persist();
        return "redirect:/scenics/" + encodeUrlPathSegment(scenic.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Scenic());
        return "scenics/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("scenic", Scenic.findScenic(id));
        uiModel.addAttribute("itemId", id);
        return "scenics/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("scenics", Scenic.findScenicEntries(firstResult, sizeNo));
            float nrOfPages = (float) Scenic.countScenics() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("scenics", Scenic.findAllScenics());
        }
        return "scenics/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Scenic scenic, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, scenic);
            return "scenics/update";
        }
        uiModel.asMap().clear();
        scenic.merge();
        return "redirect:/scenics/" + encodeUrlPathSegment(scenic.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Scenic.findScenic(id));
        return "scenics/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Scenic scenic = Scenic.findScenic(id);
        scenic.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/scenics";
    }

	void populateEditForm(Model uiModel, Scenic scenic) {
        uiModel.addAttribute("scenic", scenic);
        uiModel.addAttribute("scenicaddresses", ScenicAddress.findAllScenicAddresses());
        uiModel.addAttribute("strengths", Strength.findAllStrengths());
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
