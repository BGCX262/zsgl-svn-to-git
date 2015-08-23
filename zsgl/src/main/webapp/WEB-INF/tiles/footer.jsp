<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ page trimDirectiveWhitespaces="true" %>
<%--底部 --%>
<div class="bottom_bakc">
	<div class="link">
		<strong>友情连接：</strong>
			<c:forEach items="${app.links }" var="l">
				<a href="${l.address }" class="news">${l.name }</a> 
			</c:forEach>
	</div>
	<div class="foot">
		${app.globalResource.foot }
	</div>
</div>