<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
<div>
    <form:create id="fc_com_zsgl_domain_Hotel" modelAttribute="hotel" path="/hotels" render="${empty dependencies}" z="nVyfVcil/WGxGehpzpCIcpU4vmA=">
        <field:input field="name" id="c_com_zsgl_domain_Hotel_name" min="1" required="true" z="6Msh0wJ8o/CUxPm0Xek/it5H2PU="/>
        <field:textarea2 label="关键字" field="keywords" id="c_com_zsgl_domain_Hotel_keywords" z="HYnyRRDXHwSYDkDaIkUzRSoZIL8="/>
        <field:textarea2 label="描述" field="description" id="c_com_zsgl_domain_Hotel_description" z="/KgMHDKC1nrWZvE/fpkFOTfK63U="/>
        <field:select field="hotelLevel" id="c_com_zsgl_domain_Hotel_hotelLevel" itemValue="id" items="${hotellevels}" path="/hotellevels" z="FHydxqL0B0qX/piu3h3PJ8TDPSA="/>
		<field:input field="openingTime" id="c_com_zsgl_domain_Hotel_openingTime" z="7RmmwhdlsklJxZ7EezEoQFMLres="/>
        <field:input field="image" id="c_com_zsgl_domain_Hotel_image" min="1" required="true" z="YlxOO8wda4H2neNeefsQ5kmFOvQ="/>
        <field:input field="location" id="c_com_zsgl_domain_Hotel_location" z="MQii/Itu0Jhtf6wtTu08/MA8NzE="/>
        <field:input field="attractons" id="c_com_zsgl_domain_Hotel_attractons" z="wK0rFLnbLcanoPu+fKPcdWMLxEo="/>
        <field:input field="floor" id="c_com_zsgl_domain_Hotel_floor" z="+MLxC0Yhb+jV/H7B37msyeBUu+E="/>
        <field:input field="num" id="c_com_zsgl_domain_Hotel_num" z="3lbsoinfuDWwx8LaTF8ylhlOlpY="/>
        <field:input field="sort" id="c_com_zsgl_domain_Hotel_sort" min="1" required="true" validationMessageCode="field_invalid_integer" z="qR7S+tUs4A+0p/WbuCXhWLjO8oE="/>
        <field:select field="recommend" id="c_com_zsgl_domain_Hotel_recommend" itemValue="id" items="${recommends}" path="/recommends" z="SM/DBLRJ7LRL8ddDIw/f4HvXfk8="/>
        <field:textarea field="remark" id="c_com_zsgl_domain_Hotel_remark" z="Ns1opwxZWVsspKCdNFkm4+d4sF4="/>
        <input name="address" type="hidden" value="${param.address }"/>
    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_zsgl_domain_Hotel" render="${not empty dependencies}" z="6doqoRf2J5xOrLUaOYjdBFCn4GE="/>
</div>


