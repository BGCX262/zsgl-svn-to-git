<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!--内容块开始-->
<script src="js/dateBox.js" type="text/javascript"></script>
<div class="wza">
	您当前所在的位置：首页—<a href="" class="news">桂林旅游</a>
</div>
<form name="hotelydForm" action="hotelydForm" method="post">
	<input type="hidden" name="name" value="${hotel.name }" />
	<input type="hidden" name="price" value="${room.todayPrice }"/>
	<input type="hidden" name="orderState" value="3">
	<div class="yd_back">
		<table width="800" height="852" border="0" align="center"
			cellpadding="0" cellspacing="2" style="margin: 15px 0 0 35px;">
			<tr>
				<td height="57" colspan="3"><img src="image/yd_img.gif"
					width="910" height="22" /></td>
			</tr>
			<tr>
				<td height="44" colspan="3"><table width="400" height="54"
						border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="27" height="26"><img src="image/yd_ico.gif"
								width="18" height="16" /></td>
							<td width="373"><strong style="color: #900; font-size: 14px;">您预订的酒店:&nbsp;&nbsp;&nbsp;&nbsp;${hotel.name }</strong></td>
						</tr>
						<tr>
							<td height="28">&nbsp;</td>
							<td><strong style="color: #900; font-size: 14px;">客房信息</strong></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="31">入住房型：</td>
				<td colspan="2">
				<select name="room" id="select3">
					<c:forEach items="${hotel.rooms }" var="r">
						<c:choose>
							<c:when test="${r.id == room.id }">
								<option selected="selected" value="${r.id }">${r.name }</option>	
							</c:when>
							<c:otherwise>
								<option value="${r.id }">${r.name }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="113" height="50">入住日期：</td>
				<td width="224"><input name="enterDate" type="text" readonly="readonly" onclick="show_date_box(this)"
					id="textfield" size="20" /><span class="fong_yred">*</span></td>
				<td width="613">&nbsp;</td>
			</tr>
			<tr>
				<td width="113" height="51">离开日期：</td>
				<td colspan="2"><input name="leaveDate" type="text" readonly="readonly" onclick="show_date_box(this)"
					id="textfield4" size="20" /><span class="fong_yred">*</span></td>
			</tr>
			<tr>
				<td height="39">房间数量</td>
				<td colspan="2"><select name="num" id="select4">
					<c:forEach begin="1" end="50" var="i">
						<option value="${i }">${i }</option>					
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td height="29"><p>应付金额：</p></td>
				<td colspan="2"><strong style="color: #F60;" class="price" id="${room.privilege }">${room.privilege }</strong>(预订免费，入住后酒店前台付款)</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">
					<!-- 
					<table width="247" height="35" border="0"
						cellpadding="0" cellspacing="0"
						style="border: 1px solid #ccc; text-align: center;">
						<tr>
							<td width="245">07月11日（周三）￥60 早餐：无</td>
						</tr>
					</table>
					 -->
				</td>
			</tr>
			<tr>
				<td height="34" colspan="3"><table width="400" height="28"
						border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="27" height="28">&nbsp;</td>
							<td width="373"><strong style="color: #900; font-size: 14px;">入住信息</strong></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="34">联系人：</td>
				<td colspan="3"><input name="contact" type="text"
					id="textfield3" size="20" /> <select name="sex" id="select">
						<option value="男">男</option>
						<option value="女">女</option>
				</select> <span class="fong_yred">*</span></td>
			</tr>
			<tr>
				<td height="26">常用邮箱：</td>
				<td colspan="3"><input name="email" type="text"
					id="textfield5" size="30" /> <span class="fong_yred">*</span>
					<!-- Email与手机号码需填写一个做为会员账号  --></td>
			</tr>
			<tr>
				<td height="28">手机号码：</td>
				<td colspan="3"><input name="phone" type="text"
					id="textfield6" size="30" /> <span class="fong_yred">*</span></td>
			</tr>
			<tr>
				<td height="38">电话号码：</td>
				<td colspan="3"><input name="callPhone" type="text"
					id="textfield7" size="30" /> 手机号与电话号码需填写一个</td>
			</tr>
			<tr>
				<td height="33">QQ号码：</td>
				<td colspan="2"><input name="qq" type="text"
					id="textfield8" size="30" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td height="36">确认方式：</td>
				<td colspan="2"><select name="affirm" id="select2">
					<c:forEach items="${affirms }" var="a">
						<option value="${a.id }">${a.name }</option>				
					</c:forEach>
				</select></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td height="99">预定留言：</td>
				<td colspan="3"><textarea name="message" id="textarea"
						cols="45" rows="5"></textarea></td>
			</tr>
			<tr>
				<td height="27">&nbsp;</td>
				<td colspan="2" class="fong_yred">如果入住当天，不能在最晚保留时间前到店，请您事先联系酒店，协商房间的保留事宜，以免房间被过时取消。</td>
			</tr>
			<tr>
				<td height="27">&nbsp;</td>
				<td colspan="2">注：如需发票，请从酒店前台索取</td>
			</tr>
			<tr>
				<td height="61">&nbsp;</td>
				<td colspan="2"><input type="button" id="button"
					value="" onclick="hotel_check();"
					 style="background: url(image/tj.gif); width: 143px; height: 36px; border: none;" /></td>
			</tr>
			<tr>
				<td height="21" colspan="3">&nbsp;</td>
			</tr>
		</table>
	
	</div>
</form>
<!--内容块结束-->