<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User"  %>
<%@ page import ="model_Medal.AtmMedal" %>
 <%
 	//セッションスコープに保存されたユーザー情報を取得
  User loginUser = (User)session.getAttribute("loginUser");

 //AtmMedalクラスのatmMedal = 3000;に設定
 	AtmMedal  AtMeda =  (AtmMedal) application.getAttribute("atmMedal");
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>8LINE SLOT</title>
</head>
<body>
<p>現在の手持ちメダル : <%= AtMeda.getAtm_medal()  %> 枚</p>


<p>コインを何枚いれますか？</p>

<form action="/0604AM11/AtmResult"  method="post">
投入メダル<input type="text" name ="medal">
<input type="submit" value="GO！！">
</form>



</body>
</html>