<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="gllv" class="news">
		<c:out value="${tType.name }" default="桂林旅游"/> </a>
</div>

<div class="lv_sos">
	<div class="lv_sos_bt">
		<form action="search/tour">
			<input type="hidden" name="content" value="">
			<table width="725" height="30" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td width="41" align="center">地域</td>
					<td width="72">
					<select name="tourAddress">
						<option value="0">请选择</option>
						<c:forEach items="${tourAddress }" var="ta">
							<option value="${ta.id }">${ta.name }</option>					
						</c:forEach>
					</select></td>
					<td width="46" align="center">类型</td>
					<td width="82">
					<select name="tourType">
						<option value="0">请选择</option>
						<c:forEach items="${tourTypes }" var="tt">
							<option value="${tt.id }">${tt.name }</option>
						</c:forEach>
					</select></td>
					<td width="47" align="center">天数</td>
					<td width="77">
					<select name="tourDay">
						<option value="0">请选择</option>
						<c:forEach items="${tourDays }" var="td">
							<option value="${td.id }">${td.name }</option>					
						</c:forEach>
					</select></td>
					<td width="225"><input type="submit" value=""
						style="background: url(image/so_ico.gif); width: 47px; height: 19px; border: none;"></td>
				</tr>
			</table>
		</form>
	</div>
</div>

<div class="same_list_back">
	<div class="same_list_title">
		<c:out value="${tType.name }" default="桂林旅游"/>
	</div>
	<div class="list_lv">
		<ul>
			<c:forEach items="${tours }" var="t">
				<li><span class="jg">￥${t.privilege }元起</span><a
					href="gllv_xq?id=${t.id }" class="news">${t.name }</a><br /> <span
					class="font_hs">&nbsp;<html:out html="${t.plan }"
							length="30" /></span></li>
			</c:forEach>
		</ul>
	</div>
</div>