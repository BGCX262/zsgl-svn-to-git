<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>	
<%@ page trimDirectiveWhitespaces="true" %>	
<div class="wz">
	您当前所在的位置：<a onclick="return loadPage(this);" href="index.html" class="news">首页</a>—<a onclick="return loadPage(this);" href="jd.html"
		class="news" title="景点介绍">景点介绍</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">景点介绍</div>
	<div class="hotel_list">
		<ul>
			<c:forEach items="${scenics }" var="s">
				<li><span><strong style="font-size: 14px; color: #F60;">${s.name }</strong><br />
					景点地区：${s.address.name } 门票：${s.doorPrice }元<br /> 体力强度： ${s.strength.name }<br />
					介绍：<html:out html="${s.content }" length="150"/>  <a onclick="return loadContent(this);" href="jd/view/${s.id }.html"
					class="xq" title="点击查看详情">[查看详情]</a></span><a onclick="return loadContent(this);" href="jd/view/${s.id }.html" title="${s.name }"><img src="${s.image }" width="204"
					 style="margin: 5px; padding: 1px; border: 1px solid #ccc;"></a></li>
			</c:forEach>
		</ul>
	</div>

	<%--页码 --%>
	<div class="pag">
		<span class="disabled">&lt; </span><a onclick="return loadContent(this);" href="${JD_PATH }1.html?content=${param.content}" title="首页">首 页</a><a
			onclick="return loadContent(this);" href="${JD_PATH }${page.prev }.html?content=${param.content}" title="上一页">上一页</a>
		<c:forEach items="${page.pages }" var="p">
			<c:choose>
				<c:when test="${p == page.page }">
					<span class="current" title="当前页">${p }</span>
				</c:when>
				<c:otherwise>
					<a onclick="return loadContent(this);" href="${JD_PATH }${p }.html?content=${param.content}" title="第${p }页">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.page + 8 < page.last }">
			<c:out value="..."></c:out>
		</c:if>
		<a onclick="return loadContent(this);" href="${JD_PATH }${page.next }.html?content=${param.content}" title="下一页">下一页</a><a onclick="return loadContent(this);" href="${JD_PATH }${page.last }.html?content=${param.content}" title="最后一页">尾页</a>
	</div>
</div>
