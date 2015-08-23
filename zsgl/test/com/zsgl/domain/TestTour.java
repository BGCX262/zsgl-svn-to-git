package com.zsgl.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:META-INF/spring/applicationContext.xml")
public class TestTour {
	
	@Test
	public void testFindTourType() {
		long ts = Tour.countTours();
		long os = OverseasTour.countOverseasTours();
		
		long ds = DiyTour.countDiyTours();
		long ms = MeetingTour.countMeetingTours();
		System.out.println(ts + "-" + os + "-" + ds + "-" + ms);
	}
}
