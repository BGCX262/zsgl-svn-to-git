<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>
	<form action="password" method="post">
		旧密码：<input name="password1" type="password"/><br/>
		新密码：<input name="password2" type="password"/><br/>
		<input type="submit" value="修改"/>
	</form>
</body>
</html>