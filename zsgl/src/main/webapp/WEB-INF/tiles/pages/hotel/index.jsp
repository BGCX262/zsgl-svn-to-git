<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>	
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a onclick="return loadPage(this);" href="index.html" class="news">首页</a>—<a onclick="return loadContent(this);" href="${HOTEL_PATH }1.html" class="news"><c:out value="${typeName }" default="桂林酒店"/></a>
</div>
<%-- 
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
########
<div class="lv_sos">
	<div class="lv_sos_bt">
		<div>
			<h3 class="l_float" style="font-weight: bold;font-size: 14px;">星级：</h3>
			<ul class="l_float">
				<c:forEach items="${hotelLevels }" var="l">
					<li class="l_float" style="width: 48px; font-size:14px;"><a href="hotel/level/${l.id}/1.html" title="${l.name }" class="news">${l.name }</a></li>
				</c:forEach>
			</ul>
		</div><br/><br/>
		<div>
			<h3 class="l_float" style="font-weight: bold;font-size: 14px;">地域：</h3>
			<ul class="l_float">
				<c:forEach items="${hotelAddress }" var="a">
					<li class="l_float" style="width: 55px; font-size:14px;"><a href="hotel/city/${a.id}/1.html" class="news t_font" title="${a.name }">${a.name }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
--%>
<div class="same_list_back">
	<div class="same_list_title">
		<c:out value="${typeName }" default="桂林酒店"/>
	</div>
	<div class="hotel_list">
		<ul>
			<c:forEach items="${hotels }" var="h">
				<li><span><strong style="font-size: 14px; color: #F60;">${h.name }</strong><br />周边景点：${h.attractons }<br />
					酒店地址：${h.address.name }<br />
					介绍：<html:out html="${h.remark }" length="300"/>  <br /> <a onclick="return loadContent(this);" href="hotel/view/${h.id }.html" class="xq">[查看详情]</a>
					<a href="hotel/view/${h.id }.html#room"><img src="image/yd.gif" align="absmiddle" /></a></span><a onclick="return loadContent(this);" href="hotel/view/${h.id }.html"><img
					src="${h.image }" width="204"
						 style="margin: 5px; padding: 1px; border: 1px solid #ccc;"></a></li>			
			</c:forEach>
		</ul>
	</div>

	<div class="pag">
		<span class="disabled">&lt; </span><a onclick="return loadContent(this);" href="${HOTEL_PATH }1.html" title="第一页">首 页</a><a
			onclick="return loadContent(this);" href="${HOTEL_PATH }${page.prev }.html" title="上一页">上一页</a>
		<c:forEach items="${page.pages }" var="p">
			<c:choose>
				<c:when test="${p == page.page }">
					<span class="current" title="当前页">${p }</span>
				</c:when>
				<c:otherwise>
					<a onclick="return loadContent(this);" href="${HOTEL_PATH }${p }.html" title="第${p }页">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.page + 8 < page.last }">
			<c:out value="..."></c:out>
		</c:if>
		<a onclick="return loadContent(this);" href="${HOTEL_PATH }${page.next }.html" title="下一页">下一页</a><a onclick="return loadContent(this);" href="${HOTEL_PATH }${page.last }.html" title="最后一页">尾页</a>
	</div>
</div>