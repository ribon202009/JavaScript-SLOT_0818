<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="model.User" %>
 <% User  registerUser = ( User )session.getAttribute("registerUser");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録完了</title>
</head>
<body>
<p>登録完了</p>
<br>
<p>ニックネーム : <%=  registerUser.getName() %>さん</p><br>
<p> パスワード : ●●●●</p><br>

<a href ="/0604AM11">ログイン画面へ</a>
</body>
</html>