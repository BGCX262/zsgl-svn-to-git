<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>	
<%@ page trimDirectiveWhitespaces="true" %>	
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="jingdian"
		class="news">景点介绍</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">景点介绍</div>
	<div class="hotel_list">
		<ul>
			<c:forEach items="${scenics }" var="s">
				<li><span><strong style="font-size: 14px; color: #F60;">${s.name }</strong><br />
					景点地区：${s.address.name } 门票：${s.doorPrice }元<br /> 体力强度： ${s.strength.name }<br />
					介绍：<html:out html="${s.content }" length="40"/>  <a href="jingd_xq?id=${s.id }"
					class="xq">[查看详情]</a></span><a href="jingd_xq?id=${s.id }"><img src="${s.image }" width="204"
					 style="margin: 5px; padding: 1px; border: 1px solid #ccc;"></a></li>
			</c:forEach>
		</ul>
	</div>

	
	<c:if test="${uri == null }">
		<c:set var="uri" value="jingdian?"></c:set>
	</c:if>
	
	
	<div class="pag">
		<span class="disabled">&lt; </span><a href="jingdian">首 页</a><a
			href="${uri }${page.prev }">上一页</a>
		<c:forEach items="${page.pages }" var="p">
			<c:choose>
				<c:when test="${p == page.page }">
					<span class="current">${p }</span>
				</c:when>
				<c:otherwise>
					<a href="${uri }page=${p }">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.page + 8 < page.last }">
			<c:out value="..."></c:out>
		</c:if>
		<a href="${uri }page=${page.next }">下一页</a><a href="${uri }page=${page.last }">尾页</a>
	</div>
</div>
