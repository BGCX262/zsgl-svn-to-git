<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="same_back">
	<div class="same_bt">
		<div class="same_title">
			<a onclick="return loadContent(this);" href="ly/1.html" onmousemove="show_tour();" class="bt" title="推荐路线">推荐热门线路</a> <img src="image/bt_lis.gif"
				align="absmiddle"><a onclick="return loadContent(this);" href="hotel/1.html" onmousemove="show_hotel()" class="bt" title="推荐酒店"> 酒店</a>
		</div>
	</div>
	<div class="same_line">
		<div class="txt">
			<div class="left_list">
				<%--推荐路线 --%>
				<ul id="tz_tour">
					<c:forEach items="${app.ctours }" var="o">
						<li><a onclick="return loadContent(this);" href="ly/view/${o.id }.html" class="news" title="${o.name }">
							<c:choose>
								<c:when test="${fn:length(o.name) > 15 }">
									<c:out value="${fn:substring(o.name, 0, 14) }..."/>
								</c:when>
								<c:otherwise>
									<c:out value="${o.name }"/>
								</c:otherwise>
							</c:choose>
							</a></li>
					</c:forEach>					
				</ul>
				<%--推荐酒店 --%>
				<ul id="tz_hotel" style="display: none;">
					<c:forEach items="${app.chotels }" var="o">
						<li><a onclick="return loadContent(this);" href="hotel/view/${o.id }.html" class="news" title="${o.name }">
							<c:choose>
								<c:when test="${fn:length(o.name) > 15 }">
									<c:out value="${fn:substring(o.name, 0, 14) }..."/>
								</c:when>
								<c:otherwise>
									<c:out value="${o.name }"/>
								</c:otherwise>
							</c:choose>
							</a></li>
					</c:forEach>					
				</ul>
				
			</div>
		</div>
	</div>
</div>