package com.zsgl.web.admin;

import com.zsgl.domain.MeetingTour;
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

@RequestMapping("/meetingtours")
@Controller
@RooWebScaffold(path = "meetingtours", formBackingObject = MeetingTour.class)
public class MeetingTourController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid MeetingTour meetingTour, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, meetingTour);
            return "meetingtours/create";
        }
        uiModel.asMap().clear();
        meetingTour.persist();
        return "redirect:/meetingtours/" + encodeUrlPathSegment(meetingTour.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new MeetingTour());
        return "meetingtours/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("meetingtour", MeetingTour.findMeetingTour(id));
        uiModel.addAttribute("itemId", id);
        return "meetingtours/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("meetingtours", MeetingTour.findMeetingTourEntries(firstResult, sizeNo));
            float nrOfPages = (float) MeetingTour.countMeetingTours() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("meetingtours", MeetingTour.findAllMeetingTours());
        }
        return "meetingtours/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid MeetingTour meetingTour, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, meetingTour);
            return "meetingtours/update";
        }
        uiModel.asMap().clear();
        meetingTour.merge();
        return "redirect:/meetingtours/" + encodeUrlPathSegment(meetingTour.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, MeetingTour.findMeetingTour(id));
        return "meetingtours/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MeetingTour meetingTour = MeetingTour.findMeetingTour(id);
        meetingTour.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/meetingtours";
    }

	void populateEditForm(Model uiModel, MeetingTour meetingTour) {
        uiModel.addAttribute("meetingTour", meetingTour);
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
