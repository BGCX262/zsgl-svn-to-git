<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>	
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="hotel" class="news">
		桂林酒店
		</a>
</div>

<div class="lv_sos">
	<div class="lv_sos_bt">
		<form action="search/hotel">
			<input type="hidden" name="content" value="">
			<table width="500" height="30" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td width="41" align="center">星级</td>
					<td width="72">
					<select name="hotelLevel">
						<option value="0">请选择</option>
						<c:forEach items="${hotelLevels }" var="l">
							<option value="${l.id }">${l.name }</option>
						</c:forEach>
					</select></td>
					<td width="46" align="center">地区</td>
					<td width="82">
					<select name="hotelAddress">
						<option value="0">请选择</option>
						<c:forEach items="${hotelAddress }" var="a">
							<option value="${a.id }">${a.name }</option>
						</c:forEach>	
					</select></td>
					<td width="225"><input type="submit"
						 value=""
						 style="background: url(image/so_ico.gif); width: 47px; height: 19px; border: none;"></td>
				</tr>
			</table>
		</form>
	</div>
</div>

<div class="same_list_back">
	<div class="same_list_title">
		桂林酒店
	</div>
	<div class="hotel_list">
		<ul>
			<c:forEach items="${hotels }" var="h">
				<li><span><strong style="font-size: 14px; color: #F60;">${h.name }</strong><br />周边景点：${h.attractons }<br />
					酒店地址：${h.address.name }<br />
					介绍：<html:out html="${h.remark }" length="300"/>  <br /> <a href="hotel_xq?id=${h.id }" class="xq">[查看详情]</a>
					<a href="hotel_xq?id=${h.id }#room"><img src="image/yd.gif" align="absmiddle" /></a></span><a href="hotel_xq?id=${h.id }"><img
					src="${h.image }" width="204"
						 style="margin: 5px; padding: 1px; border: 1px solid #ccc;"></a></li>			
			</c:forEach>
		</ul>
	</div>

	<div class="pag">
		<span class="disabled">&lt; </span><a href="hotel.html">首 页</a><a
			href="hotel?page=${page.prev }">上一页</a>
		<c:forEach items="${page.pages }" var="p">
			<c:choose>
				<c:when test="${p == page.page }">
					<span class="current">${p }</span>
				</c:when>
				<c:otherwise>
					<a href="hotel?page=${p }">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.page + 8 < page.last }">
			<c:out value="..."></c:out>
		</c:if>
		<a href="hotel?page=${page.next }">下一页</a><a href="hotel?page=${page.last }">尾页</a>
	</div>
</div>