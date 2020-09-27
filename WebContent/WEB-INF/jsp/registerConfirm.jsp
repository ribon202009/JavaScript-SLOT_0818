<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.User"  %>

    <%
    User registerUser =(User) session.getAttribute("registerUser");/* 登録した情報を呼び出す */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>確認画面</title>
</head>
<body>
<p>下記のユーザーを登録します</p><br>
<p>ニックネーム : <%= registerUser.getName() %> </p>
<p>パスワード : ●●●● </p>


 <a href ="/0604AM11/RegisterUser">戻る</a>
 <a href ="/0604AM11/RegisterUser?action=done">登録</a>
</p>

</body>
</html>