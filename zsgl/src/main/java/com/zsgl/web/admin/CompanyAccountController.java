package com.zsgl.web.admin;

import com.zsgl.domain.AccountType;
import com.zsgl.domain.BankType;
import com.zsgl.domain.CompanyAccount;
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

@RequestMapping("/companyaccounts")
@Controller
@RooWebScaffold(path = "companyaccounts", formBackingObject = CompanyAccount.class)
public class CompanyAccountController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid CompanyAccount companyAccount, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, companyAccount);
            return "companyaccounts/create";
        }
        uiModel.asMap().clear();
        companyAccount.persist();
        return "redirect:/companyaccounts/" + encodeUrlPathSegment(companyAccount.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new CompanyAccount());
        return "companyaccounts/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("companyaccount", CompanyAccount.findCompanyAccount(id));
        uiModel.addAttribute("itemId", id);
        return "companyaccounts/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("companyaccounts", CompanyAccount.findCompanyAccountEntries(firstResult, sizeNo));
            float nrOfPages = (float) CompanyAccount.countCompanyAccounts() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("companyaccounts", CompanyAccount.findAllCompanyAccounts());
        }
        return "companyaccounts/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid CompanyAccount companyAccount, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, companyAccount);
            return "companyaccounts/update";
        }
        uiModel.asMap().clear();
        companyAccount.merge();
        return "redirect:/companyaccounts/" + encodeUrlPathSegment(companyAccount.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, CompanyAccount.findCompanyAccount(id));
        return "companyaccounts/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CompanyAccount companyAccount = CompanyAccount.findCompanyAccount(id);
        companyAccount.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/companyaccounts";
    }

	void populateEditForm(Model uiModel, CompanyAccount companyAccount) {
        uiModel.addAttribute("companyAccount", companyAccount);
        uiModel.addAttribute("accounttypes", AccountType.findAllAccountTypes());
        uiModel.addAttribute("banktypes", BankType.findAllBankTypes());
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
