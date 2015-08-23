<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a onclick="return loadPage(this);" href="index.html" class="news">首页</a>—<a onclick="return loadContent(this);" href="gl/1.html"
		class="news">旅游攻略</a>
</div>
<!-- 分类开始 -->
<div class="lv_sos">
	<div class="lv_sos_bt">
		<%-- 
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
		 --%>
		<div style="margin-top:7px;"><span style="font-size: 14px;" class="news">筛选：</span>
			<c:forEach items="${strategyTypes }" var="s" varStatus="vs">
				<a onclick="return loadContent(this);" href="gl/type/${s.id }/1.html" class="news" style="width: 73px; font-size: 14px;">${s.name }</a>
				<c:if test="${vs.index < fn:length(strategyTypes) - 1 }">
					<c:out value="&nbsp;&nbsp;|&nbsp;&nbsp;" escapeXml="false"/>
				</c:if> 
			</c:forEach>
		</div> 	
	</div>
</div>
<!-- 分类结束 -->
<div class="same_list_back">
	<div class="same_list_title"><c:out value="${typeName }" default="旅游攻略"/></div>
	<div class="list_lv">
		<ul>
			<c:forEach items="${strategys }" var="s">
				<li><span class="dat">${fn:substring(s.updateTime,0,10) }</span><a
					onclick="return loadContent(this);" href="gl/view/${s.id }.html" class="news">${s.name }</a><br /> <span
					class="font_hs"><html:out html="${s.content }" length="200" /><br />
				</span></li>
			</c:forEach>
		</ul>
	</div>
	<div class="pag">
		<span class="disabled">&lt; </span><a onclick="return loadContent(this);" href="${GL_PATH }1.html">首 页</a><a
			onclick="return loadContent(this);" href="${GL_PATH }${page.prev }.html">上一页</a>
		<c:forEach items="${page.pages }" var="p">
			<c:choose>
				<c:when test="${p == page.page }">
					<span class="current">${p }</span>
				</c:when>
				<c:otherwise>
					<a onclick="return loadContent(this);" href="${GL_PATH }${p }.html">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.page + 8 < page.last }">
			<c:out value="..."></c:out>
		</c:if>
		<a onclick="return loadContent(this);" href="${GL_PATH }${page.next }.html">下一页</a><a onclick="return loadContent(this);" href="${GL_PATH }${page.last }.html">尾页</a>
	</div>
</div>
