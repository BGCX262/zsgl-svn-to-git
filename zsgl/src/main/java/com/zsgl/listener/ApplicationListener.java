package com.zsgl.listener;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.zsgl.preparer.AbstractPreparer;
import com.zsgl.util.Common;

public class ApplicationListener implements ServletContextListener {
	
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext context = sce.getServletContext(); 
		loadCommonnData(context);
		context.setAttribute("startTime", Common.accurateDateFormat.format(new Date(System.currentTimeMillis())));
		String filePath = context.getRealPath("404.html");
		context.setAttribute("WEBROOT", filePath.substring(0, filePath.length() - 9));
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
	
	/**
	 * 加载数据到ServletContext
	 * 假如数据发生改变可再次调用此方法进行刷新数据
	 * @param context
	 */
	public static void loadCommonnData(ServletContext context) {
		Map<String, Object> model = new HashMap<String, Object>();
		AbstractPreparer.fillAbout(model);
		AbstractPreparer.fillAccountType(model);
		AbstractPreparer.fillGlobalResource(model);
		AbstractPreparer.fillKsdh(model);
		AbstractPreparer.fillLink(model);
		AbstractPreparer.fillLxdh(model);
		AbstractPreparer.fillOrder(model);
		AbstractPreparer.fillOverseasCity(model);
		AbstractPreparer.fillScenicAddress(model);
		AbstractPreparer.fillSearch(model);
		AbstractPreparer.fillTjlx(model);
		model.put("updateTime", Common.accurateDateFormat.format(new Date(System.currentTimeMillis())));
		context.setAttribute("app", model);
	}

}

