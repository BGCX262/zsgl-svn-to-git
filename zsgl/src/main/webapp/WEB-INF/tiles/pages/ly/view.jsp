<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%--设置标题 --%>
<script>if(typeof(setTitle) != "undefined") setTitle("${tour.name}");</script>
<div class="wz">
	您当前所在的位置：<a onclick="return loadPage(this);" href="index.html" class="news">首页</a>—<a onclick="return loadContent(this);" href="ly/type/${tour.type.id }/1.html" class="news">${tour.type.name }</a>
</div>
<form action="yuding">
	<div class="same_list_back">
		<input name="id" value="${tour.id }" type="hidden"/>
		<div class="same_list_title">
			<c:out value="${tourType.name }" default="桂林旅游"/>
		</div>
		<div class=" lv_xq_title">${tour.name }</div>
	
		<div class="lv_xq_img">
			<img src="${tour.image }" width="270"/>
		</div>
	
		<div class="lv_xq_txt">
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="64" height="26" style="color: #F00;">门市价：</td>
					<td width="63" style="color: #900;">￥${tour.doorPrice }</td>
					<td width="51">&nbsp;</td>
					<td width="222">&nbsp;</td>
				</tr>
				<tr>
					<td height="25">优惠价：</td>
					<td style="color: #F30;">￥${tour.privilege }</td>
					<td>儿童价：</td>
					<td style="color: #F30;">￥${tour.children }</td>
				</tr>
				<tr>
					<td height="29">出发城市：</td>
					<td>${tour.startCity }</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td height="30">发团日期：</td>
					<td colspan="3">${tour.groupDate }</td>
				</tr>
				<tr>
					<td height="28">交通方式：</td>
					<td colspan="3">${tour.way }</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
	
			<input type="submit" id="button3" value=""
				style="background: url(image/bot.gif); width: 93px; height: 30px; border: none; cursor: pointer;">
		</div>
		<div class="lv_xq_cont">
			<div class="lv_xq_cont_bt">线路特色</div>
			<div class="cont_lv">${tour.feature }</div>
		</div>
		<div class="lv_xq_cont">
			<div class="lv_xq_cont_bt">行程安排</div>
			<div class="cont_lv">${tour.plan }</div>
		</div>
		<%--上下页 --%>
		<div class="sam_pag">
			<ul>
				<li>上一篇： 
					<c:choose>
						<c:when test="${prev != null }">
							<a onclick="return loadContent(this)" href="ly/view/${prev.id }.html" class="news" title="${prev.name }">${fn:substring(prev.name, 0, 18) }</a>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
				</li>
				<li style="text-align: right;">下一篇：
					<c:choose>
						<c:when test="${next != null }">
							<a onclick="return loadContent(this)" href="ly/view/${next.id }.html" class="news" title="${next.name }">${fn:substring(next.name, 0, 18) }</a>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>
		
	</div>
</form>