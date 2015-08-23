package com.zsgl.domain;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.HandlerAdapter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter;

import com.zsgl.controller.IndexController;
import com.zsgl.util.Page;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:META-INF/spring/applicationContext.xml")
@Transactional
public class Test2 {
	
	MockHttpServletRequest request = new MockHttpServletRequest();
	
	MockHttpServletResponse response = new MockHttpServletResponse();
	
	HandlerAdapter adapater = new AnnotationMethodHandlerAdapter();
	
	IndexController handler;
	
	ModelAndView mav;
	
	public void testHotelSort() throws Exception {
//		request.setRequestURI("search/hotel?hotelAddress=1");
//		mav = adapater.handle(request, response, handler);
//		Assert.assertNotNull(mav);
//		System.out.println(mav);
		HotelAddress address = HotelAddress.findHotelAddress(1L);
		HotelLevel level = HotelLevel.findHotelLevel(5L);
		List<Hotel> list = Hotel.search(address, level, "", 0, Hotel.countSearch(address, level, ""));
		Assert.assertNotNull(list);
		for(Hotel hotel : list) {
			System.out.println(hotel.getSort());
		}
	}
	
	@Test
	public void testJdSort() {
		Page p = new Page((int)Scenic.countScenics(), 1, 17);
		List<Scenic> scenics = Scenic.getSortScenics(p.getFirst(), p.getMaxResult());
		Assert.assertNotNull(scenics);
		for(Scenic s : scenics) {
			System.out.println("id :" + s.getId() + ", sort = " + s.getSort());
		}
	}
	
	
}
