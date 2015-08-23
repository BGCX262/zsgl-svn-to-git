<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ page trimDirectiveWhitespaces="true" %>
<script src="js/dateBox.js" type="text/javascript"></script>
<div class="yd_back">
	<form action="yudingForm" method="post">
		<input type="hidden" name="tour" value="${tour.id }" >
		<input type="hidden" name="name" value="${tour.name }">
		<input type="hidden" name="price" value="0">
		<input type="hidden" name="orderState" value="3">
		<table width="800" height="727" border="0" align="center"
			cellpadding="0" cellspacing="2" style="margin: 15px 0 0 35px; float:left">
			<tr>
				<td height="57" colspan="4"><img src="image/yd_img.gif"
					width="910" height="22" /></td>
			</tr>
			<tr>
				<td height="44" colspan="4"><table width="400" height="24"
						border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="27"><img src="image/yd_ico.gif" width="18"
								height="16" /></td>
							<td width="373"><strong style="color: #900; font-size: 14px;">您预订的线路</strong></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="31">线路名称：</td>
				<td colspan="3">${tour.name }</td>
			</tr>
			<tr>
				<td width="82" height="41">优惠价：</td>
				<td colspan="2">成人<strong style="color: #F60;" id="price1">${tour.privilege }</strong>元/人
					儿童<strong style="color: #F60;" id="price2">${tour.children }</strong>元/人
				</td>
				<td width="625">&nbsp;</td>
			</tr>
			<tr>
				<td height="39">价格类型：</td>
				<td colspan="2">${tour.type.name }</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td height="38">出发日期：</td>
				<td colspan="2">
				<input name="groupDate" readonly="readonly" type="text" onclick="show_date_box(this)"
					id="textfield4" style="background: url(image/lvx_rx.gif); width: 118px; height: 24px; border: none; line-height: 25px;" /> 
				<span class="fong_yred">*</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td height="28">参团人数：</td>
				<td width="196"><input name="num" type="text" class="price"
					id="textfield2" size="5" class="price"/> 成人 <input name="children" type="text"
					id="textfield" size="5" class="price"/> 儿童<span class="fong_yred">*</span></td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td height="29">总计费用：</td>
				<td colspan="2"><strong style="color: #F60;" id="result">0</strong>元</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td height="34" colspan="4"><table width="400" border="0"
						cellspacing="0" cellpadding="0">
						<tr>
							<td width="26"><img src="image/yd_icoa.gif" width="18"
								height="25" /></td>
							<td width="374"><strong style="font-size: 14px;">您的联系资料</strong>（为了方便给您
								提供服务，请正确填写以下信息）</td>
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
				<td>&nbsp;</td>
				<td colspan="3"><input type="button" id="button" onclick="check_form();"
					value="" style="background: url(image/bot.gif); width: 93px; height: 30px; border: none;"></td>
			</tr>
		</table>
	</form>
</div>