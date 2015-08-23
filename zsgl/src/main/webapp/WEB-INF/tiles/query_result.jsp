<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:forEach items="${hotel.rooms }" var="r">
	房型：${r.name } <br/>
	&nbsp;&nbsp;<label style="width:100px;">日期</label><label style="width:100px; margin-left:20px;">价格</label><br/>
	<c:forEach items="${prices }" var="p">
		<c:if test="${p.room == r }">
			&nbsp;&nbsp;<label style="width:100px;">${fn:substring(p.date, 0, 10) }</label><label style="width:100px; margin-left:20px;">${p.price }</label><br/>
		</c:if>
	</c:forEach>
</c:forEach>

