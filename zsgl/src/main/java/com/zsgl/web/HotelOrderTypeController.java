package com.zsgl.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zsgl.domain.BaseOrder;
import com.zsgl.domain.HotelOrder;
import com.zsgl.domain.OrderState;
import com.zsgl.domain.TourOrder;

@Controller
@RequestMapping("/hotelorders")
public class HotelOrderTypeController {

	/**
	 * 酒店订单
	 * @param state
	 * @param model
	 * @return
	 */
	@RequestMapping("/hotelorder")
	public String hotelOrder(@RequestParam long state,
			Model model) {
		OrderState s = OrderState.findOrderState(state);
		List<HotelOrder> hotelOrders = HotelOrder.findOrderByState(s, HotelOrder.class);
		model.addAttribute("hotelorders", hotelOrders);
		return "hotelorders/orderhotel";
	}
	
	/**
	 * 旅游订单
	 * @param state
	 * @param model
	 * @return
	 */
	@RequestMapping("/tourorder")
	public String tourOrder(@RequestParam long state,
			Model model) {
		OrderState s = OrderState.findOrderState(state);
		List<TourOrder> tourOrders = TourOrder.findOrderByState(s, TourOrder.class);
		model.addAttribute("tourorders", tourOrders);
		return "tourorders/tourorder";
	}
	
	/**
	 * 更新订单状态
	 * @param id
	 * @param state
	 * @return
	 */
	@RequestMapping("/updateorderstate")
	public String updateorderstate(@RequestParam long id, @RequestParam long state) {
		OrderState orderState = OrderState.findOrderState(state);
		BaseOrder order = BaseOrder.findBaseOrder(id);
		long s = order.getOrderState().getId();
		order.setOrderState(orderState);
		order.persist();
		if(order instanceof HotelOrder) {
			return "redirect:hotelorder?state=" + s;
		}
		return "redirect:tourorder?state=" + s;
	}
}
