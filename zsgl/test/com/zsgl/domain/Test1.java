package com.zsgl.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import junit.framework.TestCase;

import org.junit.Test;

public class Test1 extends TestCase {
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00.0");
	
	@Test
	public void testDate() throws Exception {
		System.out.println(sdf.format(new Date()));
		System.out.println(sdf.parse(sdf.format(new Date())));
		System.out.println(new Date(System.currentTimeMillis()));
	}
	
}
