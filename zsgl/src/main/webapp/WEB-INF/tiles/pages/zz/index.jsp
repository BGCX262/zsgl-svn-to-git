<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>		
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a onclick="return loadPage(this);" href="index.html" class="news">首页</a>—<a onclick="return loadPage(this);" href="zz.html" class="news">自助旅游</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">自助旅游</div>
	<div class="list_lv">
		<ul>
			<c:forEach items="${tours }" var="t">
				<li><span class="jg">￥${t.privilege }元起</span><a href="ly/view/${t.id }.html" class="news">${t.name }</a><br />
				<span class="font_hs">
				<html:out html="${t.plan }" length="200"/>
				...</span></li>			
			</c:forEach>
		</ul>
	</div>

	<div class="pag">
		<span class="disabled">&lt; </span><a href="${ZZ_PATH }1.html">首 页</a><a
			href="${ZZ_PATH }${page.prev }.html">上一页</a>
		<c:forEach items="${page.pages }" var="p">
			<c:choose>
				<c:when test="${p == page.page }">
					<span class="current">${p }</span>
				</c:when>
				<c:otherwise>
					<a href="${ZZ_PATH }${p }.html">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.page + 8 < page.last }">
			<c:out value="..."></c:out>
		</c:if>
		<a href="${ZZ_PATH }${page.next }.html">下一页</a><a href="${ZZ_PATH }${page.last }.html">尾页</a>
	</div>
</div>
