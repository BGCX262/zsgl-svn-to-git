package com.zsgl.util;

import java.net.URLEncoder;
import java.util.Date;
import java.util.Set;

import com.zsgl.domain.Price;
import com.zsgl.domain.Room;

public class StringConvertion {
	
	public static String encode(String str) throws Exception {
		return URLEncoder.encode(str, "GBK");
	}
	
	public static boolean isToday(Date date) {
		String now = Common.simpleDateFormat.format(new Date(System.currentTimeMillis())); 
		String d = Common.simpleDateFormat.format(date);
		return now.equals(d);
	}
	
	public static String formatDate(Date date) {
		return Common.simpleDateFormat.format(date);
	}
	
	public static String showPrice(Set<Room> rooms) {
		if(rooms != null && rooms.size() > 0) {
			for (Room room : rooms) {
				return showRoomPrice(room.getPrices());
			}
		}
		return "0.0";
	}
	
	public static String showRoomPrice(Set<Price> prices) {
		for(Price p : prices) {
			if(isToday(p.getDate())) {
				return p.getPrice().toString();
			}
		}
		return "0.0";
	}
	
}
