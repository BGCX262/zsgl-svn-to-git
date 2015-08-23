<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/util"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div id="r_banner">
	<%--轮换图片开始 --%>
	<div id="play">
		<ul>
			<li id="playBg"></li>
			<li id="playText"></li>
			<li id="playNum"><c:forEach begin="1"
					end="${fn:length(posters) }" var="i">
					<a>${i }</a>
				</c:forEach></li>
			<li id="playShow">
				<c:forEach items="${posters }" var="p" varStatus="s">
					<c:choose>
						<c:when test="${s.index == 0 }">
							<a href="${p.address }" target="_blank"><img src="${p.image }" alt="" height="262"></a>
						</c:when>
						<c:otherwise>
							<a href="${p.address }" target="_blank" style="display:none"><img src="${p.image }" alt="" height="262"></a>
						</c:otherwise>
					</c:choose>
				</c:forEach></li>
		</ul>
	</div>
	<%--轮换图片结束 --%>
</div>

<div class="r_back">
	<%--桂林散客游开始 --%>
	<div class="same_xl">
		<div class="same_xl_title">
			<div class="same_xl_pic">
				<img src="image/r_bt_l.gif" />
			</div>
			<div class="same_xl_bg">
				<div class="same_xl_bt"><a href="ly/type/12/1.html" class="gl" title="桂林散客游">桂林散客游</a></div>
				<div class="same_more" style="margin: 8px 0 0 0;">
					<a href="ly/type/12/1.html" class="news" title="点击查看更多">更多&gt;&gt;</a>
				</div>
			</div>
			<div class="same_xl_pic">
				<img src="image/r_bt_r.gif" />
			</div>
			<div class="same_xl_img">
				<a href="ly/type/12/1.html" title="桂林散客游"><img src="${globalResource.image1 }" width="368" height="118" style="border:0px;"/></a>
			</div>

			<div class="same_xl_list">
				<ul>
					<c:forEach items="${glsks }" var="o">
						<li><span> ￥${o.privilege }起</span><a href="ly/view/${o.id }.html"
							class="news" title="${o.name }">${o.name }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<%--桂林散客游结束 --%>
	<%--独立用车游开始 --%>
	<div class="same_xl same_xla">
		<div class="same_xl_title">
			<div class="same_xl_pic">
				<img src="image/r_bt_l.gif" />
			</div>
			<div class="same_xl_bg">
				<div class="same_xl_bt"><a href="ly/type/13/1.html" class="gl" title="独立用车游">独立用车游</a></div>
				<div class="same_more" style="margin: 8px 0 0 0;">
					<a href="ly/type/13/1.html" class="news" title="点击查看更多">更多&gt;&gt;</a>
				</div>
			</div>
			<div class="same_xl_pic">
				<img src="image/r_bt_r.gif" />
			</div>
			<div class="same_xl_img">
				<a href="ly/type/13/1.html" title="独立用车游"><img src="${globalResource.image2 }" style="border:0px;"/></a>
			</div>
			<div class="same_xl_list">
				<ul>
					<c:forEach items="${dlycs }" var="o">
						<li><span> ￥${o.privilege }起</span><a href="ly/view/${o.id }.html"
							class="news" title="${o.name }">${o.name }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<%--独立用车游结束 --%>
</div>
<%--多日游开始 --%>
<div class="same_fl">
	<div class="same_fl_title">
		<div class="same_fl_bt">
			<ul>
				<c:forEach items="${tourDays }" var="o" varStatus="s">
					<li><a href="ly/day/${o.id }/1.html" id="${s.index }" class="bta btn_Day" title="${o.name }">${o.name }</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="same_more" style="margin: 8px 3px 0 0;">
			<a href="ly.html" class="news" title="点击查看更多">更多&gt;&gt;</a>
		</div>
	</div>
	<c:forEach items="${tourDayList }" var="list" varStatus="s">
		<div id="day_${s.index }" style="display:none;" class="days">
			<div class="same_fl_img">
				<a href="ly.html" title="桂林旅游"><img src="${globalResource.image3 }" style="border:0px;" alt="桂林旅游" title="桂林旅游"/></a>
			</div>
			<div class="same_fl_img_list">
				<ul>
					<c:forEach items="${list }" var="t" begin="0" end="3">
						<li><span>￥${t.privilege }起</span><a href="ly/view/${t.id }.html" class="news" title="${fn:substring(t.name, 0, 13) }">${fn:substring(t.name, 0, 13) }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="same_fl_img_list same_fl_img_lista">
				<ul>
					<c:forEach items="${list }" var="t" begin="4" end="7">
						<li><span>￥${t.privilege }起</span><a href="ly/view/${t.id }.html" class="news" title="${fn:substring(t.name, 0, 13) }">${fn:substring(t.name, 0, 13) }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:forEach>
