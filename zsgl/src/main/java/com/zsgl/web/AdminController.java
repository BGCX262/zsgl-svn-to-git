package com.zsgl.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.domain.AccountType;
import com.zsgl.domain.CompanyAccount;
import com.zsgl.domain.DiyTour;
import com.zsgl.domain.Hotel;
import com.zsgl.domain.HotelAddress;
import com.zsgl.domain.MeetingHotel;
import com.zsgl.domain.MeetingTour;
import com.zsgl.domain.OverseasTour;
import com.zsgl.domain.Tour;
import com.zsgl.domain.TourType;

/**
 * 对后台一些快捷操作进行补充
 * @author itachi
 *
 */
@Controller
public class AdminController {
	
	/**
	 * 根据类型进行显示路线列表
	 * 此处将子类去除
	 * 因为当更新子类的时候会抛异常
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("tourss")
	public String tourss(long type, Model model) {
		List<Tour> list = Tour.findToursByType(TourType.findTourType(type)).getResultList();
		List<Tour> list2 = new ArrayList<Tour>();
		for (Tour o : list) {
			if (o instanceof MeetingTour || o instanceof OverseasTour || o instanceof DiyTour) {
				continue;
			}
			list2.add(o);
		}
		list.clear();
		list = null;
		model.addAttribute("tours", list2);
		return "tours/all";
	}
	
	/**
	 * 同上
	 * @param hotelAddress
	 * @param model
	 * @return
	 */
	@RequestMapping("hotelss")
	public String hotelss(long hotelAddress , Model model) {
		List<Hotel> list = Hotel.findHotelsByAddress(HotelAddress.findHotelAddress(hotelAddress)).getResultList();
		List<Hotel> list2 = new ArrayList<Hotel>();
		for (Hotel o : list) {
			if (o instanceof MeetingHotel) {
				continue;
			}
			list2.add(o);
		}
		list.clear();
		list = null;
		model.addAttribute("hotels", list2);
		return "hotels/list";
	}
	
	@RequestMapping("companyaccountss")
	public String companyaccountss(long type, Model model) {
		model.addAttribute("companyaccounts", CompanyAccount.findCompanyAccountsByAccountType(AccountType.findAccountType(type)).getResultList());
		return "companyaccounts/list";
	}
	
}
