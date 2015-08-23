package com.zsgl.domain;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:META-INF/spring/applicationContext.xml")
@Transactional
public class Test3 {
	
	/**
	 * 测试获取当天价格方法
	 */
	@Test
	public void testGetTodayPrice() {
		Room room1 = Room.findRoom(33L);
		System.out.println(room1.getTodayPrice());
		Assert.assertTrue(550.0 == room1.getTodayPrice());
		
		Room room2 = Room.findRoom(34L);
		System.out.println(room2.getTodayPrice());
		Assert.assertTrue(630.0 == room2.getTodayPrice());
		
		Room room3 = Room.findRoom(35L);
		System.out.println(room3.getTodayPrice());
		Assert.assertTrue(710.0 == room3.getTodayPrice());
		
		Room room4 = Room.findRoom(36L);
		System.out.println(room4.getTodayPrice());
		Assert.assertTrue(790.0 == room4.getTodayPrice());
	}
	
	/**
	 * 测试没有设置价格房间
	 * 获取当天的价格
	 */
	@Test
	public void testGetTodayPrice2() {
		Room room1 = Room.findRoom(22L);
		System.out.println(room1.getTodayPrice());
		Assert.assertTrue(null == room1.getTodayPrice());
	}
	
}
