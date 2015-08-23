<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ page trimDirectiveWhitespaces="true" %>
<div>
	<div>
		<span class="STYLE15">订单信息</span><br/>
		<table width="598" border="0">
		  <tr>
		    <td height="37" colspan="4" align="left" bgcolor="#e0eafa"><span class="STYLE15">${order.name}</span></td>
		  </tr>
		  <tr>
		    <td height="37" colspan="4" align="left" bgcolor="#e0eafa"><span class="STYLE1">出游时间：${fn:substring(order.groupDate, 0, 10)}</span></td>
		  </tr>
		  <tr>
		    <td width="121" height="37" align="center" bgcolor="#e0eafa"><span class="STYLE2">项目</span></td>
		    <td width="147" align="center" bgcolor="#e0eafa"><span class="STYLE2">单价</span></td>
		    <td width="143" align="center" bgcolor="#e0eafa"><span class="STYLE2">数量</span></td>
		    <td width="169" align="center" bgcolor="#e0eafa"><span class="STYLE2">小计</span></td>
		  </tr>
		  <tr>
		    <td height="37" align="center" bgcolor="#e0eafa"><span class="STYLE2">成人</span></td>
		    <td align="center" bgcolor="#e0eafa"><span class="STYLE7">￥${order.tour.privilege}元</span></td>
		    <td align="center" bgcolor="#e0eafa"><span class="STYLE7"><c:out value="${order.num}" default="0"/>人</span></td>
		    <td align="center" bgcolor="#e0eafa"><span class="STYLE13">￥${order.tour.privilege * order.num}元</span></td>
		  </tr>
		  <tr>
		    <td height="37" align="center" bgcolor="#e0eafa"><span class="STYLE2">儿童</span></td>
		    <td align="center" bgcolor="#e0eafa"><span class="STYLE7">￥${order.tour.children}元</span></td>
		    <td align="center" bgcolor="#e0eafa"><span class="STYLE7"><c:out value="${order.children}" default="0"/>人</span></td>
		    <td align="center" bgcolor="#e0eafa"><span class="STYLE13">￥${order.tour.children * order.children}元</span></td>
		  </tr>
		  <tr>
		    <td height="42" colspan="4" align="right" bgcolor="#e0eafa" class="STYLE14">合计：￥${order.price}元</td>
		  </tr>
		  <tr>
		    <td height="64" colspan="4" align="left" valign="top"><p class="STYLE2">请您下订单之后尽快选择一下付款方式付款，我们将保留您的订单48小时，如48小时后任然没有收到您的付款，我们将自动取消此订单。</p>
		    <p class="STYLE3"><strong> 桂林招商国际旅行社客服电话：  400 0188 013 （上班时间 8：30 - 23：00）  </strong></p></td>
		  </tr>
		</table>
		<span class="STYLE15">选择付款方式</span><br/>
		<form name="zfb_form" action="https://shenghuo.alipay.com/send/payment/fill.htm" method="post" target="_blank">
			<input name="_pdType" type="hidden" value="adchbfbafecdcbgefgid"/>
			<input name="optEmail" type="hidden" value="18907837908"/>
			<input name="payAmount" type="hidden" value="${order.price}" />
			<table width="598" border="0">
			  <tr>
			    <td height="34" colspan="3"><img src="images/zxzf.png" width="707" height="32" /></td>
			  </tr>
			  <tr>
			    <td width="219" height="61" align="center"><a href="javascript:zfb_form.submit()"><img src="images/zfb.png" style="border:0px;"/></a></td>
			    <td width="234" align="center"><a href="http://www.ccb.com/cn/home/" target="_blank"><img src="http://www.glsits.com/image/jh.gif" style="border:0px;" /></a></td>
			    <td width="246" align="center"></td>
			  </tr>
			  <tr>
			    <td width="219" height="61" align="center"><a href="http://www.boc.cn/" target="_blank"><img src="images/zgyh.jpg" style="border:0px;" width="101" /></a></td>
			    <td width="234" align="center"><a href="http://www.icbc.com.cn/icbc/" target="_blank"><img src="http://www.glsits.com/image/gh.gif" style="border:0px;"/></a></td>
			    <td width="246" align="center"></td>
			  </tr>
			  <tr>
			    <td height="32" colspan="3"><img src="images/xxzf.png" width="707" height="32" /></td>
			  </tr>
			  <tr>
			    <td height="55" align="center"><a href="/gszh" style="text-decoration:none; font-size: 14px;">人工服务</a></td>
			    <td align="center"><a href="/gszh" style="text-decoration:none;  font-size: 14px;">银行转账</a></td>
			    <td align="center"></td>
			  </tr>
			  <tr>
			    <td height="63" colspan="3" align="left" valign="top"><span class="STYLE3">1、<a href="gszh">在线支付帮助。</a><br />
			      2、游玩时间在五一、十一、春节三大黄金周内的订单，只接收全额付款或全额房费的预付方式，详情请联系客服<br />
		        3、距离您抵桂时间不足48小时的订单，请咨询我们的客服人员确定行程后再支付，如因客人自身的原因未能享用旅游产品，费用不退还。</span></td>
			  </tr>
			</table>
		</form>	
	</div>
</div>