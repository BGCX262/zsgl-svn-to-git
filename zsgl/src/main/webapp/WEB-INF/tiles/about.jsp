<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="html" uri="/html" %>	
<%@ page trimDirectiveWhitespaces="true" %>	
<div class="same_back">
	<div class="same_bt">
		<div class="same_title">公司简介</div>
		<div class="same_more">
			<a onclick="return loadPage(this);" href="about.html" class="news">更多>></a>
		</div>
	</div>
	<div class="same_line">
		<div class="txt">
			<p class="cont">
				<img src="image/zj.gif" style="margin-left: 10px; margin-top: 5px">
				<img src="image/zj.gif" style="margin-top: 5px"><br />
				<html:out html="${app.company.content }" length="96"/>...
			</p>
		</div>
	</div>
</div>