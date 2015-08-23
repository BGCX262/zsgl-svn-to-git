<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="html" uri="/html"%>
<%@ taglib prefix="util" uri="/util"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%--设置标题 --%>
<script>setTitle("${hotel.name}");</script>
<div class="wz">
	您当前所在的位置：<a onclick="return loadPage(this);" href="index.html" class="news">首页</a>—<a onclick="return loadContent(this);" href="hotel/city/${hotel.address.id }/1.html"
		class="news"><c:out value="${hotel.address.name }" default="桂林酒店"/></a>
</div>
<div class="same_list_back">
	<div class="same_list_title">
		<c:out value="${hotel.address.name }" default="桂林酒店"/>
	</div>
	<div class=" lv_xq_title">${hotel.name }</div>
	<div class="lv_xq_img">
		<img src="${hotel.image}" width="270" />
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
						
					</td>
				</tr>
				<tr>
					<td>
					<%--查询酒店价格开始 --%>					
					<div>
						<table width="434" border="0" cellspacing="3" cellpadding="0" style="border:1px solid #ccc; background:#efefef;">
			              <tr>
			                <td align="center">起始日期</td>
			                <td><input name="beginDate" type="text" id="beginDate" size="13" readonly="readonly" onclick="show_date_box(this)"/></td>
			                <td>结束日期</td>
			                <td><input name="endDate" type="text" id="endDate" size="13" readonly="readonly" onclick="show_date_box(this)"/></td>
			                <td><a href="javascript:void(0);" onclick="queryPrices(${hotel.id });" class="news">（查询价格）</a></td>
			              </tr>
			            </table>
						<%--错误消息 --%>
			            <label id="error_message" style="color: red;"></label>
			            <%--查询结果 --%>
			            <div id="query_result"></div>
					</div>
					<%--查询酒店价格结束 --%>
					<table width="680" height="175" border="1" cellpadding="0"
							cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
							<tr>
								<td width="92" height="30" align="center" bordercolor="#61b8eb">房间</td>
								<td width="45" align="center" bordercolor="#61b8eb">床型</td>
								<td width="50" align="center" bordercolor="#61b8eb">面积</td>
								<td width="50" align="center" bordercolor="#61b8eb">楼层</td>
								<td width="35" align="center" bordercolor="#61b8eb">宽带</td>
								<td width="36" align="center" bordercolor="#61b8eb">早餐</td>
								<td width="47" align="center" bordercolor="#61b8eb">门市价</td>
								<td width="51" align="center" bordercolor="#61b8eb">优惠价</td>
								<td width="65" align="center" bordercolor="#61b8eb">&nbsp;</td>
							</tr>
							<%--快速预订锚链接 --%>
							<a name="room"></a>
							<c:forEach items="${hotel.rooms }" var="r">
								<tr>
									<td height="31" align="center" bordercolor="#61b8eb">${r.name }</td>
									<td align="center" bordercolor="#61b8eb">${r.bad }</td>
									<td align="center" bordercolor="#61b8eb">${r.area }</td>
									<td align="center" bordercolor="#61b8eb">${r.floor }</td>
									<td align="center" bordercolor="#61b8eb">${r.net }</td>
									<td align="center" bordercolor="#61b8eb">${r.breakfast }</td>
									<td align="center" bordercolor="#61b8eb"><span class="jg">￥</span>${r.doorPrice }</td>
									<td align="center" bordercolor="#61b8eb"><span class="jg">￥</span>${r.todayPrice }</td>
									<td align="center" bordercolor="#61b8eb">
										<c:choose>
											<c:when test="${r.roomState.name == '有' || r.roomState == null}">
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
		<%--上下页 --%>
		<div class="sam_pag">
			<ul>
				<li>上一篇： 
					<c:choose>
						<c:when test="${prev != null }">
							<a onclick="return loadContent(this)" href="hotel/view/${prev.id }.html" class="news" title="${prev.name }">${fn:substring(prev.name, 0, 18) }</a>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
				</li>
				<li style="text-align: right;">下一篇：
					<c:choose>
						<c:when test="${next != null }">
							<a onclick="return loadContent(this)" href="hotel/view/${next.id }.html" class="news" title="${next.name }">${fn:substring(next.name, 0, 18) }</a>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>
	</div>
</div>