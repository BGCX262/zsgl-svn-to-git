<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="glhy"
		class="news">会议场所</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">会议场所</div>
	<div class=" lv_xq_title">${meetingPlace.name }</div>
	<div class="lv_xq_cont">
		<div class="cont_lv">
			${meetingPlace.content } <br />
		</div>
	</div>
</div>