<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.User" %>
<%@ page import = "model_Medal.Medal_Beans" %>
<%@ page import = "model_Medal.AtmLogic" %>
<%
	//セッションスコープに保存されたユーザー情報を取得
 User loginUser = (User)session.getAttribute("loginUser") ;

//投入メダル取得
Medal_Beans meda_B = (Medal_Beans) session.getAttribute("PostMedal") ;

AtmLogic AtLo= (AtmLogic) session.getAttribute("resultMedal") ;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>atm確認</title>
</head>
<body>
<p>  <%= loginUser.getName() %>さんのメダル</p> <br>
<p>投入メダル :<%= meda_B.getPost_medal() %> 枚</p> <br>
<p>現在の残りメダル枚数 : <%=  AtLo.getResult_Medal() %>枚</p>

<form action="/0604AM11/MAIN SLOT.jsp"  method="post">
<input type="submit" value="GO！！">



</body>
</html>