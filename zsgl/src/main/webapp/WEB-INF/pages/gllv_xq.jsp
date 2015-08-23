<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="javascript:history.go(-1)" class="news">${tour.type.name }</a>
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

<form action="yuding">
	<div class="same_list_back">
		<input name="id" value="${tour.id }" type="hidden"/>
		<div class="same_list_title">
			<c:out value="${tourType.name }" default="桂林旅游"/>
		</div>
		<div class=" lv_xq_title">${tour.name }</div>
	
		<div class="lv_xq_img">
			<img src="${tour.image }" width="270"/>
		</div>
	
		<div class="lv_xq_txt">
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="64" height="26" style="color: #F00;">门市价：</td>
					<td width="63" style="color: #900;">￥${tour.doorPrice }</td>
					<td width="51">&nbsp;</td>
					<td width="222">&nbsp;</td>
				</tr>
				<tr>
					<td height="25">优惠价：</td>
					<td style="color: #F30;">￥${tour.privilege }</td>
					<td>儿童价：</td>
					<td style="color: #F30;">￥${tour.children }</td>
				</tr>
				<tr>
					<td height="29">出发城市：</td>
					<td>${tour.startCity }</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td height="30">发团日期：</td>
					<td colspan="3">${tour.groupDate }</td>
				</tr>
				<tr>
					<td height="28">交通方式：</td>
					<td colspan="3">${tour.way }</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
	
			<input type="submit" id="button3" value=""
				style="background: url(image/bot.gif); width: 93px; height: 30px; border: none; cursor: pointer;">
	
		</div>
	
		<div class="lv_xq_cont">
			<div class="lv_xq_cont_bt">线路特色</div>
			<div class="cont_lv">${tour.feature }</div>
		</div>
		<div class="lv_xq_cont">
			<div class="lv_xq_cont_bt">行程安排</div>
			<div class="cont_lv">${tour.plan }</div>
		</div>
	</div>
</form>	