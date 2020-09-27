<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="model.User" %>
 <%@ page import ="model_Medal.AtmMedal " %>
 <%
 	//セッションスコープに保存されたユーザー情報を取得
  User loginUser = (User)session.getAttribute("loginUser");

 	AtmMedal  AtMeda =  (AtmMedal) application.getAttribute("atmMedal");
 %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カジノマップ</title>
</head>
<body>
<p><%= loginUser.getName() %>さん,ログイン中</p>
<p>現在の手持ちメダル : <%= AtMeda.getAtm_medal()  %> 枚</p>

<p>好きなゲームを選んでください</p>

<a href ="/0604AM11/8LINE SLOT.jsp ">8LINE SLOT</a><br>
<a href =" ">3LINE SLOT(準備中)</a><br>
<a href =" ">BINGO(準備中)</a><br>
</body>
</html>