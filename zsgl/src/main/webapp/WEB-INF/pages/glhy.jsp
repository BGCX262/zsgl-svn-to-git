<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="html" uri="/html"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="glhy"
		class="news">会议服务</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">会议服务</div>
	<div class="lv_xq_cont" style="line-height: 25px;">
		${service.content }</div>
</div>
<div class="same_list_back">
	<div class="same_list_title">成功案例</div>
	<div class="hy_al">
		<ul>
			<c:forEach items="${cases }" var="c">
				<li><a href="case?id=${c.id }" class="news">${c.name }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="same_list_back">
	<div class="same_list_title">会议场所</div>
	<c:forEach items="${meetingPlaces }" var="p">
		<div class="same_hy">
			<div class="cs_img">
				<a href="place?id=${p.id }"><img src="${p.image }" width="90" height="75"/></a>
			</div>
			<div class="cs_cont">
				<strong>${p.name }</strong><br />
				<html:out html="${p.content }" length="30" />
				<br />
			</div>
		</div>
	</c:forEach>
</div>
<div class="same_list_back">
	<div class="same_list_title">会议旅游</div>
	<div class="hy_lv">
		<ul>
			<c:forEach items="${meetingTours }" var="t">
				<li><span>￥${t.privilege } </span><a href="gllv_xq?id=${t.id }"
					class="news">${fn:substring(t.name, 0, 18) }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="same_list_back">
	<div class="same_list_title">会议酒店</div>
	<c:forEach items="${meetingHotels }" var="h">
		<div class="same_hy">
			<div class="cs_img">
				<a href="hotel_xq?id=${h.id }"><img src="${h.image }" width="90" height="75" /></a>
			</div>
			<div class="cs_cont">
				<strong>${h.name }</strong><br /> <a href="hotel_xq?id=${h.id }" class="news">
					<html:out html="${h.remark }" length="40" />...
				</a><br />
			</div>
		</div>
	</c:forEach>
</div>