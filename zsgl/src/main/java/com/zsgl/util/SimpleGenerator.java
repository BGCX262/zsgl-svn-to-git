package com.zsgl.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class SimpleGenerator implements Generator {

	@Override
	public void GenerationPage(HttpServletRequest request,
			HttpServletResponse response, String uri, File file)
			throws Exception {
		GenerationPage(request, response, uri, file, "UTF-8");
	}
	
	@Override
	public void GenerationPage(HttpServletRequest request,
			HttpServletResponse response, String uri, File file, String encoding)
			throws Exception {
		RequestDispatcher rd = request.getRequestDispatcher(uri);
		final ByteArrayOutputStream os = new ByteArrayOutputStream();
		final ServletOutputStream stream = new ServletOutputStream() {
			public void write(byte[] data, int offset, int length) {
				os.write(data, offset, length);
			}
			public void write(int b) throws IOException {
				os.write(b);
			}
		};
		final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os, encoding));
		HttpServletResponse rep = new HttpServletResponseWrapper(response) {
			public ServletOutputStream getOutputStream() {
				return stream;
			}
			public PrintWriter getWriter() {
				return pw;
			}
		};
		rd.include(request, rep);
		pw.flush();
		FileOutputStream fos = new FileOutputStream(file);
		os.writeTo(fos);
		fos.close();
	}

}
