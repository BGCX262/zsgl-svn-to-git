package com.zsgl.controller;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.HandlerAdapter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/META-INF/spring/applicationContext.xml", "classpath*:webmvc-config.xml"})
public class URLTest extends AbstractTransactionalJUnit4SpringContextTests{
	
	MockHttpServletRequest request = new MockHttpServletRequest();
	
	MockHttpServletResponse response = new MockHttpServletResponse();
	
	HandlerAdapter adapater = new AnnotationMethodHandlerAdapter();
	
	ModelAndView mav;
	
	@Autowired
	JdjsController jdjsController;
	
	@Autowired
	GljdController gljdController;
	
	@Autowired
	GllvController gllvController;
	
	@Autowired
	LyglController lyglController;
	
	@Test
	public void test() {
		Assert.assertNotNull(jdjsController);
		Assert.assertNotNull(gljdController);
		Assert.assertNotNull(gllvController);
		Assert.assertNotNull(lyglController);
	}
	
}
