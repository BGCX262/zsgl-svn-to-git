<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="same_back">
	<div class="same_bt">
		<div class="same_title">交易订单</div>
	</div>
	<div class="same_line">
		<div class="txt">
			<div class="left_list">
				<ul>
					<c:forEach items="${app.orders }" var="o">
						<li><a href="#${o.id }" class="news"> <c:choose>
									<c:when test="${o.sex == '男' }">
										<html:out html="${o.name }" length="13" />
										<html:out html="${o.contact }" length="1" />先生
									</c:when>
									<c:otherwise>
										<html:out html="${o.name }" length="13" />
										<html:out html="${o.contact }" length="1" />小姐
									</c:otherwise>
								</c:choose>
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>