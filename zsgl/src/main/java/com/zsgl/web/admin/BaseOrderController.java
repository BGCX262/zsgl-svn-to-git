package com.zsgl.web.admin;

import com.zsgl.domain.Affirm;
import com.zsgl.domain.BaseOrder;
import com.zsgl.domain.OrderState;
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

@RequestMapping("/baseorders")
@Controller
@RooWebScaffold(path = "baseorders", formBackingObject = BaseOrder.class)
public class BaseOrderController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid BaseOrder baseOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, baseOrder);
            return "baseorders/create";
        }
        uiModel.asMap().clear();
        baseOrder.persist();
        return "redirect:/baseorders/" + encodeUrlPathSegment(baseOrder.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new BaseOrder());
        return "baseorders/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("baseorder", BaseOrder.findBaseOrder(id));
        uiModel.addAttribute("itemId", id);
        return "baseorders/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("baseorders", BaseOrder.findBaseOrderEntries(firstResult, sizeNo));
            float nrOfPages = (float) BaseOrder.countBaseOrders() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("baseorders", BaseOrder.findAllBaseOrders());
        }
        return "baseorders/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid BaseOrder baseOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, baseOrder);
            return "baseorders/update";
        }
        uiModel.asMap().clear();
        baseOrder.merge();
        return "redirect:/baseorders/" + encodeUrlPathSegment(baseOrder.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, BaseOrder.findBaseOrder(id));
        return "baseorders/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        BaseOrder baseOrder = BaseOrder.findBaseOrder(id);
        baseOrder.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/baseorders";
    }

	void populateEditForm(Model uiModel, BaseOrder baseOrder) {
        uiModel.addAttribute("baseOrder", baseOrder);
        uiModel.addAttribute("affirms", Affirm.findAllAffirms());
        uiModel.addAttribute("orderstates", OrderState.findAllOrderStates());
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
