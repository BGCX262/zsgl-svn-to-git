<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="same_back">
	<div class="same_bt">
		<div class="same_title">
			<img src="image/sos.gif" style="">线路导航
		</div>
	</div>
	<div class="same_line">
		<div class="txt">
			<form id="search" action="search/tour.html">
				<table width="220" border="0" align="right"
					cellpadding="0" cellspacing="0">
					<tr>
						<td height="25" colspan="6"><strong>按地域</strong></td>
					</tr>
					<%-- 路线地域导航 --%>
					<c:forEach begin="0" end="${fn:length(app.tourAddress) / 3 }"
						varStatus="s">
						<tr>
							<c:forEach items="${app.tourAddress}" var="t" begin="${s.index * 3 }" end="${s.index * 3 + 2 }">
								<td width="70" height="22" colspan="2"><a onclick="return loadContent(this);" href="ly/address/${t.id}/1.html" class="news" title="${t.name }">${t.name }</a></td>
							</c:forEach>
						</tr>
					</c:forEach>
	
					<tr>
						<td height="1" colspan="6"><img src="image/lx.gif" /></td>
					</tr>
					<tr>
						<td height="24" colspan="6"><strong>按类型</strong></td>
					</tr>
					<%-- 路线类型导航 --%>
					<c:forEach begin="0" end="${fn:length(app.tourTypes) / 3 }"
						varStatus="s">
						<tr>
							<c:forEach items="${app.tourTypes}" var="t" begin="${s.index * 3 }" end="${s.index * 3 + 2 }">
								<td height="22" colspan="2"><a onclick="return loadContent(this);" href="ly/type/${t.id }/1.html" class="news" title="${t.name }">${t.name }</a></td>
							</c:forEach>  
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6"><img src="image/lx.gif" /></td>
					</tr>
					<tr>
						<td height="24" colspan="6"><strong>按天数</strong></td>
					</tr>
					<%-- 路线天数导航 --%>
					<c:forEach begin="0" end="${fn:length(app.tourDays) / 3 }"
						varStatus="s">
						<tr>
							<c:forEach items="${app.tourDays}" var="t" begin="${s.index * 3 }" end="${s.index * 3 + 2 }">
								<td></td>
								<td height="22"><a onclick="return loadContent(this);" href="ly/day/${t.id}/1.html" class="news" title="${t.name }">${t.name }</a></td>
							</c:forEach>  
						</tr>
					</c:forEach>
					
					<tr>
						<td height="1" colspan="6"><img src="image/lx.gif" /></td>
					</tr>
					<tr>
						<td height="1" colspan="6"><img src="image/lx.gif" /></td>
					</tr>
					<tr>
						<td height="26" colspan="6"><strong>输入关键字</strong></td>
					</tr>
					<tr>
						<td height="27">&nbsp;</td>
						<td colspan="5" align="center"><input name="q"
							type="text" id="textfield" size="25" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="5" align="center"><input type="submit"
							 id="button" value=""
							 style="background: url(image/sos_img.gif); width: 88px; height: 23px; border: none; cursor: pointer;"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="5" align="center">&nbsp;</td>
					</tr>
				</table>
			</form>				
		</div>
	</div>
</div>
<hr />
<%--后来加的  --%>
<div class="same_back">
	<div class="same_bt">
		<div class="same_title">
			<img src="image/sos.gif" style=""> 酒店导航
		</div>
	</div>
	<div class="same_line">
		<div class="txt">
			<form action="search/hotel.html">
				<table width="220" border="0" align="right"
						cellpadding="0" cellspacing="0">
					<tr>
						<td height="23" colspan="6"><strong>按地区</strong></td>
					</tr>
					
					<c:forEach begin="0" end="${fn:length(app.hotelAddress) / 3 }"
						varStatus="s">
						<tr>
							<c:forEach items="${app.hotelAddress}" var="t" begin="${s.index * 3 }" end="${s.index * 3 + 2 }">
								<td width="75" colspan="2" height="22"><a onclick="return loadContent(this);" href="hotel/city/${t.id }/1.html" title="${t.name }" class="news">${t.name }</a></td>
							</c:forEach>  
						</tr>
					</c:forEach>
					
					<tr>
						<td height="1" colspan="6"><img src="image/lx.gif" /></td>
					</tr>
					<tr>
						<td colspan="6"><strong>按星级</strong></td>
					</tr>
					
					<c:forEach begin="0" end="${fn:length(app.hotelLevels) / 3 }"
						varStatus="s">
						<tr>
							<c:forEach items="${app.hotelLevels}" var="t" begin="${s.index * 3 }" end="${s.index * 3 + 2 }">
								<td></td>	
								<td width="75" height="22"><a onclick="return loadContent(this);" href="hotel/level/${t.id }/1.html" title="${t.name }" class="news">${t.name }</a></td>
							</c:forEach>  
						</tr>
					</c:forEach>
					
					<tr>
						<td height="1" colspan="6"><img src="image/lx.gif" /></td>
					</tr>
					<tr>
						<td height="26" colspan="6"><strong>输入关键字</strong></td>
					</tr>
					<tr>
						<td height="27">&nbsp;</td>
						<td colspan="5" align="center"><input name="q"
							type="text" id="textfield" size="25" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="5" align="center"><input type="submit"
							 id="button" value=""
							 style="background: url(image/sos_img.gif); width: 88px; height: 23px; border: none; cursor: pointer;"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="5" align="center">&nbsp;</td>
					</tr>
				</table>
			</form>
		</div>	
	</div>	
</div>	