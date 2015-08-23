package com.zsgl.interceptor;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.resource.DefaultServletHttpRequestHandler;

/**
 * 处理静态的html
 * 通过拦截所有的请求
 * 然后判断请求的uri是否包含.html
 * 如果包含，则在网站跟目录下寻找该文件
 * 如果找到直接返回，并返回false
 * 则不会再交给Controller处理
 * 如果为找到则返回true
 * 将请求交给Controller处理
 * @author 林超
 */
public class StaticInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	DefaultServletHttpRequestHandler defaultServlet;
	
	static final String HTML = ".html";
	
	static final String GET = "GET";
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getServletPath();
		if (uri.contains(HTML)) {
			File file = new File(request.getSession().getServletContext().getRealPath(uri));
			if (file.isFile() && request.getMethod().equals(GET)) {
				defaultServlet.handleRequest(request, response);
				file = null;
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}
	
}