</div>
<%--多日游结束 --%>
<%--国内线路、处境游开始 --%>
<div class="lvxl">
	<div class="lvxl_title">
		<div class="same_xl_pic">
			<img src="image/r_bt_l.gif" />
		</div>
		<div class="lvxl_title_bg">
			<div class="same_xl_bt">
				<a href="ly/type/14/1.html" class="gl" title="国内线路">国内线路</a> <img src="image/bt_lis.gif"
					align="absmiddle" /> <a href="jlwlv" class="gl" title="出境游">出境游</a>
			</div>
			<div class="same_more" style="margin: 8px 0 0 0;">
				<a href="gllv.html" class="news" title="点击查看更多">更多&gt;&gt;</a>
			</div>
		</div>
		<div class="same_xl_pic">
			<img src="image/r_bt_r.gif" />
		</div>
	</div>

	<div class="same_lv_list">
		<ul>
			<c:forEach items="${gnlvs }" var="g">
				<li><span>￥${g.privilege }</span> <a href="ly/view/${g.id }.html"
					class="news" title="${g.name }">${g.name }</a></li>
			</c:forEach>
		</ul>
	</div>
	<div class="same_lv_list same_lv_lista">
		<ul>
			<c:forEach items="${cjys }" var="c">
				<li><span>￥${c.privilege }</span> <a href="ly/view/${c.id }.html"
					class="news" title="${c.name }">${c.name }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<%--国内线路、处境游结束 --%>

<div class="r_back" style="height: 225px;">
	<%--桂林酒店开始 --%>
	<div class="same_xl">
		<div class="same_xl_title">
			<div class="same_xl_pic">
				<img src="image/r_bt_l.gif" />
			</div>
			<div class="same_xl_bg">
				<div class="same_xl_bt"><a href="hotel/city/1/1.html" class="gl" title="桂林酒店">桂林酒店</a></div>
				<div class="same_more" style="margin: 8px 0 0 0;">
					<a href="hotel/city/1/1.html" class="news" title="点击查看更多">更多&gt;&gt;</a>
				</div>
			</div>
			<div class="same_xl_pic">
				<img src="image/r_bt_r.gif" />
			</div>
			<div class="same_lv_list same_lv_listb">
				<ul>
					<c:forEach items="${glHotels }" var="o">
						<li><span style="margin: 0 50px 0 0px; color: #21324e;">
								${util:showPrice(o.rooms) }
							</span>
							<span style="margin: 0 50px 0 0px; color: #21324e;">${o.hotelLevel.name }</span>
							<a href="hotel/view/${o.id }.html" class="news" title="${o.name }">${fn:substring(o.name, 0, 8) }</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<%--桂林酒店结束 --%>
	<%--阳朔酒店开始 --%>
	<div class="same_xl same_xla">
		<div class="same_xl_title">
			<div class="same_xl_pic">
				<img src="image/r_bt_l.gif" />
			</div>
			<div class="same_xl_bg">
				<div class="same_xl_bt"><a href="hotel/city/4/1.html" class="gl" title="阳朔酒店">阳朔酒店</a></div>
				<div class="same_more" style="margin: 8px 0 0 0;">
					<a href="hotel/city/4/1.html" class="news" title="点击查看更多">更多&gt;&gt;</a>
				</div>
			</div>
			<div class="same_xl_pic">
				<img src="image/r_bt_r.gif" />
			</div>
			<div class="same_lv_list same_lv_listb">
				<ul>
					<c:forEach items="${ysHotels }" var="o">
						<li><span>
								${util:showPrice(o.rooms) }
							</span>
							<span style="margin: 0 100px 0 0px; color: #21324e;">${o.hotelLevel.name }</span>
							<a href="hotel/view/${o.id }.html" class="news" title="${o.name }">${fn:substring(o.name, 0, 8) }</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<%--阳朔酒店结束 --%>
