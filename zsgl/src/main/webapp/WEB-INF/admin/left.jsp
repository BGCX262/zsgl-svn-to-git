<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<%
String path = request.getContextPath();
int port = request.getLocalPort();
//8080
//String basePath = request.getScheme() + "://" + request.getServerName() + ":" + port + path+"/";
//80
String basePath = request.getScheme() + "://" + request.getServerName() + path+"/";
//String basePath = "http://www.glsits.com/";

%>
<base href="<%=basePath%>"/>
<style type="text/css">

<!--

body {margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;font-family:"宋体";}
.STYLE2 {color: #43860c; font-size: 12px; }
a{ color:#000000; font-size:12px; cursor:hand; color:#43860c; font-family:"宋体";}
a:link {font-size:12px; text-decoration:none; color:#43860c;}
a:visited {font-size:12px; text-decoration:none; color:#43860c;}
a:hover{font-size:12px; text-decoration:none; color:#FF0000;}
.laz{ height:25px; width:100px; display:block;}
.items{padding-left:20px; height:26px; line-height:26px;}
.itembg{background-image: url("images/main_21_1.gif");}
.itembg2{background-image: url("images/main_21_2.gif");}
-->

</style>
<script language="javascript" src="js/jquery-1.4.1.js"> </script>
<script type="text/javascript" >
function dis2(id)
{
	document.getElementById('la').style.display='none';
	document.getElementById('lb').style.display='none';
	document.getElementById('lc').style.display='none';
	var str="#"+id;
	var getid=$(str);
	getid.show();
}
function dis(id)
{	
	var str="#"+id;
	var getid=$(str);
	if (getid.css("display")=='none')
	getid.show();
	else
	getid.hide();
}

</script>
</head>
<body>
<table width="177" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
        <tr>
          <td height="26" background="images/main_21.gif" align="right" style="padding-right:30px;"><a href="/resources/j_spring_security_logout" target="_top" style="color:#FFFFFF; font-weight:bold;">退出后台</a></td>
        </tr>
        <tr>
          <td height="80" style="background-image:url(images/main_23.gif); background-repeat:repeat-x;"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="45"><div align="center"><a  onclick="dis2('la');"><img src="images/main_28.gif" name="Image2" width="40" height="40" border="0" id="Image2" /></a></div></td>
                <td><div align="center"><a  onclick="dis2('lc');"><img src="images/main_31.gif" name="Image3" width="40" height="40" border="0" id="Image3"  /></a></div></td>
                <td><div align="center"><a href="admin/right.html" target="I1"><img src="images/main_26.gif" name="Image1" width="40" height="40" border="0" id="Image1" /></a></div></td>
              </tr>
              <tr>
                <td height="25"><div align="center" class="STYLE2"><a  onclick="dis2('la');">栏目管理</a></div></td>
                <td><div align="center" class="STYLE2"><a  onclick="dis2('lc');">分类管理</a></div></td>
                <td><div align="center" class="STYLE2"><a href="admin/right.html" target="I1">系统管理</a></div></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td  style="line-height:4px; background:#699631;"></td>
        </tr>
        <tr>
          <td  bgcolor="#f3ffe3"><div id="la">
          	  <%--首页管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/home" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;首页管理</strong></a> </td>
                </tr>
              </table>
          	  <%--酒店订单管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg"><a onclick="dis('la26');"><strong>&nbsp;&nbsp;&nbsp;&nbsp;酒店订单管理</strong></a> </td>
                </tr>
                <tr style="display:none;" id="la26">
                  <td align="center" height="26">
		    		<div align="left" class="items"><a href="/hotelorders/hotelorder?state=1" target="I1">已确认</a></div>
		    		<div align="left" class="items"><a href="/hotelorders/hotelorder?state=2" target="I1">正在处理</a></div>
		    		<div align="left" class="items"><a href="/hotelorders/hotelorder?state=3" target="I1">未确认</a></div>
                  </td>
                </tr>
              </table>
              <%--旅游订单管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg"><a onclick="dis('la25');"><strong>&nbsp;&nbsp;&nbsp;&nbsp;旅游订单管理</strong></a> </td>
                </tr>
                <tr style="display:none;" id="la25">
                  <td align="center" height="26">
                    <div align="left" class="items"><a href="/hotelorders/tourorder?state=1" target="I1">已确认</a></div>
		    		<div align="left" class="items"><a href="/hotelorders/tourorder?state=2" target="I1">正在处理</a></div>
		    		<div align="left" class="items"><a href="/hotelorders/tourorder?state=3" target="I1">未确认</a></div>
                  </td>
                </tr>
              </table>
          	  <%--路线管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg"><a onclick="dis('la42');"><strong>&nbsp;&nbsp;&nbsp;&nbsp;路线管理</strong></a> </td>
                </tr>
                <tr style="display:none;" id="la42">
                  <td align="center" height="26">
                    <c:forEach items="${app.tourTypes }" var="o">
		    			<div align="left" class="items"><a href="/tourss?type=${o.id }" target="I1">${o.name }</a></div>
		    		</c:forEach>
			<div align="left" class="items"><a href="/tours" target="I1">显示全部</a></div>
                  </td>
                </tr>
              </table>
              <%-- 酒店管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg"><a onclick="dis('la41');"><strong>&nbsp;&nbsp;&nbsp;&nbsp;酒店管理</strong></a> </td>
                </tr>
                <tr style="display:none;" id="la41">
                  <td align="center" height="26">
                  	<c:forEach items="${app.hotelAddress }" var="o">
						<div align="left" class="items"><a href="/hotelss?hotelAddress=${o.id }" target="I1">${o.name }</a></div>
					</c:forEach>
			<div align="left" class="items"><a href="/hotels" target="I1">显示全部</a></div>
                  </td>
                </tr>
              </table>
              <%-- 攻略管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg"><a onclick="dis('la37');"><strong>&nbsp;&nbsp;&nbsp;&nbsp;攻略管理</strong></a> </td>
                </tr>
                <tr style="display:none;" id="la37">
                  <td align="center" height="26">
                  	<div align="left" class="items"><a href="/strategys/all?type=1" target="I1">·旅游攻略</a></div>
                    <div align="left" class="items"><a href="/strategys/all?type=2" target="I1">·桂林娱乐</a></div>
                    <div align="left" class="items"><a href="/strategys/all?type=3" target="I1">·桂林购物</a></div>
                    <div align="left" class="items"><a href="/strategys/all?type=4" target="I1">·桂林美食</a></div>
                    <div align="left" class="items"><a href="/strategys/all?type=5" target="I1">·桂林攻略</a></div>
		    <div align="left" class="items"><a href="/strategys" target="I1">·显示全部</a></div>
                  </td>
                </tr>
              </table>
              <%-- 公司账号管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg"><a onclick="dis('la18');"><strong>&nbsp;&nbsp;&nbsp;&nbsp;公司账号管理</strong></a> </td>
                </tr>
                <tr style="display:none;" id="la18">
                  <td align="center" height="26">
					<c:forEach items="${app.accountTypes }" var="o">
		        		<div align="left" class="items"><a href="/companyaccountss?type=${o.id }" target="I1">·${o.name }</a></div>
		        	</c:forEach>
                  </td>
                </tr>
              </table>
               <%-- 景点管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/scenics" target="I1" onclick="dis('la30');"><strong>&nbsp;&nbsp;&nbsp;&nbsp;景点管理</strong></a> </td>
                </tr>
                <%-- 
                <tr style="display:none;" id="la30">
                  <td align="center" height="26">
                    <c:forEach items="${app.scenicAddresses }" var="o">
						<div align="left" class="items"><a href="/scenicses?address=${o.id }" target="I1">·${o.name }</a></div>                    	
                    </c:forEach>
			<div align="left" class="items"><a href="/scenics" target="I1">显示全部</a></div>
                  </td>
                </tr>
                --%>
              </table>
              <%-- 公司简介管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/companys" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;公司简介</strong></a> </td>
                </tr>
              </table>
              <%--自助旅游管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/diytours" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;自助旅游管理</strong></a> </td>
                </tr>
              </table>
              <%--境外旅游管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/overseastours" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;境外旅游管理</strong></a> </td>
                </tr>
              </table>
              <%--会议旅游管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/meetingtours" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;会议旅游管理</strong></a> </td>
                </tr>
              </table>
              <%--会议场所管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/meetingplaces" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;会议场所管理</strong></a> </td>
                </tr>
              </table>
              <%--会议酒店管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/meetinghotels" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;会议酒店管理</strong></a> </td>
                </tr>
              </table>
              <%--成功案例管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/caseses" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;成功案例管理</strong></a> </td>
                </tr>
              </table>
              <%--会议服务管理 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/mettingservices" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;会议服务管理</strong></a> </td>
                </tr>
              </table>
              <%--系统设置 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg2"><a href="/globalresources" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;系统设置</strong></a> </td>
                </tr>
              </table>
              <%-- 修改密码 --%>
              <table width="100%" cellpadding="0" cellspacing="0" border="0" align="center" >
                <tr>
                  <td align="left" class="itembg2" height="26"><a  href="/password" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;修改密码</strong></a></td>
                </tr>
              </table>
              <table width="100%" cellpadding="0" cellspacing="0" border="0" align="center" >
                <tr>
                  <td align="left" class="itembg2" height="26"><a  href="/auto" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;自动更新</strong></a></td>
                </tr>
              </table>
            </div>
            <div id="lb" style=" display:none">
            <%-- 
              <table width="100%" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-left:30px;">
                <tr>
                  <td align="left" class="itembg" height="26" ><a  href="http://www.jinseyulin.com/index.php/admin/title/lis" target="I1" ><strong>标题</strong></a></td>
                </tr>
                <tr>
                  <td align="left" class="itembg" height="26" ><a href="http://www.jinseyulin.com/index.php/admin/lm/lis" target="I1"><strong>栏目</strong></a></td>
                </tr>
                <tr>
                  <td align="left" class="itembg" height="26" ><a href="http://www.jinseyulin.com/index.php/admin/ctable/lis" target="I1"><strong>数据表</strong></a></td>
                </tr>
                <tr>
                  <td align="left" class="itembg" height="26" ><a href="http://www.jinseyulin.com/index.php/admin/front_sql/lis" target="I1"><strong>源码生成</strong></a></td>
                </tr>
                <tr>
                  <td align="left" class="itembg" height="26" ><a href="http://www.jinseyulin.com/index.php/admin/qj_sql" target="I1"><strong>数据库执行</strong></a></td>
                </tr>
              </table>
            --%>  
            </div>
            <div id="lc" style="display:none">
              <%-- 
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg"><a href="http://www.jinseyulin.com/index.php/admin/news/lis/52" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;加盟地区</strong></a> </td>
                </tr>
              </table>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg"><a href="http://www.jinseyulin.com/index.php/admin/news/lis/27" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;产品分类</strong></a> </td>
                </tr>
              </table>
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="left" height="26" class="itembg"><a href="http://www.jinseyulin.com/index.php/admin/news/lis/24" target="I1"><strong>&nbsp;&nbsp;&nbsp;&nbsp;产品系列</strong></a> </td>
                </tr>
              </table>
               --%>
            </div>
           </td> 
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
