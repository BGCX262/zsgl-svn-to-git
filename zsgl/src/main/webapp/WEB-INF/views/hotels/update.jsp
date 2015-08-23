<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div>
    <form:update id="fu_com_zsgl_domain_Hotel" modelAttribute="hotel" path="/updateHotel" versionField="Version" z="cEq4s5Yix9MJsXx1VKYAqxBxvbQ=">
        <field:input field="name" id="c_com_zsgl_domain_Hotel_name" min="1" required="true" z="6Msh0wJ8o/CUxPm0Xek/it5H2PU="/>
        <field:textarea2 label="关键字" field="keywords" id="c_com_zsgl_domain_Hotel_keywords" z="HYnyRRDXHwSYDkDaIkUzRSoZIL8="/>
        <field:textarea2 label="描述" field="description" id="c_com_zsgl_domain_Hotel_description" z="/KgMHDKC1nrWZvE/fpkFOTfK63U="/>
        <field:select field="address" id="c_com_zsgl_domain_Hotel_address" itemValue="id" items="${hoteladdresses}" path="/hoteladdresses" z="3pjzCTNeyfVy6FAns3qdn4jlKj0="/>
        <field:select field="hotelLevel" id="c_com_zsgl_domain_Hotel_hotelLevel" itemValue="id" items="${hotellevels}" path="/hotellevels" z="FHydxqL0B0qX/piu3h3PJ8TDPSA="/>
        <field:input field="image" id="c_com_zsgl_domain_Hotel_image" min="1" required="true" z="YlxOO8wda4H2neNeefsQ5kmFOvQ="/>
        <field:input field="location" id="c_com_zsgl_domain_Hotel_location" z="MQii/Itu0Jhtf6wtTu08/MA8NzE="/>
        <field:input field="attractons" id="c_com_zsgl_domain_Hotel_attractons" z="wK0rFLnbLcanoPu+fKPcdWMLxEo="/>
        <field:datetime dateTimePattern="${hotel_openingtime_date_format}" field="openingTime" id="c_com_zsgl_domain_Hotel_openingTime" z="7RmmwhdlsklJxZ7EezEoQFMLres="/>
        <field:input field="floor" id="c_com_zsgl_domain_Hotel_floor" z="+MLxC0Yhb+jV/H7B37msyeBUu+E="/>
        <field:input field="num" id="c_com_zsgl_domain_Hotel_num" z="3lbsoinfuDWwx8LaTF8ylhlOlpY="/>
        <field:input field="sort" id="c_com_zsgl_domain_Hotel_sort" min="1" required="true" validationMessageCode="field_invalid_integer" z="qR7S+tUs4A+0p/WbuCXhWLjO8oE="/>
        <field:select field="recommend" id="c_com_zsgl_domain_Hotel_recommend" itemValue="id" items="${recommends}" path="/recommends" z="SM/DBLRJ7LRL8ddDIw/f4HvXfk8="/>
        <field:textarea field="remark" id="c_com_zsgl_domain_Hotel_remark" z="Ns1opwxZWVsspKCdNFkm4+d4sF4="/>
        <label>房间：</label>
        <table style="width: 750px;" id="rooms_table">
        	<tr>
        		<th>房型</th>
        		<th>门票</th>
        		<th>床型</th>
        		<th>面积</th>
        		<th>楼层</th>
        		<th>宽带</th>
        		<th>早餐</th>
        		<th>优惠价</th>
        		<th>操作&nbsp;&nbsp;<a href="javascript:void(0);" onclick="addRoom()">添加</a></th>
        	</tr>
        	<c:forEach items="${hotel.rooms}" var="r">
        		<tr>
	        		<td>${r.name }</td>
	        		<td>${r.doorPrice }</td>
	        		<td>${r.bad }</td>
	        		<td>${r.area }</td>
	        		<td>${r.floor }</td>
	        		<td>${r.net }</td>
	        		<td>${r.breakfast }</td>
	        		<td>
	        			日期：<input id="J_input${r.id}" onfocus="show_datePicker(event);" size="10"/>
	        			价格：<input size="6" value="${r.privilege }"/>
	        		</td>
	        		<td>
	        			<input type="button" value="编辑" onclick="edit(this)"/>
	       				<input type="button" value="保存" onclick="save(this, ${r.id }, ${hotel.id })"/>
	       				<input type="button" value="删除" onclick="del(this, ${r.id })">
	       				<script type="text/javascript">
        					bind_event('#J_input${r.id}');
        				</script>
	        		</td>
	        	</tr>
        	</c:forEach>
        </table>
    </form:update>
</div>
