package com.zsgl.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zsgl.domain.Hotel;
import com.zsgl.domain.Price;
import com.zsgl.domain.Room;

@Controller
@Transactional
public class MyHotelController {
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	Logger log = Logger.getLogger(MyHotelController.class);
	
	/**
	 * 添加酒店房间  ajax 完成
	 * 添加成功返回0，失败返回-1
	 * @param room
	 * @param dates
	 * @param price
	 * @param hotel_id
	 * @return
	 */
	@RequestMapping("addRoom")
	@ResponseBody
	@DateTimeFormat(style="M-")
	public String addRoom(@Valid Room room, String dates, float price, long hotel_id) {
		log.info("add or update room");
		try {
			Hotel hotel = Hotel.findHotel(hotel_id);
			Room r = null;
			if(room.getId() != null && room.getId() > 0) {
				r = Room.findRoom(room.getId());
				r.copy(room);
			} else {
				r = room;
			}
			String[] ds = dates.trim().split(",");
			for(String d : ds) {
				boolean has = false;
				Date date = sdf.parse(d);
				for(Price pp : r.getPrices()) {
					if(pp.getDate().getTime() == date.getTime()) {
						pp.setPrice(price);
						has = true;
						break;
					}
				}
				if(!has) {
					Price p = new Price();
					p.setDate(date);
					p.setPrice(price);
					p.setRoom(r);
					p.persist();
					r.getPrices().add(p);
				}
			}
			r.setHotel(hotel);
			hotel.getRooms().add(r);
			log.info("add or update room success");
		} catch (Exception e) {
			log.error("add or update room error", e);
			e.printStackTrace();
			return "-1";
		}
		return "0";
	}
	
	/**
	 * 删除酒店房间 ajax 完成
	 * 成功返回0
	 * 失败返回-1
	 * @param hotel_id
	 * @param room_id
	 * @return
	 */
	@RequestMapping("delRoom")
	@ResponseBody
	public String delRoom(long hotel_id, long room_id) {
		log.info("delete room");
		try {
			Room room = Room.findRoom(room_id);
			Hotel.findHotel(hotel_id).getRooms().remove(room);
			room.remove();
			
			log.info("add room success");
		} catch (Exception e) {
			log.error("delete room error", e);
			return "-1";
		}
		return "0";
	}
	
	/**
	 * 更新酒店，由于房间更新方式不一样
	 * 造成更新酒店信息后，房间丢失
	 * 所以原来自动生成的不能用
	 * 重新写了一个，先将原来的查出来，然后将新数据拷贝
	 * 这样就能不丢失房间信息
	 * @param hotel
	 * @return
	 */
	@RequestMapping("updateHotel")
	public String update(@Valid Hotel hotel) {
		Hotel h = Hotel.findHotel(hotel.getId());
		h.copy(hotel);
		return "redirect:hotels/" + h.getId();
	}
	
}
