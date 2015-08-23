/* hotel functions */
/* 显示日期控件 */
function show_datePicker(e) {
	var d, ipt = e.target;
	d = e.target[$kit.ui.DatePicker.defaultConfig.kitWidgetName];
	if(d) {
		d.show();
	} else {
		d = new $kit.ui.DatePicker({
			dateFormat: 'yyyy-mm-dd',
			date : ipt.value,
			canMultipleChoose: true
		}).init();
		d.adhere(ipt);
		d.show();
	}
}
/* 绑定日期控件关闭事件 */
function bind_event(o) {
	$kit.ev({
		el : document,
		ev : 'click',
		fn : function(e) {
			var input = $kit.el(o);
			d = input[$kit.ui.DatePicker.defaultConfig.kitWidgetName];
			if(d && !$kit.contains(d.picker, e.target) && input != e.target) {
				d.hide();
			}
		}
	});
}
/* 保存  */
function save(o, room_id) {
	var items = $(o).parents("td").siblings(); 
	var r = new Object();
	r.id = room_id;
	r.name = items.eq(0).html();
	r.doorPrice = items.eq(1).html();
	r.bad = items.eq(2).html();
	r.area = items.eq(3).html();
	r.floor = items.eq(4).html();
	r.net = items.eq(5).html();
	r.breakfast = items.eq(6).html();
	r.date = items.eq(7).children().eq(0).val();
	r.price = items.eq(7).children().eq(1).val();
	/* 单独修改房型信息，加上默认的日期跟价格，修正无法保存20120904 */
	if($.trim(r.date).length <= 0) r.date = '2011-11-11';
	if($.trim(r.price).length <= 0) r.price = '1111';
	
//	alert(r.id + ", " + r.name + ", " + r.doorPrice + ", " + r.bad + ", " + r.area + ", " + r.floor + ", " + r.net + ", " + r.breakfast + ", " + r.date + ", " + r.price);
	$.post("/addRoom", {hotel_id : $("#_id_id").val(),
					id : r.id,
					name : r.name,
					doorPrice : r.doorPrice,
					bad : r.bad,
					area : r.area,
					floor : r.floor, 
					net : r.net,
					breakfast : r.breakfast,
					dates : r.date,
					price : r.price}, function(data){
						if(data == "0"){
							alert("保存成功");
							location.reload();
						} else {
							alert("服务器繁忙，请稍后再试");	
						}
					});
	unEdit(o);
}
/* 添加房间 */
function addRoom() {
	var id = $("#rooms_table tr").length;
	var row = '<tr>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td>'+
		'日期：<input id="J_input' + id + '" onfocus="show_datePicker(event);" onload="bind_event(this)" size="10"/> '+
		'价格：<input size="6"/>'+
	'</td>' + 
	'<td>' + 
			'<input type="button" value="编辑" onclick="edit(this)"/>' + 
			'<input type="button" value="保存" onclick="save(this)"/>' + 
			'<input type="button" value="删除" onclick="del(this)">'+
	'</td>' + 
	'</tr>';
	$("#rooms_table").append(row);
	bind_event('#J_input' + id);
	$("#rooms_table tr").last().children("td").attr("contenteditable", "true");
}

/* 删除房间 */
function del(o, room_id) {
	if(room_id) {
		$.get("/delRoom", {hotel_id : $("#_id_id").val(), room_id : room_id}, function(data){
			if(date == "0") {
				alert("删除成功");
			}
		});
	}
	$(o).parents("td").parent("tr").remove();
}
/* 编辑 */
function edit(o) {
	$(o).parents("td").siblings().attr("contenteditable", "true");
}
/* 禁止编辑 */
function unEdit(o) {
	$(o).parents("td").siblings().attr("contenteditable", "false");
}

/**
 * 查询酒店价格
 */
function queryPrices(hotel_id) {
	var begin = $("#beginDate").val();
	var end = $("#endDate").val();
	if(begin == "") {
		$("#error_message").html("请选择起始日期");
	} else if(end == "") {
		$("#error_message").html("请选择结束日期");
	} else {
		$("#error_message").html("");
		$("#query_result").html("");
		$.get("/query_price", {hotel_id : hotel_id, begin : begin, end : end}, function(data){
			alert(data);
//			$("#query_result").html(data);
		});
	}
}
