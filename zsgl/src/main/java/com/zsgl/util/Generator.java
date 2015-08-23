package com.zsgl.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 静态页面生成器，用来生成静态页面
 * 通常情况下将一个伪静态的地址，生成一个真实的文件
 * 通常生成静态文件，可以减轻服务的负担
 * @author 林超
 */
public interface Generator {
	
	void GenerationPage(HttpServletRequest request, HttpServletResponse response, String uri, File file) throws Exception;
	
	void GenerationPage(HttpServletRequest request, HttpServletResponse response, String uri, File file, String encoding) throws Exception;
	
}
