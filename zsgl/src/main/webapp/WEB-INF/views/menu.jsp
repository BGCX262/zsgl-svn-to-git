<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" tagdir="/WEB-INF/tags/menu" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>	
<div id="menu">
    <menu:menu id="_menu" z="nZaf43BjUg1iM0v70HJVEsXDopc=">
    	<menu:category id="c_hotelorder" z="mugnWcxBA0xyH3MJLuJfd9CIOXo=">
            <sec:authorize ifAllGranted="ROLE_ROOT">
                <menu:item id="i_hotelorder_new" messageCode="global_menu_new" url="/hotelorders?form" z="NrTTStClF6OvsvWMrIf9C/MZ9Co="/>
                <menu:item id="i_hotelorder_list" messageCode="global_menu_list" url="/hotelorders?page=1&amp;size=${empty param.size ? 10 : param.size}" z="1nMrFcQBB3pPQZjphq6wlBXrm3A="/>
            </sec:authorize>
            <menu:item id="state1" messageCode="menu_queren" url="/hotelorders/hotelorder?state=1"/>
            <menu:item id="state2" messageCode="menu_zhengzaichuli" url="/hotelorders/hotelorder?state=2"/>
            <menu:item id="state3" messageCode="menu_weiqueren" url="/hotelorders/hotelorder?state=3"/>
        </menu:category>
        <menu:category id="c_tourorder" z="sWts1ZGgeh55zhslNZYOlQB2dDM=">
            <sec:authorize ifAllGranted="ROLE_ROOT">
                <menu:item id="i_tourorder_new" messageCode="global_menu_new" url="/tourorders?form" z="Qdsf6R1a+Zcf3mFrINpAglaRvJo="/>
                <menu:item id="i_tourorder_list" messageCode="global_menu_list" url="/tourorders?page=1&amp;size=${empty param.size ? 10 : param.size}" z="Mz+rjbr3xv0m7qmQ0OTvzXEvLWE="/>
            </sec:authorize>
            <menu:item id="state1" messageCode="menu_queren" url="/hotelorders/hotelorder?state=1"/>
            <menu:item id="state2" messageCode="menu_zhengzaichuli" url="/hotelorders/tourorder?state=2"/>
            <menu:item id="state3" messageCode="menu_weiqueren" url="/hotelorders/tourorder?state=3"/>
        </menu:category>
    	<menu:category id="xx" label="旅游">
    		<c:forEach items="${tourTypes }" var="o">
    			<menu:item url="/tourss?type=${o.id }" id="xx" label="${o.name }"/>
    		</c:forEach>
    	</menu:category>
		<menu:category id="xx" label="酒店">
			<c:forEach items="${hotelAddress }" var="o">
				<menu:item url="/hotelss?hotelAddress=${o.id }" id="xx" label="${o.name }"/>
			</c:forEach>
		</menu:category>
        <menu:category id="xx" label="攻略">
		<menu:item url="/strategys/all?type=1" id="xx" label="旅游攻略"/>
        	<menu:item url="/strategys/all?type=2" id="xx" label="桂林娱乐"/>
        	<menu:item url="/strategys/all?type=3" id="xx" label="桂林购物"/>
        	<menu:item url="/strategys/all?type=4" id="xx" label="桂林美食"/>
        	<menu:item url="/strategys/all?type=5" id="xx" label="桂林攻略"/>
        </menu:category>
        
        <menu:category id="c_diytour" z="Tw1a5OQ5JhoJk3ZI6gCuJJ981+I=">
            <menu:item id="i_diytour_new" messageCode="global_menu_new" url="/diytours?form" z="NwFkH0WTbgeb/h6GnJ2nOkaUsJE="/>
            <menu:item id="i_diytour_list" messageCode="global_menu_list" url="/diytours?page=1&amp;size=${empty param.size ? 10 : param.size}" z="xYw0sCINIM7eERnQ+U7IJHOdt3E="/>
        </menu:category>
        <menu:category id="c_overseastour" z="C0bpGWVyn3+20aHyayNFD4S1GWo=">
            <menu:item id="i_overseastour_new" messageCode="global_menu_new" url="/overseastours?form" z="XkxHos8cVdB5j97JWCTvrYShipQ="/>
            <menu:item id="i_overseastour_list" messageCode="global_menu_list" url="/overseastours?page=1&amp;size=${empty param.size ? 10 : param.size}" z="ciiuIkLz0pJVR2HdYWNI1kK7pGc="/>
        </menu:category>
        <menu:category id="c_meetingtour" z="0jRmCqlHxIn1rLFxgnFcz4auRl0=">
            <menu:item id="i_meetingtour_new" messageCode="global_menu_new" url="/meetingtours?form" z="bz4vyY3l4s5lEurLsVzLIK8huP8="/>
            <menu:item id="i_meetingtour_list" messageCode="global_menu_list" url="/meetingtours?page=1&amp;size=${empty param.size ? 10 : param.size}" z="z5z9L9RGZMwZcCHsh3yJlNW8Fko="/>
        </menu:category>
        <menu:category id="c_meetingplace" z="emeBHwHgcGEScnRKLPhNxRMUAco=">
            <menu:item id="i_meetingplace_new" messageCode="global_menu_new" url="/meetingplaces?form" z="axZwZL++7FgZdJILZqeDFF0XSzU="/>
            <menu:item id="i_meetingplace_list" messageCode="global_menu_list" url="/meetingplaces?page=1&amp;size=${empty param.size ? 10 : param.size}" z="EzNrFRgitolT/fOxGZ1yx8P0Pzw="/>
        </menu:category>
        <menu:category id="c_meetinghotel" z="3j+2pUev5Ljaniyr3yJr7Pf4Qzc=">
            <menu:item id="i_meetinghotel_new" messageCode="global_menu_new" url="/meetinghotels?form" z="pHOaMXiFPDeithcYCJ9eqkPgHc8="/>
            <menu:item id="i_meetinghotel_list" messageCode="global_menu_list" url="/meetinghotels?page=1&amp;size=${empty param.size ? 10 : param.size}" z="JwPAWHGjki1nBi86I25Dpv9Wlcg="/>
        </menu:category>
        <menu:category id="c_cases" z="WdkeodNeNcnYL4vRJUsELhAw5yo=">
            <menu:item id="i_cases_new" messageCode="global_menu_new" url="/caseses?form" z="2xkK9/msRUYZm0s6I/DU0lkcuZU="/>
            <menu:item id="i_cases_list" messageCode="global_menu_list" url="/caseses?page=1&amp;size=${empty param.size ? 10 : param.size}" z="XcZae8n+FaANPryK87SOcEKTNDI="/>
        </menu:category>
        <menu:category id="c_strategy" z="YJOmc068hAX1PGl4tWuC0aoaL14=">
            <menu:item id="i_strategy_new" messageCode="global_menu_new" url="/strategys?form" z="5xNIIwavij5D+fiT5GECO++cekI="/>
            <menu:item id="i_strategy_list" messageCode="global_menu_list" url="/strategys?page=1&amp;size=${empty param.size ? 10 : param.size}" z="vOB7JuXHBsY0Hz7KdcGjW8YK1OU="/>
        </menu:category>
        <menu:category id="c_scenic" z="PkyOaQ0IKhccSKVuun4PL85pgbw=">
            <menu:item id="i_scenic_new" messageCode="global_menu_new" url="/scenics?form" z="axqrxIDqksBNjLQitdgbOcTA8Pc="/>
            <menu:item id="i_scenic_list" messageCode="global_menu_list" url="/scenics?page=1&amp;size=${empty param.size ? 10 : param.size}" z="ym8SUlPo7PBdhNKoHU5dgyrHUMY="/>
        </menu:category>
        <menu:category id="c_poster" z="AiH27xPjCt1Mk2oSQnBf2Rh+pvI=">
            <menu:item id="i_poster_new" messageCode="global_menu_new" url="/posters?form" z="d8d1YR5Ry7sZ+IIZAEWW/zWktFI="/>
            <menu:item id="i_poster_list" messageCode="global_menu_list" url="/posters?page=1&amp;size=${empty param.size ? 10 : param.size}" z="/sav8spboAdB0vmG/YmdypfFgsc="/>
        </menu:category>
        <menu:category id="c_link" z="SPJgWbk3mCBigtdIiyM6NrKnDYo=">
            <menu:item id="i_link_new" messageCode="global_menu_new" url="/links?form" z="n7jlbYMNhqR/1Kw9hMLy69e3jqo="/>
            <menu:item id="i_link_list" messageCode="global_menu_list" url="/links?page=1&amp;size=${empty param.size ? 10 : param.size}" z="wY6kp12QvbbSwuPbsra/KIpzZU0="/>
        </menu:category>
        <menu:category id="xx" label="公司账号">
        	<c:forEach items="${accountTypes }" var="o">
        		<menu:item url="/companyaccountss?type=${o.id }" id="xx" label="${o.name }"/>
        	</c:forEach>
        </menu:category>
        <menu:category id="c_mettingservice" z="xm8rSKZrynmJHUdV7sFNYrJJtS4=">
            <sec:authorize ifAllGranted="ROLE_ROOT">
                <menu:item id="i_mettingservice_new" messageCode="global_menu_new" url="/mettingservices?form" z="TL4cxHmynRDDcBtfAYkvPcj6CIE="/>
            </sec:authorize>
            <menu:item id="i_mettingservice_list" messageCode="global_menu_list" url="/mettingservices?page=1&amp;size=${empty param.size ? 10 : param.size}" z="vrdLItVB6C8ZHZFk6JzNyUI2h9g="/>
        </menu:category>
        <menu:category id="c_company" z="tmJjNcrRZwdZqruFqwG+TB5GMek=">
            <sec:authorize ifAllGranted="ROLE_ROOT">
                <menu:item id="i_company_new" messageCode="global_menu_new" url="/companys?form" z="SWjXbZ96+4L3yJZ+Q7yyqEFQPV4="/>
            </sec:authorize>
            <menu:item id="i_company_list" messageCode="global_menu_list" url="/companys?page=1&amp;size=${empty param.size ? 10 : param.size}" z="vk1qspgPYbGCO4tYu2Ikm8DhmbY="/>
        </menu:category>
        <menu:category id="c_navmenu" z="6joSn2EDnud7SwezznSZdRWqvQg=">
            <sec:authorize ifAllGranted="ROLE_ROOT">
                <menu:item id="i_navmenu_new" messageCode="global_menu_new" url="/navmenus?form" z="qNuf2YhKlwB32Bo3k6jHpQMOlSA="/>
            </sec:authorize>
            <menu:item id="i_navmenu_list" messageCode="global_menu_list" url="/navmenus?page=1&amp;size=${empty param.size ? 10 : param.size}" z="h4pStFZKbuMBcqhsLoQPITB2MwU="/>
        </menu:category>
        <menu:category id="c_globalresource" z="lQX2xL3utXfW2FW7nO76IShqLbk=" label="全部资源">
	    <sec:authorize ifAllGranted="ROLE_ROOT">	
	            <menu:item id="i_globalresource_new" messageCode="global_menu_new" url="/globalresources?form" z="KDVT+bRh3euQnzqElES5BduZMZQ="/>
	    </sec:authorize>
            <menu:item id="i_globalresource_list" messageCode="global_menu_list" url="/globalresources?page=1&amp;size=${empty param.size ? 10 : param.size}" z="apH3WXc9vsFLncRaUDJ1l0Aa+Wk="/>
        </menu:category>
        <!-- ROLE_ADMIN -->
        <sec:authorize ifAllGranted="ROLE_ADMIN">
            <menu:category id="c_tourtype" z="6IbvfNmO7CfWQRJp8KcCEFgTGUM=">
                <menu:item id="i_tourtype_new" messageCode="global_menu_new" url="/tourtypes?form" z="ilmgZwBPAyLEuZeA1quH8/eRtDk="/>
                <menu:item id="i_tourtype_list" messageCode="global_menu_list" url="/tourtypes?page=1&amp;size=${empty param.size ? 10 : param.size}" z="nk5aTGGS7Hlmj63LuAp+o437ZWI="/>
            </menu:category>
            <menu:category id="c_scenicaddress" z="67N2oOPmwu6WCZuWNoLhnuwWtjE=">
	            <menu:item id="i_scenicaddress_new" messageCode="global_menu_new" url="/scenicAddresses?form" z="Y5FJ00qLk9te/ZeLUkKRSAFNKyI="/>
	            <menu:item id="i_scenicaddress_list" messageCode="global_menu_list" url="/scenicAddresses?page=1&amp;size=${empty param.size ? 10 : param.size}" z="U9fLa8jDWFCC7Jx1UW5fpjc+guQ="/>
	        </menu:category>
	        <menu:category id="c_overseastouraddress" z="9LkiTQCYZtCxADoqjj8OmZFOqY0=">
	            <menu:item id="i_overseastouraddress_new" messageCode="global_menu_new" url="/verseastouraddresses?form" z="nkmcAiqkiZ/Mnl43YGjw+m+xUXE="/>
	            <menu:item id="i_overseastouraddress_list" messageCode="global_menu_list" url="/verseastouraddresses?page=1&amp;size=${empty param.size ? 10 : param.size}" z="PT2Zco3MawkfQ1zv5KyBRqNE1o8="/>
	        </menu:category>
        </sec:authorize>
        <!-- ROLE_ROOT -->
        <sec:authorize ifAllGranted="ROLE_ROOT">
        	<menu:category id="c_hotel" z="7C2zkXEvMSfnPf6jh5Nc/V6fQEY=">
	            <menu:item id="i_hotel_new" messageCode="global_menu_new" url="/hotels?form" z="/WBsNr/VgyUOmLXLfXZU5LJT9sY="/>
	            <menu:item id="i_hotel_list" messageCode="global_menu_list" url="/hotels?page=1&amp;size=${empty param.size ? 10 : param.size}" z="FOElud587FYY5+wmWtI8bb6O3OY="/>
	        </menu:category>
	        <menu:category id="c_tour" z="C6p244zFqzAjqBDekvr/9Z/ULlg=">
	            <menu:item id="i_tour_new" messageCode="global_menu_new" url="/tours?form" z="dptx9t+ej0d6l1WqfMnXTHInKcs="/>
	            <menu:item id="i_tour_list" messageCode="global_menu_list" url="/tours?page=1&amp;size=${empty param.size ? 10 : param.size}" z="xB9X5ir3YmUhi0qAcJD5NMjpiMQ="/>
	        </menu:category>
	        <menu:category id="c_companyaccount" z="4tp9WHqKZzFdScVLy7wlrrl9Xb0=">
	            <menu:item id="i_companyaccount_new" messageCode="global_menu_new" url="/companyaccounts?form" z="fYfJhzZt92kqHORotSZZPfNsNOY="/>
	            <menu:item id="i_companyaccount_list" messageCode="global_menu_list" url="/companyaccounts?page=1&amp;size=${empty param.size ? 10 : param.size}" z="EB33Hbazb96xOTAZrRdLaHSup8k="/>
	        </menu:category>
            <menu:category id="c_room" z="e3e6qTdks0EVUaGbVSSNbM0HcXc=">
                <menu:item id="i_room_new" messageCode="global_menu_new" url="/rooms?form" z="fvAkKg908k/4/1ftKfhIuAeNmjE="/>
                <menu:item id="i_room_list" messageCode="global_menu_list" url="/rooms?page=1&amp;size=${empty param.size ? 10 : param.size}" z="M5XFOS8myAtDzhNTcTwqAph0QtQ="/>
            </menu:category>
            <menu:category id="c_hoteladdress" z="FKXlUoG3PjggTdgmuUBhiKtGel0=">
                <menu:item id="i_hoteladdress_new" messageCode="global_menu_new" url="/hoteladdresses?form" z="/WxMGCsXzWE/kf4E7V+rAMcI050="/>
                <menu:item id="i_hoteladdress_list" messageCode="global_menu_list" url="/hoteladdresses?page=1&amp;size=${empty param.size ? 10 : param.size}" z="+4Vh76c2CLDHxLsYRkiKLcAZlRI="/>
            </menu:category>
            <menu:category id="c_tourday" z="xebrnYX92QSD3WXbtuullUA6MmE=">
                <menu:item id="i_tourday_new" messageCode="global_menu_new" url="/tourdays?form" z="j4+4aj8cvWa6yHwTSvQ6bwRoGe0="/>
                <menu:item id="i_tourday_list" messageCode="global_menu_list" url="/tourdays?page=1&amp;size=${empty param.size ? 10 : param.size}" z="IgordBSSH1IimtAJrCyJRbhKCmg="/>
            </menu:category>
            <menu:category id="c_hotellevel" z="DaSOrNeLk/3wBgMWaLGtjMJ8+xM=">
                <menu:item id="i_hotellevel_new" messageCode="global_menu_new" url="/hotellevels?form" z="Y0uugmmTpxbNf/Racp1IMpsiOVA="/>
                <menu:item id="i_hotellevel_list" messageCode="global_menu_list" url="/hotellevels?page=1&amp;size=${empty param.size ? 10 : param.size}" z="5zY9DOEJ9utbgnLFXymyzrlDVi4="/>
            </menu:category>
            <menu:category id="c_touraddress" z="rshcjKUmpmCu7wFbfYebg71sKaM=">
                <menu:item id="i_touraddress_new" messageCode="global_menu_new" url="/touraddresses?form" z="ScJDwdfJtPB6C7mqNT+yjGF3R80="/>
                <menu:item id="i_touraddress_list" messageCode="global_menu_list" url="/touraddresses?page=1&amp;size=${empty param.size ? 10 : param.size}" z="mNcyMf+MmyWHUJugUAeLhq4duS4="/>
            </menu:category>
            <menu:category id="c_roomstate" z="Gqk+byxqI1FJoiobMpsLe4wMI1I=">
                <menu:item id="i_roomstate_new" messageCode="global_menu_new" url="/roomstates?form" z="us/0YwZARDLLrVfY95R+yxJ5hc8="/>
                <menu:item id="i_roomstate_list" messageCode="global_menu_list" url="/roomstates?page=1&amp;size=${empty param.size ? 10 : param.size}" z="v1KqJDQIR+2ezWmPM2HNFglPhHE="/>
            </menu:category>
            <menu:category id="c_roomtype" z="Y/+UDmgtAjw+Ac2Rp2rDwAjkE78=">
                <menu:item id="i_roomtype_new" messageCode="global_menu_new" url="/roomtypes?form" z="4qtE0IN/50xkY2NoUmhONG3LthU="/>
                <menu:item id="i_roomtype_list" messageCode="global_menu_list" url="/roomtypes?page=1&amp;size=${empty param.size ? 10 : param.size}" z="I0scyAa1pmjxbJm6+JNKvoSDzw8="/>
            </menu:category>
            <menu:category id="c_affirm" z="o2kDUJbF4BwS1M04OHQCRmRQhWo=">
                <menu:item id="i_affirm_new" messageCode="global_menu_new" url="/affirms?form" z="7xRWwMv2kHffjZ8QBTgKWwPKvyw="/>
                <menu:item id="i_affirm_list" messageCode="global_menu_list" url="/affirms?page=1&amp;size=${empty param.size ? 10 : param.size}" z="9N3GbbRVJxws1EWXHrU5hJl2bJM="/>
            </menu:category>
            <menu:category id="c_badtype" z="XXGCR7AScHQ4LuOY4AbEB42N0bI=">
                <menu:item id="i_badtype_new" messageCode="global_menu_new" url="/badtypes?form" z="/V9D7wENSrDNVSvPa2bwa0osbtw="/>
                <menu:item id="i_badtype_list" messageCode="global_menu_list" url="/badtypes?page=1&amp;size=${empty param.size ? 10 : param.size}" z="mhcK3le7HWi5Kd0Ng9QrQHpdJa8="/>
            </menu:category>
            <menu:category id="c_strength" z="tym8TvY5LJEGMMkHYeE4PvL4qpg=">
                <menu:item id="i_strength_new" messageCode="global_menu_new" url="/strengths?form" z="vTj0CGjqU4GXAdmOZ6kgJVi6LNw="/>
                <menu:item id="i_strength_list" messageCode="global_menu_list" url="/strengths?page=1&amp;size=${empty param.size ? 10 : param.size}" z="rEfPH1LReDGiWhnIsWPA4tJIWaI="/>
            </menu:category>
            <menu:category id="c_orderstate" z="Ino84Ci4n6hrgF/3juJvujlrwtg=">
                <menu:item id="i_orderstate_new" messageCode="global_menu_new" url="/orderstates?form" z="aNfmfVP2dG71Ka16jsLGIQF8I1A="/>
                <menu:item id="i_orderstate_list" messageCode="global_menu_list" url="/orderstates?page=1&amp;size=${empty param.size ? 10 : param.size}" z="DrYLrSrJQKp3wqndbhFbEmh6o9g="/>
            </menu:category>
            <menu:category id="c_click" z="FF67s4tBNHcVdlOOjKZ9D9UtC0Y=">
                <menu:item id="i_click_new" messageCode="global_menu_new" url="/clicks?form" z="7U8YH3Xmo/zB4NrtEmTFyuoO4yc="/>
                <menu:item id="i_click_list" messageCode="global_menu_list" url="/clicks?page=1&amp;size=${empty param.size ? 10 : param.size}" z="OrWfHomUyZBCt0NneRif2PSB0M0="/>
            </menu:category>
            <menu:category id="c_baseorder" z="VwXAov1eJcktfVxNzDkMWUaD4Cw=">
                <menu:item id="i_baseorder_new" messageCode="global_menu_new" url="/baseorders?form" z="XeP+CiTk74o0SZLZFtINCJ3BW2c="/>
                <menu:item id="i_baseorder_list" messageCode="global_menu_list" url="/baseorders?page=1&amp;size=${empty param.size ? 10 : param.size}" z="xJ2x79NIXXtGy/OnzWN4utj6UBU="/>
            </menu:category>
            <menu:category id="c_banktype" z="PBRBi3qvXtpUs8FMSgggOwG0pcI=">
                <menu:item id="i_banktype_new" messageCode="global_menu_new" url="/banktypes?form" z="IYZEPOS6n/G2q0Ns9BGhMbKHC0g="/>
                <menu:item id="i_banktype_list" messageCode="global_menu_list" url="/banktypes?page=1&amp;size=${empty param.size ? 10 : param.size}" z="wAaENR9O0aiVVqvuiS8r574KD+A="/>
            </menu:category>
            <menu:category id="c_recommend" z="BO17P5wH+07sACNGHdfZ2PyeUfM=">
                <menu:item id="i_recommend_new" messageCode="global_menu_new" url="/recommends?form" z="tqgwY7lqhyw+VzxnllfBLUdLoHg="/>
                <menu:item id="i_recommend_list" messageCode="global_menu_list" url="/recommends?page=1&amp;size=${empty param.size ? 10 : param.size}" z="WW5nnuyBkCRoQApUh7S9TBJh6NE="/>
            </menu:category>
            <menu:category id="c_price" z="sMt19u+GF1mBRk7bWZ6LxZJAG9w=">
                <menu:item id="i_price_new" messageCode="global_menu_new" url="/prices?form" z="zuvha0eqUPyZK3OdFeo7wqP5Rks="/>
                <menu:item id="i_price_list" messageCode="global_menu_list" url="/prices?page=1&amp;size=${empty param.size ? 10 : param.size}" z="lLWJobizhUzrLz7mwLpjgViCCjU="/>
            </menu:category>
            <menu:category id="c_accounttype" z="aD5VZAx3DkuT23dxMutT8yGo5w8=">
	            <menu:item id="i_accounttype_new" messageCode="global_menu_new" url="/accounttypes?form" z="h4p5c483DzDs7yH9VUuwajlhw7g="/>
	            <menu:item id="i_accounttype_list" messageCode="global_menu_list" url="/accounttypes?page=1&amp;size=${empty param.size ? 10 : param.size}" z="hAuHnKt1KVSkvxl3ES5xu7oYVOQ="/>
	        </menu:category>
	        <menu:category id="c_strategytype" z="Ha+0ujJK+Bvl8Yg5l3s3TbIGDrI=">
	            <menu:item id="i_strategytype_new" messageCode="global_menu_new" url="/strategytypes?form" z="1if5slz1GDkiHILyEroAPqfj3Sg="/>
	            <menu:item id="i_strategytype_list" messageCode="global_menu_list" url="/strategytypes?page=1&amp;size=${empty param.size ? 10 : param.size}" z="aC9RNVQT58sxi/oGMMfZKpIMtrU="/>
	        </menu:category>
        </sec:authorize>
        
    </menu:menu>
</div>
