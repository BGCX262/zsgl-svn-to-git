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
public class Test4 {
	
	/**
	 * 测试查询
	 */
	public void testFindHotelOrder() {
		HotelOrder o = HotelOrder.findHotelOrder(9L);
		Assert.assertNotNull(o);
	}
	
	@Test
	public void testUpdate() {
		Tour tour = Tour.findTour(40L);
		System.out.println(tour.getKeywords());
		tour.setKeywords("1111");
		tour.merge();
		System.out.println(tour.getKeywords());
	}
	
}
