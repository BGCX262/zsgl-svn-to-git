<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%--内容块开始 --%>
<tiles:useAttribute id="left" name="left" classname="java.util.List" />
<c:choose>
	<c:when test="${fn:length(left) > 0 }">
		<div id="left_bakc">
			<c:forEach items="${left }" var="item">
				<tiles:insertAttribute value="${item }" />
			</c:forEach>
		</div>
		<div id="right_back">
			<tiles:insertAttribute name="body" />
		</div>
	</c:when>
	<c:otherwise>
		<tiles:insertAttribute name="main" />
	</c:otherwise>
</c:choose>
<%--内容块结束 --%>