<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="lvgl?type=${strategyType.id }"
		class="news">${strategyType.name }</a>
</div>
<!-- 分类开始 -->
<div class="lv_sos">
	<div class="lv_sos_bt">
		<form action="lvgl">	
			<table width="500" height="30" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td width="41" align="center">类型</td>
					<td width="72">
					<select name="type">
						<option value="0">请选择</option>
						<c:forEach items="${strategyTypes }" var="s">
							<option value="${s.id }" >${s.name }</option>
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
<!-- 分类结束 -->
<div class="same_list_back">
	<div class="same_list_title">${strategyType.name }</div>
	<div class="list_lv">
		<ul>
			<c:forEach items="${strategys }" var="s">
				<li><span class="dat">${s.updateTime }</span><a
					href="lvgl_xq?id=${s.id }" class="news">${s.name }</a><br /> <span
					class="font_hs"><html:out html="${s.content }" length="40" /><br />
				</span></li>
			</c:forEach>
		</ul>
	</div>
	<div class="pag">
		<span class="disabled">&lt; </span><a href="lvgl.html">首 页</a><a
			href="lvgl?page=${page.prev }">上一页</a>
		<c:forEach items="${page.pages }" var="p">
			<c:choose>
				<c:when test="${p == page.page }">
					<span class="current">${p }</span>
				</c:when>
				<c:otherwise>
					<a href="lvgl?page=${p }">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.page + 8 < page.last }">
			<c:out value="..."></c:out>
		</c:if>
		<a href="lvgl?page=${page.next }">下一页</a><a href="lvgl?page=${page.last }">尾页</a>
	</div>
</div>
