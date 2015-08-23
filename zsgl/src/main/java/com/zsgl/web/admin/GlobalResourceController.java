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

import com.zsgl.domain.GlobalResource;
import com.zsgl.listener.ApplicationListener;

@RequestMapping("/globalresources")
@Controller
@RooWebScaffold(path = "globalresources", formBackingObject = GlobalResource.class)
public class GlobalResourceController {


	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid GlobalResource globalResource, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, globalResource);
            return "globalresources/create";
        }
        uiModel.asMap().clear();
        globalResource.persist();
        return "redirect:/globalresources/" + encodeUrlPathSegment(globalResource.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new GlobalResource());
        return "globalresources/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("globalresource", GlobalResource.findGlobalResource(id));
        uiModel.addAttribute("itemId", id);
        return "globalresources/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("globalresources", GlobalResource.findGlobalResourceEntries(firstResult, sizeNo));
            float nrOfPages = (float) GlobalResource.countGlobalResources() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("globalresources", GlobalResource.findAllGlobalResources());
        }
        return "globalresources/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid GlobalResource globalResource, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, globalResource);
            return "globalresources/update";
        }
        uiModel.asMap().clear();
        globalResource.merge();
        ApplicationListener.loadCommonnData(httpServletRequest.getSession().getServletContext());
        return "redirect:/globalresources/" + encodeUrlPathSegment(globalResource.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, GlobalResource.findGlobalResource(id));
        return "globalresources/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GlobalResource globalResource = GlobalResource.findGlobalResource(id);
        globalResource.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/globalresources";
    }

	void populateEditForm(Model uiModel, GlobalResource globalResource) {
        uiModel.addAttribute("globalResource", globalResource);
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
