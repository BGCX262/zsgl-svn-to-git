<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="wz">
	您当前所在的位置：<a onclick="return loadPage(this);" href="index.html" class="news">首页</a>—<a onclick="return loadPage(this);" href="hy.html" class="news">会议场所</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">会议场所</div>
	<div class=" lv_xq_title">${meetingPlace.name }</div>
	<div class="lv_xq_cont">
		<div class="cont_lv">
			<c:out value="${meetingPlace.content }" escapeXml="false"/><br />
		</div>
	</div>
	<%--上下页 --%>
		<div class="sam_pag">
			<ul>
				<li>上一篇： 
					<c:choose>
						<c:when test="${prev != null }">
							<a onclick="return loadContent(this)" href="place/view/${prev.id }.html" class="news" title="${prev.name }">${fn:substring(prev.name, 0, 18) }</a>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
				</li>
				<li style="text-align: right;">下一篇：
					<c:choose>
						<c:when test="${next != null }">
							<a onclick="return loadContent(this)" href="place/view/${next.id }.html" class="news" title="${next.name }">${fn:substring(next.name, 0, 18) }</a>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>
</div>