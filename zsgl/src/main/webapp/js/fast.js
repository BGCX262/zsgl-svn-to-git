/* 是否启用ajax */
var IS_AJAX = true;
function getUri(o) {
	return $(o).attr("href").replace($("base").attr("href"),"");
}
/* 加载内容 */
function loadContent(o) {
	if(IS_AJAX) location.hash = "t=c/u=" + getUri(o);
	return !IS_AJAX;
}
/* 加载页面 */
function loadPage(o) {
	if(IS_AJAX) location.hash = "t=p/u=" + getUri(o);
	return !IS_AJAX;
}
function fadeIn(container) {
	$(container).hide();
	$(container).fadeIn(1000);
}
/* 读取数据，如果数据已经在缓存中，则直接从缓存读取，如果不在缓存中，则想服务器端读取，并加入缓存 */
function loadData(container, uri) {
	if($(container).data(uri)) {
		$(container).html($(container).data(uri)); 
		fadeIn(container);
	} else {
		$.get(uri, function(data){
			$(container).data(uri, data);
			$(container).html(data);
			fadeIn(container);
		});
	}
}
/* 是否第一次加载，默认为true，当初始化完成以后就变为false，此后一直都是flase */
var firstLoad = true;
/* 正在加载图片 */
var loadImage = '<div style="width: 508px; height:600px; margin:0px auto;"><img src="images/load.gif" height="381" width="508"/></div>';
function ajaxLoad() {
	/* 检测时候有hash的时候，执行ajax读取 */
	if(location.hash != "") {
		/* 是否为内容 */
		var isContent = location.hash.indexOf("t=c") != -1;
		/* 是否为页面 */
		var isPage = location.hash.indexOf("t=p") != -1;
		/* 请求的uri */
		var uri = "ajax/" + location.hash.replace(/.*u=/, "");
		/* 第一次加载的时候如果根路径为/，且uri等于ajax/的时候则不进行ajax加载 */
		if(location.pathname == "/" && uri == "ajax/" && firstLoad) {
			return;
		}
		/* 加载页面或者内容 */
		if (isContent) {
			$("#right_back").html(loadImage);
			loadData("#right_back", uri);
		} else if(isPage) {
			$("#main_back").html(loadImage);
			loadData("#main_back", uri);
		}
	} else if(location.href == $("base").attr("href") && !firstLoad){
		/* 当浏览器后退到首页的时候进行ajax加载 */
		loadData("#main_back", "ajax/");
	}
	firstLoad = false;
}
/* 缓存首页 */
function savePage() {
	if(location.pathname == "/") {
		$("#main_back").data("ajax/", $("#main_back").html());
	}
}
/* 设置标题 */
function setTitle(str) {
	$("title").html(str);
}
/* 菜单事件绑定 */
function bindMenu() {
	$(".nav").click(function(){
		loadPage(this);
		return false;
	});
}
/* 初始化 */
$(function(){
	if(IS_AJAX) {
		bindMenu();
		savePage();
		ajaxLoad();
		$.address.change(ajaxLoad);
		firstLoad = false;
	}
});
