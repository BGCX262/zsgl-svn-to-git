package com.zsgl.web.admin;

import com.zsgl.domain.HotelAddress;
import com.zsgl.domain.HotelLevel;
import com.zsgl.domain.MeetingHotel;
import com.zsgl.domain.Recommend;
import com.zsgl.domain.Room;
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

@RequestMapping("/meetinghotels")
@Controller
@RooWebScaffold(path = "meetinghotels", formBackingObject = MeetingHotel.class)
public class MeetingHotelController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid MeetingHotel meetingHotel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, meetingHotel);
            return "meetinghotels/create";
        }
        uiModel.asMap().clear();
        meetingHotel.persist();
        return "redirect:/meetinghotels/" + encodeUrlPathSegment(meetingHotel.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new MeetingHotel());
        return "meetinghotels/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("meetinghotel", MeetingHotel.findMeetingHotel(id));
        uiModel.addAttribute("itemId", id);
        return "meetinghotels/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("meetinghotels", MeetingHotel.findMeetingHotelEntries(firstResult, sizeNo));
            float nrOfPages = (float) MeetingHotel.countMeetingHotels() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("meetinghotels", MeetingHotel.findAllMeetingHotels());
        }
        return "meetinghotels/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid MeetingHotel meetingHotel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, meetingHotel);
            return "meetinghotels/update";
        }
        uiModel.asMap().clear();
        meetingHotel.merge();
        return "redirect:/meetinghotels/" + encodeUrlPathSegment(meetingHotel.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, MeetingHotel.findMeetingHotel(id));
        return "meetinghotels/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MeetingHotel meetingHotel = MeetingHotel.findMeetingHotel(id);
        meetingHotel.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/meetinghotels";
    }

	void populateEditForm(Model uiModel, MeetingHotel meetingHotel) {
        uiModel.addAttribute("meetingHotel", meetingHotel);
        uiModel.addAttribute("hoteladdresses", HotelAddress.findAllHotelAddresses());
        uiModel.addAttribute("hotellevels", HotelLevel.findAllHotelLevels());
        uiModel.addAttribute("recommends", Recommend.findAllRecommends());
        uiModel.addAttribute("rooms", Room.findAllRooms());
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
