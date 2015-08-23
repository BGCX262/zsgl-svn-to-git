<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<h4>拷贝攻略步骤：</h4>
<p>1、到<a href="http://www.mafengwo.cn/" target="_blank">蚂蜂窝网</a>寻找优质文章</p>
<p>2、将文章地址拷贝到下方的文本框中（多个地址请回车换行）</p>
<p>3、点击下面的更新即可（由于需要访问对方的网站，速度完全取决于对方服务器的响应速度，请耐心等待）</p>
<p>备注：目前只支持<a href="http://www.mafengwo.cn/" target="_blank">蚂蜂窝网</a>的攻略，其他网站暂不支持</p>
<form method="post">
	<textarea name="https" cols="50" rows="15"></textarea><br/>
	<input type="submit" value="更新"/>
</form>
<c:if test="${not empty param.https }">
	更新成功，本次共更新${count }条
</c:if>