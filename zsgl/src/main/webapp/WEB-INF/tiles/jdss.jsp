<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="same_back">
	<div class="same_bt">
		<div class="same_title">
			<img src="image/sos.gif" style="" /> 景点搜索
		</div>
	</div>
	<div class="same_line">
		<div class="txt">
			<form action="/jd.html">
				<table width="220" height="172" border="0" align="right"
					cellpadding="0" cellspacing="0">
					<tr>
						<td height="25" colspan="6"><strong>按地域</strong></td>
					</tr>
					<c:forEach begin="0" end="${fn:length(app.scenicAddresses) / 3 }" var="i">
						<tr>
							<c:forEach items="${app.scenicAddresses }" begin="${i * 3 }" end="${i * 3 + 2 }" var="o">
								<td>&nbsp;</td>	
								<td><a onclick="return loadContent(this);" href="jd/address/${o.id }/1.html" title="${o.name }" class="news">${o.name }</a></td>
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
						<td colspan="5" align="center"><input name="content"
							type="text" id="textfield" size="25" /></td>
					</tr>
					<tr>
						<td height="34">&nbsp;</td>
						<td colspan="5" align="center"><input type="submit"
							 id="button" value=""
							style="background: url(image/sos_img.gif); width: 88px; height: 23px; border: none;" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

