<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>		
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="zzhulv"
		class="news">自助旅游</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">自助旅游</div>
	<div class="list_lv">
		<ul>
			<c:forEach items="${tours }" var="t">
				<li><span class="jg">￥${t.privilege }元起</span><a href="gllv_xq?id=${t.id }" class="news">${t.name }</a><br />
				<span class="font_hs">
				<html:out html="${t.plan }" length="20"/>
				...</span></li>			
			</c:forEach>
		</ul>
	</div>

	<div class="pag">
		<span class="disabled">&lt; </span><a href="zzhulv.html">首 页</a><a
			href="zzhulv?page=${page.prev }">上一页</a>
		<c:forEach items="${page.pages }" var="p">
			<c:choose>
				<c:when test="${p == page.page }">
					<span class="current">${p }</span>
				</c:when>
				<c:otherwise>
					<a href="zzhulv?page=${p }">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.page + 8 < page.last }">
			<c:out value="..."></c:out>
		</c:if>
		<a href="zzhulv?page=${page.next }">下一页</a><a href="zzhulv?page=${page.last }">尾页</a>
	</div>
</div>
