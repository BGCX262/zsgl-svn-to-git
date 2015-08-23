package com.zsgl.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsgl.domain.CompanyAccount;
import com.zsgl.domain.Hotel;
import com.zsgl.domain.Price;
import com.zsgl.preparer.AbstractPreparer;
import com.zsgl.util.Common;

@Controller
public class SimpleController {
	
	static final Logger logger = Logger.getLogger(SimpleController.class);
	
	static final String ABOUT = "about";
	
	static final String ZSZH = "gszh";
	
	/**
	 * 查询酒店价格
	 * @param hotel_id
	 * @param begin
	 * @param end
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("query_price")
	public String query_price(long hotel_id, String begin, String end, Model model) throws Exception {
		Hotel hotel = Hotel.findHotel(hotel_id);
		List<Price> prices = hotel.queryPrice(Common.simpleDateFormat.parse(begin), Common.simpleDateFormat.parse(end));
		model.addAttribute("hotel", hotel);
		model.addAttribute("prices", prices);
		return "query_result";
	}
	
	/**
	 * 公司简介
	 * 
	 * @param model
	 */
	@RequestMapping(ABOUT)
	public void about(Model model) throws Exception {
		logger.info(ABOUT);
		AbstractPreparer.fillAbout(model.asMap());
	}

 	
	/**
	 * 公司账号
	 * @throws Exception 
	 */
	@RequestMapping(ZSZH)
	public void gszh(Model model) throws Exception {
		logger.info(ZSZH);
		List<CompanyAccount> accounts = CompanyAccount.findAllCompanyAccounts();
		model.addAttribute("accounts", accounts);
	}
	
}
