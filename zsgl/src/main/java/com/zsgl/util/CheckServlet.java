package com.zsgl.util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckServlet
 */
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRight = false;
		String client = request.getParameter("client").toUpperCase();
		Object o = request.getSession().getAttribute("rand");
		if(o != null && client != null) {
			String rand = (String)o;
			if(rand.equals(client)){
				isRight = true;
			}
		}
		if(isRight) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("-1");
		}
	}

}
