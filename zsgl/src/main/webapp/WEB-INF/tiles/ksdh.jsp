<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<%@ page trimDirectiveWhitespaces="true" %>
<div class="same_back">
	<div class="same_bt">
		<div class="same_title">桂林旅游·快速导航</div>
	</div>
	<div class="same_line" style="background: #f3f8fc;">
		<div class="txt">
			<table width="217" height="139" border="0" align="center"
				cellpadding="0" cellspacing="2" style="font-size: 14px;">
				
				<c:forEach begin="0" end="${fn:length(app.navMenus) / 2 }" step="1" var="i">
					<tr>
						<c:forEach items="${app.navMenus }" var="m" begin="${i * 2 }" end="${i * 2 + 1 }">
							<td align="right"><img src="${m.image }" width="23"
								height="12" /></td>
							<td><a href="${m.address }" target="_blank" class="news" title="${m.name }">${m.name }</a></td>
						</c:forEach>
					</tr>
				</c:forEach>
				
			</table>

		</div>
	</div>
</div>