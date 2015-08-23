package com.zsgl.util;

import java.util.Random;

import org.junit.Test;

public class GeneratorTest {
	
	static final Generator gen = new SimpleGenerator();
	static final Random ran = new Random(99999999);
	
	public String randFile() {
		return "z:/temp/" + ran.nextLong() + ".html";
	}
	
	@Test
	public void testGenerator1() throws Exception {
	}
	
	@Test
	public void testGenerator2() throws Exception {
	}
	
	@Test
	public void testGenerator3() throws Exception {
	}
	
}
