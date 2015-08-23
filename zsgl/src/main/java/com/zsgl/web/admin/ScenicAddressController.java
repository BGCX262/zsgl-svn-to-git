package com.zsgl.web.admin;

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

import com.zsgl.domain.ScenicAddress;

@RequestMapping("/scenicAddresses")
@Controller
@RooWebScaffold(path = "scenicAddresses", formBackingObject = ScenicAddress.class)
public class ScenicAddressController {


	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ScenicAddress scenicAddress, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, scenicAddress);
            return "scenicAddresses/create";
        }
        uiModel.asMap().clear();
        scenicAddress.persist();
        return "redirect:/scenicAddresses/" + encodeUrlPathSegment(scenicAddress.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new ScenicAddress());
        return "scenicAddresses/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("scenicaddress", ScenicAddress.findScenicAddress(id));
        uiModel.addAttribute("itemId", id);
        return "scenicAddresses/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("scenicaddresses", ScenicAddress.findScenicAddressEntries(firstResult, sizeNo));
            float nrOfPages = (float) ScenicAddress.countScenicAddresses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("scenicaddresses", ScenicAddress.findAllScenicAddresses());
        }
        return "scenicAddresses/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ScenicAddress scenicAddress, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, scenicAddress);
            return "scenicAddresses/update";
        }
        uiModel.asMap().clear();
        scenicAddress.merge();
        return "redirect:/scenicAddresses/" + encodeUrlPathSegment(scenicAddress.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ScenicAddress.findScenicAddress(id));
        return "scenicAddresses/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ScenicAddress scenicAddress = ScenicAddress.findScenicAddress(id);
        scenicAddress.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/scenicAddresses";
    }

	void populateEditForm(Model uiModel, ScenicAddress scenicAddress) {
        uiModel.addAttribute("scenicAddress", scenicAddress);
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
