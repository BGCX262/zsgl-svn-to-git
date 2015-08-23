<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/html"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!--  -->
<%@ taglib prefix="util" uri="/util" %>

<div class="wz">
	您当前所在的位置：<a onclick="return loadPage(this);" href="index.html" class="news">首页</a>—<a onclick="return loadPage(this);" href="gszh.html" class="news">公司帐号</a>
</div>
<div class="same_list_back">
	<div class="same_list_title">公司帐号</div>
	<div class="lv_xq_cont" style="line-height: 25px;">
		<table width="715" height="117" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td><strong style="color: #990000;">温馨提示：</strong></td>
			</tr>
			<tr>
				<td>1、电汇：为了您的款及时到位，请采用电子汇兑的方式，24小时之内即可到帐。<br />
					2、现收：您可以在接站后直接在我们公司财务部办理交款手续和返程票务事宜。<br />
					3、为了方便您，我们也可以派专人上门服务，在酒店内为您办理有关事宜。 <br />
					4、为了及时地确认您的订单，您可以在汇款后将底单传真或Email给我们。<br />
					我们的服务电话：0773-2896236、2898512、2898230 <br /> 联系人：岳小姐 13768916767、林小姐 13317731992、廖先生 15677091910<br />
					旅游许可证：L-GX-CJ00036<br/>
				</td>
			</tr>
			<tr>
				<td>
					<table width="561" height="152" border="0" cellpadding="0"
						cellspacing="0" style="border: 1px solid #7fa0b6;">
						<tr>
							<td width="107" rowspan="5" align="center"
								style="border-right: 1px solid #7fa0b6;"><strong>银行汇款</strong></td>
							<c:forEach items="${accounts }" var="a" begin="0" end="0">
								<td width="175" align="center"
									style="border-bottom: 1px solid #7fa0b6; border-right: 1px solid #7fa0b6;">
								<a href="https://shenghuo.alipay.com/transfercore/fill.htm?_pdType=adchbfbbfbiieigbgiif&optCardNo=${a.cardid }&optCardName=${util:encode(a.name) }&optBankName=${a.type.code }" class="news" target="_blank">	
									<img src="${a.image }" height="33" style="border: 0px;"/>
								</a>	
								</td>
								<td width="277" style="border-bottom: 1px solid #7fa0b6;">
									<c:out value="${a.accountType.name }" default="对公账号"/>
									：
									<a href="https://shenghuo.alipay.com/transfercore/fill.htm?_pdType=adchbfbbfbiieigbgiif&optCardNo=${a.cardid }&optCardName=${util:encode(a.name) }&optBankName=${a.type.code }" class="news" target="_blank">
										${a.cardid }
									</a>
									<br /> 户名：
									<a href="https://shenghuo.alipay.com/transfercore/fill.htm?_pdType=adchbfbbfbiieigbgiif&optCardNo=${a.cardid }&optCardName=${util:encode(a.name) }&optBankName=${a.type.code }" class="news" target="_blank">
										${a.name }
									</a>
									<br /> 开户行：
									<a href="https://shenghuo.alipay.com/transfercore/fill.htm?_pdType=adchbfbbfbiieigbgiif&optCardNo=${a.cardid }&optCardName=${util:encode(a.name) }&optBankName=${a.type.code }" class="news" target="_blank">
										${a.bank }
									</a>
								</td>
							</c:forEach>
						</tr>
						<c:forEach items="${accounts }" var="a" begin="1">
							<tr>
								<td align="center"
									style="border-bottom: 1px solid #7fa0b6; border-right: 1px solid #7fa0b6;">
								<a href="https://shenghuo.alipay.com/transfercore/fill.htm?_pdType=adchbfbbfbiieigbgiif&optCardNo=${a.cardid }&optCardName=${util:encode(a.name) }&optBankName=${a.type.code }" class="news" target="_blank">	
									<img src="${a.image }" height="37" style="border: 0px;"/>
								</a>	
								</td>
								<td style="border-bottom: 1px solid #7fa0b6;">
									<c:out value="${a.accountType.name }" default="对公账号"/>
									：
									<a href="https://shenghuo.alipay.com/transfercore/fill.htm?_pdType=adchbfbbfbiieigbgiif&optCardNo=${a.cardid }&optCardName=${util:encode(a.name) }&optBankName=${a.type.code }" class="news" target="_blank">
										${a.cardid }
									</a>
									<br /> 户名：
									<a href="https://shenghuo.alipay.com/transfercore/fill.htm?_pdType=adchbfbbfbiieigbgiif&optCardNo=${a.cardid }&optCardName=${util:encode(a.name) }&optBankName=${a.type.code }" class="news" target="_blank">
										${a.name }
									</a>
									<br /> 开户行：
									<a href="https://shenghuo.alipay.com/transfercore/fill.htm?_pdType=adchbfbbfbiieigbgiif&optCardNo=${a.cardid }&optCardName=${util:encode(a.name) }&optBankName=${a.type.code }" class="news" target="_blank">
										${a.bank }
									</a>	
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
		<p>&nbsp;</p>
	</div>
</div>