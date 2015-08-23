<%@ page import="com.zsgl.util.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页管理</title>
</head>
<body>
<h1>首页管理</h1>
<%-- 
首页使用技术：${exists ? "静态&nbsp;&nbsp;<a href='/home/delete'>删除静态文件</a>" : "动态&nbsp;&nbsp;<a href='/static/index.html'>生成静态文件</a>" }<br/><br/>
--%>
最后更新时间：${lastDate != null ? lastDate : "无"}&nbsp;&nbsp;<a href="/home/update">立即更新</a><br/>
<%-- 
<h2>关于首页</h2>
<p>由于首页采用静态技术，即网站有更新的时候需要手动生成静态页面</p>
<h2>全站静态</h2>
<p>不止首页可以使用静态技术，其他页面也可以使用静态技术，生成静态页面后可以大大加快网页的打开速度</p>
<p>采用静态技术，生成静态页以后，不仅有利于用户的浏览，而且更利于搜索引擎的收录</p>
<h2>相关栏目生成</h2>
<p><h4>旅游路线栏目：</h4>相关页面：${lyPages },现有页面：<c:out value="${lyPages2 }" default="0"/>,<a href="/static/ly">生成静态页</a></p>
<p><h4>酒店栏目：</h4>相关页面：${hotelPages },现有页面：<c:out value="${hotelPages2 }" default="0"/> ,<a href="/static/hotel">生成静态页</a></p>
<p><h4>攻略栏目：</h4>相关页面：${glPages },现有页面：<c:out value="${glPages2 }" default="0"/>,<a href="/static/gl">生成静态页</a></p>
<p><h4>总计：${lyPages + hotelPages + glPages }, 现有：${lyPages2 + hotelPages2 + glPages2 }</h4></p>
<p>一键生成：一键生成会生成旅游路线栏目、酒店栏目、攻略栏目全部，但是速度较慢 <a href="/static/all">立即生成</a></p>
--%>
<%-- 
<h2>动态与静态的区别</h2>
<p>1、所谓动态，就是指页面的内容都是通过查询数据库然后产生的（过程很耗时）</p>
<p>2、所谓静态，就是当首页内容有变化的时候重新生成一个静态页面，下次不需要查询数据库</P>
<p>相比动态，速度将近快10-50倍，也就是说服务器处理一个静态页面只需要20-300毫秒，而处</p>
<p>理一个动态页面需要1000-3000毫秒</p>
<h2>优势与劣势</h2>
<p>1、动态技术的优点就是实时行比较好，内容永远是最新的，缺点是客户端每次访问都需要查询数据库效率比较低</p>
<p>2、静态技术的优点就是效率高，缺点就是当首页内容发生变化的时候，需要手动更新，实时性不好</p>
<h2>专家推荐</h2>
<p>一般情况下，首页推荐使用静态技术，虽然实时性比动态技术要差一点，但是只要我们网站有更新的</p>	
<p>时候，手动更新一下就好了，相比动态技术要快得多，特别是服务器比较繁忙的时候更加明显，可能</p>
<p>会慢上好几秒，可能就是因为这几秒钟，用户直接就没耐心等了，相比之下静态技术带来优势要比动</p>
<p>态技术要好得多。</p>
--%>
</body>
</html>