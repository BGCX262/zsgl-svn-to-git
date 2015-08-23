package com.zsgl.domain;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.zsgl.domain.Hotel;
import com.zsgl.domain.Price;
import com.zsgl.domain.Room;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:META-INF/spring/applicationContext.xml")
@Transactional
public class TestHotel {

	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@PersistenceContext
	EntityManager em;

	public void testFind() throws Exception {
		Hotel hotel = Hotel.findHotel(1L);
		Assert.notNull(hotel, "hotel no find~");
		List<Room> rooms = hotel.findRooms(sdf.parse("2012-8-16"),
				sdf.parse("2012-8-16"));
		Assert.notNull(rooms, "rooms no find~");
		System.out.println(hotel.getRooms().size());
		System.out.println(rooms.size());
		System.out.println(hotel.getRooms());
	}

	/**
	 * 查询某酒店指定时间段内
	 * 房间价格
	 * @throws Exception
	 */
	public void testQuery() throws Exception {
		Assert.notNull(em);
		Date begin = sdf.parse("2012-8-16");
		Date end = sdf.parse("2012-8-31");
		/* 酒店 */
		Hotel hotel = em.find(Hotel.class, 1L);
		Assert.notNull(hotel);
		/* 该时间段内的价格 */
		TypedQuery<Price> pq = em.createQuery("SELECT o FROM Price o WHERE o.date BETWEEN :begin AND :end", Price.class);
		pq.setParameter("begin", begin).setParameter("end", end);
		List<Price> prices = pq.getResultList();
		/* 过滤后的价格 */
		List<Price> ps = new ArrayList<Price>();
		for (Price p : prices) {
			for (Room r : hotel.getRooms()) {
				if (r.getPrices().contains(p)) {
					ps.add(p);
					break;
				}
			}
		}
		
		System.out.println("hotel room size : " + hotel.getRooms().size());
		System.out.println(prices.size());
		System.out.println("ps size = " + ps.size());

	}
	
	@Test
	public void test3() throws Exception {
		Date begin = sdf.parse("2012-8-16");
		Date end = sdf.parse("2012-8-31");
		/* 酒店 */
		Hotel hotel = em.find(Hotel.class, 1L);
		List<Price> ps = hotel.queryPrice(begin, end);
		System.out.println(ps.size());
	}

}
