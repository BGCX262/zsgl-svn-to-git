package com.zsgl.web.admin;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.zsgl.domain.Hotel;
import com.zsgl.domain.HotelAddress;
import com.zsgl.domain.HotelLevel;
import com.zsgl.domain.Recommend;
import com.zsgl.domain.Room;

@RequestMapping("/hotels")
@Controller
@RooWebScaffold(path = "hotels", formBackingObject = Hotel.class)
public class HotelController {

	@Autowired
	RestTemplate restTemplate;
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Hotel hotel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hotel);
            return "hotels/create";
        }
        uiModel.asMap().clear();
        hotel.persist();
        createPage(hotel, httpServletRequest);
        return "redirect:/hotels/" + encodeUrlPathSegment(hotel.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Hotel());
        return "hotels/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("hotel", Hotel.findHotel(id));
        uiModel.addAttribute("itemId", id);
        return "hotels/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("hotels", Hotel.findHotelEntries(firstResult, sizeNo));
            float nrOfPages = (float) Hotel.countHotels() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("hotels", Hotel.findAllHotels());
        }
        return "hotels/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Hotel hotel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hotel);
            return "hotels/update";
        }
        uiModel.asMap().clear();
        hotel.merge();
        createPage(hotel, httpServletRequest);
        return "redirect:/hotels/" + encodeUrlPathSegment(hotel.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Hotel.findHotel(id));
        return "hotels/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Hotel hotel = Hotel.findHotel(id);
        hotel.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
//        return "redirect:/hotels";
        return "redirect:/hotelss?hotelAddress=" + hotel.getAddress().getId();
    }

	void populateEditForm(Model uiModel, Hotel hotel) {
        uiModel.addAttribute("hotel", hotel);
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
	
	void createPage(Hotel o, HttpServletRequest request) {
		restTemplate.getForEntity("http://" + request.getServerName() + "/static/toHtml?uri={uri}", null, "/hotel/view/" + o.getId() + ".html");
	}
	
}
