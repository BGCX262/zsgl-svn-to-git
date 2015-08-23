<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>	
<div class="wz">
	您当前所在的位置：<a href="" class="news">首页</a>—<a href="lvgl?type=${strategy.type.id }"
		class="news">${strategy.type.name }</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">${strategy.type.name }</div>
	<div class=" lv_xq_title">${strategy.name }</div>
	<div class="lv_xq_cont">
		<div class="cont_lv">
			${strategy.content } <br />
		</div>
	</div>
</div>