</div>

<%--星级酒店开始 --%>
<div class="same_fl">
	<div class="same_fl_title">
		<div class="same_fl_bt">
			<ul>
				<c:forEach items="${hotelLevels }" var="l" varStatus="s">
					<li><a href="hotel/level/${l.id }/1.html" id="${s.index }" class="bta btn_Hotel" title="${l.name }">${l.name }</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="same_more" style="margin: 8px 3px 0 0;">
			<a href="hotel.html" class="news" title="hotel.html" title="点击查看更多">更多&gt;&gt;</a>
		</div>
	</div>
	<c:forEach items="${hotelList }" var="list" varStatus="s">
		<div id="hotel_${s.index }" style="display:none" class="hotels">
			<div class="same_fl_img">
				<a href="hotel.html"><img src="${globalResource.image4 }" style="border:0px;" alt="桂林酒店" title="桂林酒店"/></a>
			</div>
			<div class="same_fl_img_list">
				<ul>
					<c:forEach items="${list }" var="h" begin="0" end="3">
						<li>
							<span>
								${util:showPrice(h.rooms) }
							</span>
							<a href="hotel/view/${h.id }.html" class="news" title="${h.name }">${h.name }</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="same_fl_img_list same_fl_img_lista">
				<ul>
					<c:forEach items="${list }" var="h" begin="4" end="7">
						<li>
							<span>
								${util:showPrice(h.rooms) }
							</span>
							<a href="hotel/view/${h.id }.html" class="news" title="${h.name }">${h.name }</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:forEach>
</div>
<%--星级酒店结束 --%>
<%--商务会议开始  --%>
<div class="lvxl">
	<div class="lvxl_title">
		<div class="same_xl_pic">
			<img src="image/r_bt_l.gif" />
		</div>
		<div class="lvxl_title_bg">
			<div class="same_xl_bt"><a href="glhy" class="gl">商务会议</a></div>
			<div class="same_more" style="margin: 8px 0 0 0;">
				<a href="glhy" class="news">更多&gt;&gt;</a>
			</div>
		</div>
		<div class="same_xl_pic">
			<img src="image/r_bt_r.gif" />
		</div>
	</div>
	<c:forEach items="${mettingPlaces }" var="p">
		<div class="same_hy">
			<div class="same_hy_img">
				<a href="place?id=${p.id }"><img src="${p.image }" width="108"/></a>
			</div>
			<div class="same_hy_cont">
				<strong style="color: #900;">${p.name }</strong><br />
				<html:out html="${p.content }" length="40"/>
			</div>
			
		</div>
	</c:forEach>
	
</div>
<%--商务会议结束 --%>
<%--景点介绍开始 --%>
<div id="jd_back">
	<div id="jd_title">
		<div class="same_xl_bt"><a href="jingdian" class="gl">景点介绍</a></div>
		<div class="same_more" style="margin: 8px 0 0 0;">
			<a href="jd.html" class="news" title="点击查看更多">更多&gt;&gt;</a>
		</div>
	</div>
	
	<div id="jd_line">
		<div class="colmar_list">
			<ul>
				<c:forEach items="${scenics }" var="sc">
					<li><a href="jd/view/${sc.id }.html" class="img-colmar"><img
							src="${sc.image }" width="165" height="110" border="0" /></a><a
						href="jd/view/${sc.id }.html" class="news">${sc.name }</a></li>
				</c:forEach>
			</ul>
			<div class="cle"></div>
		</div>
	</div>
	
</div>
<%--景点介绍结束 --%>