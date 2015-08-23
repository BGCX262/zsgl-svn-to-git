package com.zsgl.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zsgl.domain.Affirm;
import com.zsgl.domain.Hotel;
import com.zsgl.domain.HotelOrder;
import com.zsgl.domain.Price;
import com.zsgl.domain.Room;
import com.zsgl.domain.Tour;
import com.zsgl.domain.TourOrder;

@Controller
public class OrderController {

	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00.0");

	/**
	 * 旅游预订页面
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("yuding")
	public String yuding(Model model, @RequestParam long id) {
		Tour tour = Tour.findTour(id);
		List<Affirm> affirms = Affirm.findAllAffirms();
		model.addAttribute("tour", tour);
		model.addAttribute("affirms", affirms);
		return "yuding";
	}

	/**
	 * 酒店预订页面
	 * 
	 * @param model
	 * @param id
	 * @param room
	 * @return
	 */
	@RequestMapping("hotelyd")
	public String hotelYd(Model model, @RequestParam long id,
			@RequestParam long room) {
		Hotel hotel = Hotel.findHotel(id);
		Room r = Room.findRoom(room);
		List<Affirm> affirms = Affirm.findAllAffirms();
		model.addAttribute("hotel", hotel);
		model.addAttribute("room", r);
		model.addAttribute("affirms", affirms);
		model.addAttribute("now", sdf.format(new Date()));
		return "hotelyd";
	}

	/**
	 * 酒店预订成功页面
	 * @return
	 */
	@RequestMapping("hotel_success/{id}")
	public String hotelSuccess(@PathVariable long id, Model model) {
		HotelOrder order = HotelOrder.findHotelOrder(id);
		if(order == null) {
			return "redirect:/404";
		}
		model.addAttribute("order", order);
		return "hotel_success";
	}
	
	/**
	 * 旅游线路预订成功页面
	 * @param model
	 * @return
	 */
	@RequestMapping("tour_success/{id}")
	public String tourSuccess(@PathVariable long id, Model model) {
		TourOrder order = TourOrder.findTourOrder(id);
		if(order == null) {
			return "redirect:/404";
		}
		model.addAttribute("order", order);
		return "tour_success";
	}

	/**
	 * 保存旅游订单
	 * @param tourOrder
	 * @return
	 */
	@RequestMapping("yudingForm")
	public String yudingForm(@Valid TourOrder tourOrder) {
		tourOrder.persist();
		return "redirect:tour_success/" + tourOrder.getId();
	}

	/**
	 * 保存酒店订单
	 * 
	 * @param hotelOrder
	 * @return
	 */
	@RequestMapping("hotelydForm")
	public String hotelydForm(@Valid HotelOrder hotelOrder) {
		
		/*
		 * 查询某段时间内的价格
		 * 得到入住期间的价格总和
		 */
		float price = 0;
		List<Price> prices = hotelOrder.getRoom().getHotel().queryPrice(hotelOrder.getEnterDate(), hotelOrder.getLeaveDate());
		for(Price p : prices) {
			if(p.getRoom().equals(hotelOrder.getRoom())) {
				price += p.getPrice();
			}
		}
		/*
		 * 计算入住时间跟离开时间的时间差
		 * 如果是负数就乘上-1使其变为正数 
		 */
		long temp = (hotelOrder.getEnterDate().getTime() - hotelOrder.getLeaveDate().getTime()) / (24 * 60 * 60 * 1000);
		temp = temp < 0 ? temp * -1 : temp;
		/*
		 * 由于计算得到的时间少了一天
		 * 所以在这里需要额外加1
		 * 保存计算后的价格
		 */
		hotelOrder.setDays((int)++temp);
		hotelOrder.setPrice(price * hotelOrder.getNum());
		hotelOrder.persist();
		/*
		 * 重定向到订单详细页面
		 */
		return "redirect:hotel_success/" + hotelOrder.getId();
	}

}
