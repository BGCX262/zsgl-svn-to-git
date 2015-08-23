<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="glhy"
		class="news">会议酒店</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">会议酒店</div>
	<div class=" lv_xq_title">${hotel.name }</div>

	<div class="lv_xq_img">
		<img src="image/h_img.gif" />
	</div>

	<div class="lv_xq_txt">
		<table width="400" border="0" cellspacing="0" cellpadding="0"
			style="line-height: 23px;">
			<tr>
				<td width="66" height="26"><strong>所在区域：</strong></td>
				<td colspan="3">${hotel.address.name }</td>
			</tr>
			<tr>
				<td height="29"><strong>详细地址：</strong></td>
				<td colspan="3">${hotel.location }</td>
			</tr>
			<tr>
				<td height="30" valign="top"><strong>周边景点：</strong></td>
				<td colspan="3">${hotel.attractons }</td>
			</tr>
			<tr>
				<td height="28"><strong>开业时间：</strong></td>
				<td colspan="3">${hotel.openingTime }</td>
			</tr>
			<tr>
				<td height="26"><strong>酒店楼层：</strong></td>
				<td colspan="3">${hotel.floor }</td>
			</tr>
			<tr>
				<td height="31"><strong>客房数量：</strong></td>
				<td colspan="3">${hotel.num }</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td width="61">&nbsp;</td>
				<td width="51">&nbsp;</td>
				<td width="222">&nbsp;</td>
			</tr>
		</table>
	</div>

	<div class="lv_xq_cont">
		<div class="lv_xq_cont_bt">酒店图片</div>
		<div class="cont_lv">
			${hotel.remark }
			<table width="505" height="72" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td height="44">
						<!-- 
						<table width="502" height="26" border="0" cellpadding="0"
							cellspacing="0"
							style="border: 1px solid #ccc; background: #efefef;">
							<tr>
								<td><table width="434" border="0" cellspacing="3"
										cellpadding="0">
										<tr>
											<td align="center">到达日期</td>
											<td><input name="textfield2" type="text" id="textfield2"
												value="2012-07-12" size="13" /></td>
											<td>离开日期</td>
											<td><input name="textfield3" type="text" id="textfield3"
												value="2012-07-15" size="13" /></td>
											<td><a href="#" class="news">（点击修改）</a></td>
										</tr>
									</table></td>
							</tr>
						</table>
						 -->
					</td>
				</tr>
				<tr>
					<td><table width="497" height="175" border="1" cellpadding="0"
							cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
							<tr>
								<td width="92" height="30" align="center" bordercolor="#61b8eb">房间</td>
								<td width="45" align="center" bordercolor="#61b8eb">床型</td>
								<td width="50" align="center" bordercolor="#61b8eb">面积</td>
								<td width="44" align="center" bordercolor="#61b8eb">楼层</td>
								<td width="35" align="center" bordercolor="#61b8eb">宽带</td>
								<td width="36" align="center" bordercolor="#61b8eb">早餐</td>
								<td width="47" align="center" bordercolor="#61b8eb">门市价</td>
								<td width="51" align="center" bordercolor="#61b8eb">优惠价</td>
								<td width="65" align="center" bordercolor="#61b8eb">&nbsp;</td>
							</tr>
							<a name="room"></a>
							<c:forEach items="${hotel.rooms }" var="r">
								<tr>
									<td height="31" align="center" bordercolor="#61b8eb">${r.name }</td>
									<td align="center" bordercolor="#61b8eb">${r.bad.name }</td>
									<td align="center" bordercolor="#61b8eb">${r.area }</td>
									<td align="center" bordercolor="#61b8eb">${r.floor }</td>
									<td align="center" bordercolor="#61b8eb">${r.net }</td>
									<td align="center" bordercolor="#61b8eb">${r.breakfast }</td>
									<td align="center" bordercolor="#61b8eb"><span class="jg">￥</span>${r.doorPrice }</td>
									<td align="center" bordercolor="#61b8eb"><span class="jg">￥</span>${r.privilege }</td>
									<td align="center" bordercolor="#61b8eb">
										<c:choose>
											<c:when test="${r.roomState.name == '有' }">
												<a href="hotelyd?id=${hotel.id }&room=${r.id }"><img src="image/yd.gif"
													align="absmiddle" /></a>
											</c:when>
											<c:otherwise>
												订满
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>

						</table></td>
				</tr>
			</table>
			<br />
		</div>
	</div>
</div>