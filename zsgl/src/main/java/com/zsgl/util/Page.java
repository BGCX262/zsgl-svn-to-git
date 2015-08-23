package com.zsgl.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.roo.addon.javabean.RooJavaBean;

@RooJavaBean
public class Page {

	private List<Integer> pages;

	private int page;

	private int count;

	private int prev;

	private int next;

	private int first;

	private int last;

	private int maxResult;

	public Page(int count, int page, int maxResult) {
		this.count = count;
		this.page = page;
		this.maxResult = maxResult;
		calePage();
		calePages(4, 8);
	}

	private void calePage() {
		last = count % maxResult == 0 ? count / maxResult : count / maxResult
				+ 1;
		last = last < 1 ? 1 : last;
		prev = page > 1 && page <= last ? page - 1 : 1;
		next = page > 0 && page < last ? page + 1 : 1;
		first = (page - 1) * maxResult;
	}

	public Page calePages(int position, int length) {
		pages = new ArrayList<Integer>();
		int start = page - position;
		start = start < 1 ? 1 : start;
		for (int i = start; i < start + length; i++) {
			if (i > 0 && i <= last) {
				pages.add(i);
			}
		}
		return this;
	}
	
	public static void main(String[] args) {
		Page p = new Page(5600, 10, 10);
		p.calePages(3, 7);
		System.out.println(p.last);
		System.out.println(p.pages);
	}

}
