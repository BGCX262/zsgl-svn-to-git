<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.zsgl.listener.*,java.util.*" %>
<%
	Runtime r = Runtime.getRuntime();
	long ms = new Date(System.currentTimeMillis()).getTime() - com.zsgl.util.Common.accurateDateFormat.parse((String)application.getAttribute("startTime")).getTime();
	ms = ms / 1000;
%>
<html>
<head>
<title>系统信息</title>
<style type="text/css">
body{font-size:14px;}
</style>	
</head>
<body>
<h2>系统信息</h2>
<p>操作系统：<%=System.getProperty("os.name") %></p>
<p>系统版本：<%=System.getProperty("os.version") %></p>
<p>系统架构：<%=System.getProperty("os.arch") %></p>
<p>处理器个数：<%=r.availableProcessors() %></p>
<p>JVM版本：<%=System.getProperty("java.version") %></p>
<p>JVM供应商：<%=System.getProperty("java.vendor") %></p>
<p>虚拟机最大内存：<%=r.maxMemory() / 1024 / 1024 %>M</p>
<p>已用内存：<%=r.totalMemory() / 1024 / 1024 %>M&nbsp;&nbsp;<a href="/admin/gc.html">清理内存</a></p>
<p>可用内存：<%=r.freeMemory() /1024 / 1024 %>M</p>
<p>缓存更新时间：${app.updateTime }&nbsp;&nbsp;<a href="/admin/update.html">立即更新</a></p>
<p>系统运行时间：${startTime }</p>
<p>系统运行时长：<%=ms / (24 * 3600) %>天<%=ms % (24 * 3600) / 3600 %>小时<%=ms % 3600 / 60 %>分<%=ms % 60 %>秒</p>
<p>版本：2.1</p>
<h2>本次更新内容</h2>
<p>1、性能提升</p>
<p>2、修复路线、酒店、攻略栏目更新后，前台不同步问题</p>
<p>3、将路线、酒店、攻略栏目手动生成静态页，改成自动生成</p>
<p>4、修复路线、酒店、攻略栏目因上版本上级留下的问题</p>
<p>5、新增路线、酒店、攻略栏目新添预览功能，点击预览即可在新窗口看到刚刚添加的内容，该预览按钮在添加完成页面或者列表页面均可找到</p>
<p>6、新增自动更新功能，参见菜单栏最下面一栏，主要针对攻略开发（测试阶段）, <a href="/auto">立即查看</a></p>
<h2>历史版本</h2>
<p>2.0</p>
<p>1、后台版面修改</p>
<p>2、对首页进行优化，采用静态技术，加快首页的访问速度，<a href="/home">点击查看</a></p>
<p>3、新增修改密码功能，<a href="/password">点击查看</a></p>
<p>4、本次更新主要对SEO，即搜索引擎进行优化，网站整体结构全部改变，所以以前的地址全部失效，已改成新的地址</p>
<p>5、针对搜索引擎的另一重要升级就是，网站标题的优化，对于上一版本，网站的每个页面都使用相同的标题，这对搜索引擎是非常不利的</p>
<p>标题对于一个网页来说是最重要的，因为当用户在百度进行搜索的时候，网页的标题是匹配搜索结果的一个相当重要的参考</p>
<p>6、另外本次更新还允许我们，设定没有页面的 关键字，描述，可以针对每一个页面进行单独设置，这是很重要的，上一版</p>
<p>本采用的是跟首页一样的关键字跟描述，操作的不良结果就是，网站的关键字比较少，用户搜索到的几率也相对减少</p>
<p>7、对于关键字跟描述一定要设置，关键字是用来给搜索引擎看到，而描述是给用户看的，当用户搜索到一个结果的时候，第一</p>
<p>眼看到的就是描述，一个好的描述，既要简单，又要能吸引用户点击你的网站链接，所以这个也非常重要，本次主要针对</p>
<p>路线、酒店、攻略几个栏目进行升级，所以上面说到的更新只要是针对这几个栏目的</p>
</body>
</html>