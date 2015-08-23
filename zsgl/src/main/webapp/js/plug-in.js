/* tjlx */
function show_hotel() {
	$("#tz_tour").hide();
	$("#tz_hotel").show();
}
function show_tour() {
	$("#tz_hotel").hide();
	$("#tz_tour").show();
}
/* 初始化tab */
function initTab() {
	/* tourDays */
	$(".days").eq(0).show();
	$(".btn_Day").mouseover(function(){
		$(".days").hide();
		$("#day_" + $(this).attr("id")).show();
	});
	/* level hotels */
	$(".hotels").eq(0).show();
	$(".btn_Hotel").mouseover(function(){
		$(".hotels").hide();
		$("#hotel_" + $(this).attr("id")).show();
	});
}

/* 初始化景点滚动 */
var MyMar=null;
var speed=10;
function Marquee(){
	try{
		var d = document.getElementById("demo");
		var m = document.getElementById("marquePic1");
		if(d.scrollLeft>=m.scrollWidth){
			d.scrollLeft=0;
		}else{
			d.scrollLeft++;
		}
	}catch(e) {
		clearInterval(MyMar);
	}
}
function initMove() {
	if(MyMar != null) {
		clearInterval(MyMar);
	}
	$("#marquePic2").html($("#marquePic1").html());
	$("#demo").mouseover(function(){clearInterval(MyMar);}).mouseout(function(){MyMar=setInterval(Marquee, speed);});
	MyMar = setInterval(Marquee,speed);
}
if($("#demo").length > 0 && MyMar == null) {
	initMove();
}
/* images */
var t = n = 0, count = $("#playShow a").size();
$(function(){
	$("#playShow a:not(:first-child)").hide();
	$("#playText").html($("#playShow a:first-child").find("img").attr('alt'));
	$("#playNum a:first").css({"background":"#FFD116",'color':'#A8471C'});
	$("#playText").click(function(){window.open($("#playShow a:first-child").attr('href'), "_blank");
});
$("#playNum a").click(function() {
   var i = $(this).text() - 1;
   n = i;
   if (i >= count) return;
   $("#playText").html($("#playShow a").eq(i).find("img").attr('alt'));
   $("#playText").unbind().click(function(){window.open($("#playShow a").eq(i).attr('href'), "_blank")})
   $("#playShow a").filter(":visible").hide().parent().children().eq(i).fadeIn(1200);
   $(this).css({"background":"#FFD116",'color':'#A8471C'}).siblings().css({"background":"#D7D6D7",'color':'#000'});
});
$("#play").hover(function() {
	clearInterval(t)}, function(){t = setInterval("showAuto()", 5000);});
});
function showAuto() {
	n = n >= (count - 1) ? 0 : ++n;
	$("#playNum a").eq(n).trigger('click');
}
function initShowImage() {
	t = setInterval("showAuto()", 5000);
}
/* yuding check */
function check_form() {
	var result = true;
	if($.trim($("input[name='groupDate']").val()).length < 1) {
		result = false;
		alert("出发日期未填写");
	} else if($.trim($("input[name='num']").val()).length < 1 && $.trim($("input[name='children']").val()).length < 1) {
		result = false;
		alert("参团人数未填写");
	} else if($.trim($("input[name='contact']").val()).length < 1) {
		result = false;
		alert("联系人未填写");
	} else if($.trim($("input[name='email']").val()).length < 1) {
		result = false;
		alert("邮箱未填写");
	} else if($.trim($("input[name='phone']").val()).length < 1) {
		result = false;
		alert("手机号码未填写");
	}
	if(isNaN($.trim($("input[name='num']").val()))){
		result = false;
		alert("参团人数填写不正确，请填写一个有效的数字");
	} else if(isNaN($.trim($("input[name='children']").val()))){
		result = false;
		alert("参团人数填写不正确，请填写一个有效的数字");
	}
	if(result) {
		$("form").submit();
	}
}

/* cale money */
$(".price").change(function(){
	var result = 0;
	var price1 = $("#price1").html() * 1;
	var price2 = $("#price2").html() * 1;
	var num = $("input[name='num']").val() * 1;
	var children = $("input[name='children']").val() * 1;
	result = price1 * num + price2 * children;
	$("#result").html(result);
	$("input[name='price']").val(result);
});

/* hotel yd check */
function hotel_check() {
	var result = true;
	if($.trim($("input[name='enterDate']").val()).length < 1) {
		result = false;
		alert("入住日期未填写");
	} else if($.trim($("input[name='leaveDate']").val()).length < 1) {
		result = false;
		alert("离开日期未填写");
	} else if($.trim($("input[name='contact']").val()).length < 1) {
		result = false;
		alert("联系人未填写");
	} else if($.trim($("input[name='email']").val()).length < 1) {
		result = false;
		alert("邮箱未填写");
	} else if($.trim($("input[name='phone']").val()).length < 1) {
		result = false;
		alert("手机号码未填写");
	}
	
	if(result) {
		hotelydForm.submit();
	}
}

$("select[name='num']").change(function(){
	var price = $(".price").attr("id");
	var num = $(this).val();
	var result = price * num;
	$(".price").html(result);
	$("input[name='price']").val(result);
});

/* 根据开始结束日期查询酒店价格 */
function queryPrices(hotel_id) {
	var begin = $("#beginDate").val();
	var end = $("#endDate").val();
	if(begin == "") {
		$("#error_message").html("请选择起始日期");
	} else if (end == ""){
		$("#error_message").html("请选择结束日期");
	} else {
		$("#error_message").html("");
		$("#query_result").html("");
		$.get("/query_price", {hotel_id : hotel_id, begin : begin, end : end}, function(data){
			$("#query_result").html(data);
		});
	}
}

initTab();
initShowImage();