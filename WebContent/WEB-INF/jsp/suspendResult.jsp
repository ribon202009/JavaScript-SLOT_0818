<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.User" %>
<%@ page import = "model_Medal.Medal_Beans" %>
<%@ page import = "model_Medal.AtmLogic" %>

<%
	//セッションスコープに保存されたユーザー情報を取得
 User loginUser = (User)session.getAttribute("loginUser") ;


Medal_Beans meda_B = (Medal_Beans) session.getAttribute("SusMedal") ;

AtmLogic AtLo= (AtmLogic) session.getAttribute("result_sus_Medal") ;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>中断後のATM</title>
</head>
<body>
<p>  <%= loginUser.getName() %>さんのメダル</p> <br>
<p>保存したメダル :<%= meda_B.getSuspend_medal() %> 枚</p> <br>
<p>現在の残りメダル枚数 : <%=  AtLo.getResult_sus_Medal()  %>枚</p>

<a href="/0604AM11/CasinoMap.jsp">カジノマップへ戻る</a>


</body>
</html>