package com.zsgl.web.admin;

import com.zsgl.domain.HotelAddress;
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

@RequestMapping("/hoteladdresses")
@Controller
@RooWebScaffold(path = "hoteladdresses", formBackingObject = HotelAddress.class)
public class HotelAddressController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid HotelAddress hotelAddress, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hotelAddress);
            return "hoteladdresses/create";
        }
        uiModel.asMap().clear();
        hotelAddress.persist();
        return "redirect:/hoteladdresses/" + encodeUrlPathSegment(hotelAddress.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new HotelAddress());
        return "hoteladdresses/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("hoteladdress", HotelAddress.findHotelAddress(id));
        uiModel.addAttribute("itemId", id);
        return "hoteladdresses/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("hoteladdresses", HotelAddress.findHotelAddressEntries(firstResult, sizeNo));
            float nrOfPages = (float) HotelAddress.countHotelAddresses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("hoteladdresses", HotelAddress.findAllHotelAddresses());
        }
        return "hoteladdresses/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid HotelAddress hotelAddress, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hotelAddress);
            return "hoteladdresses/update";
        }
        uiModel.asMap().clear();
        hotelAddress.merge();
        return "redirect:/hoteladdresses/" + encodeUrlPathSegment(hotelAddress.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, HotelAddress.findHotelAddress(id));
        return "hoteladdresses/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        HotelAddress hotelAddress = HotelAddress.findHotelAddress(id);
        hotelAddress.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/hoteladdresses";
    }

	void populateEditForm(Model uiModel, HotelAddress hotelAddress) {
        uiModel.addAttribute("hotelAddress", hotelAddress);
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
