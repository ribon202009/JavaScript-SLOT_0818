<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.User"  %>

  <%
  /* セッションスコープからユーザー情報を取得 */
  User loginUser =(User)session.getAttribute("loginUser");
  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン確認</title>
</head>
<body>
<% if(loginUser !=null ){ %>
<p>ログイン成功</p>

<p>ようこそ、<%= loginUser.getName() %>さん、カジノゲームへ</p>
<a href="/0604AM11/CasinoMap.jsp">カジノマップへ</a>
<% }else{  %>
<p>ログイン失敗</p>
<a href ="/0604AM11/">ログイン画面へ戻る</a>
<% }  %>
</body>
</html>