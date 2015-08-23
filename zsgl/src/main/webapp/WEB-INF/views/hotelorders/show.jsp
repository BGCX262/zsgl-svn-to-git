<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/form" %>	
<div>
    <page:show create="false" id="ps_com_zsgl_domain_HotelOrder" object="${hotelorder}" path="/hotelorders" update="false" z="user-managed">
        <field:display field="contact" id="s_com_zsgl_domain_HotelOrder_contact" object="${hotelorder}" z="puAG2iwvJAoyvcQ4jGsJ+Tzk/p0="/>
        <field:display field="sex" id="s_com_zsgl_domain_HotelOrder_sex" object="${hotelorder}" z="Cs/3LNEwMuyeiukoj3cwKDEom5I="/>
        <field:display field="email" id="s_com_zsgl_domain_HotelOrder_email" object="${hotelorder}" z="VeTclfxFTn+d+zF4JfA1shR4cro="/>
        <field:display field="phone" id="s_com_zsgl_domain_HotelOrder_phone" object="${hotelorder}" z="Jvq4bcIkfrb7zKhuZH3QyJo9/4I="/>
        <field:display field="callPhone" id="s_com_zsgl_domain_HotelOrder_callPhone" object="${hotelorder}" z="wh/RoZzL4zYGXvEGj0QuQxC7g/M="/>
        <field:display field="qq" id="s_com_zsgl_domain_HotelOrder_qq" object="${hotelorder}" z="c8Ws2PmC/7CtHhLYSxo8vyy1U/U="/>
        <field:display field="affirm" id="s_com_zsgl_domain_HotelOrder_affirm" object="${hotelorder}" z="mqLh4Y0FnvUx1urAfk7UggKQQbc="/>
        <field:display field="message" id="s_com_zsgl_domain_HotelOrder_message" object="${hotelorder}" z="j4CjP/bO3bS3GAMCL0FP95htVEM="/>
        <field:display field="price" id="s_com_zsgl_domain_HotelOrder_price" object="${hotelorder}" z="BXaboiUOamIQ8xiTgrDpuI9oZFk="/>
        <field:display field="name" id="s_com_zsgl_domain_HotelOrder_name" object="${hotelorder}" z="zf5T8O7tCcn/QQfjKyMGvhfVI7g="/>
        <field:display date="true" dateTimePattern="${hotelOrder_enterdate_date_format}" field="enterDate" id="s_com_zsgl_domain_HotelOrder_enterDate" object="${hotelorder}" z="pt11T0NAOLPy1OC/7fHBcScAhiA="/>
        <field:display date="true" dateTimePattern="${hotelOrder_leavedate_date_format}" field="leaveDate" id="s_com_zsgl_domain_HotelOrder_leaveDate" object="${hotelorder}" z="iQa3jriu07ut04EsLyCTnRAwtLs="/>
        <field:display field="num" id="s_com_zsgl_domain_HotelOrder_num" object="${hotelorder}" z="eZRmhS/cr+6OUA5MTDQvY9dwHPo="/>
        <field:display field="room" id="s_com_zsgl_domain_HotelOrder_room" object="${hotelorder}" z="9844FQRJ/3CAu9YOQ4moEbxdCx4="/>
        <field:display field="orderState" id="s_com_zsgl_domain_HotelOrder_orderState" object="${hotelorder}" z="RtLSOGlNyi3z6fsnKTY3ezsy7C4="/>
        <a href="updateorderstate?id=${hotelorder.id }&amp;state=1">确认</a>&nbsp;&nbsp;
        <a href="updateorderstate?id=${hotelorder.id }&amp;state=2">正在处理</a>&nbsp;&nbsp;
        <a href="updateorderstate?id=${hotelorder.id }&amp;state=3">未确认</a>
    </page:show>
</div>
