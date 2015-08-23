<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
int port = request.getLocalPort();
//8080
//String basePath = request.getScheme() + "://" + request.getServerName() + ":" + port + path+"/";
//80
String basePath = request.getScheme() + "://" + request.getServerName() + path+"/";
//String basePath = "http://www.glsits.com/";

%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<spring:url value="/css/stly.css" var="css"></spring:url>
<base href="<%=basePath %>" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" media="all" href="${css }" />
<%-- ${globalResource.seo } --%>

<c:if test="${keywords == null }">
	<c:set var="keywords" value="${app.globalResource.keywords }"/>
</c:if>
<c:if test="${description == null }">
	<c:set var="description" value="${app.globalResource.description }"/>
</c:if>
<c:choose>
	<c:when test="${title == null }">
		<c:set var="title" value="${app.globalResource.title }"/>
	</c:when>
	<c:otherwise>
		<c:set var="title" value="${title }_${typeName }_${app.globalResource.title }"/>
	</c:otherwise>
</c:choose>

<meta name="keywords" content="${keywords }" />
<meta name="description" content="${description }" />
<title>${title }</title>
</head>
<body>
<div style="background:white; width:1000px; height:1000px;; margin:0px auto;">
	<%--头部开始 --%>
	<tiles:insertAttribute name="header" />
	<%--头部结束 --%>

	<%--内容块开始 --%>
	<div class="main_back" id="main_back">
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
	</div>
	<%--内容块结束 --%>
	<%--底部开始 --%>
	<tiles:insertAttribute name="footer" />
	<%--底部结束 --%>
</div>
<%--scripts 
<spring:url value="/js/zsgl.js" var="zsgl_js" />
<spring:url value="/js/plug-in.js" var="pulg_in_js" />
<spring:url value="/js/fast.js" var="fast_js" />
<spring:url value="/js/jquery.address-1.4.min.js" var="jquery_address_js" />
<spring:url value="/js/dateBox.js" var="dateBox_js" />
<script type="text/javascript" src="${zsgl_js }"></script>
<script type="text/javascript" src="${pulg_in_js }"></script>
<script type="text/javascript" src="${jquery_address_js }"></script>
<script type="text/javascript" src="${fast_js }"></script>
<script type="text/javascript" src="${dateBox_js }"></script>
--%>
<spring:url value="/js/zs.js" var="zsgl_js" />
<script type="text/javascript" src="${zsgl_js }"></script>
${app.globalResource.script }   
</body>
</html>
