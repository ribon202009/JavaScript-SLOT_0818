<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<title>DOUBLE GAME</title>
</head>

<script >

/*画像のオブジェクト化*/
var $imgs = new Array(10);
	for(i=0; i<10; i++){
   	 $imgs[i] = new Image();
	 $imgs[i].src ="./imageDB/"+ i + ".png";
}





/*** GETパラメーターでDOUBLE GAME(現在のクラス) に変数を渡す作業 ***/
var query  = new Object;
 url = location.search.substring(1).split('&');

for(i=0; url[i]; i++) {
    var k = url[i].split('=');
    query[k[0]] = k[1];
}

/* メインスロットから引き継ぎ（hiddenから取得) */
var $total = query.total_sub ;             // メインスロット : 手持ちメダル
var $bet = query.bet_sub ;                 //メインスロット : BET枚数
var $original_win = query.win_sub ;  //メインスロット : WIN枚数


window.onload = function(){// ページ読み込み時に実行したい処理

	document.SLOT.total.value = $total ;                            // メインスロット : 手持ちメダル
	document.SLOT.bet.value = $bet ;                                //メインスロット : BET枚数
	document.SLOT.original_win.value = $original_win ;  //メインスロット : WIN枚数

	document.SLOT.mes.value ="PUSH START !!"

	$collected_win = $original_win * 2 ;
	/* ↓初回のみ, 場所:collected_winは空白。↓*/
	document.SLOT.tryLuck_win.value = $collected_win ;  //次回 : WINした場合のWIN枚数

	SpecialBonus_Payments();
}


 var $total ;   // メインスロット : 手持ちメダル
 var $bet ;    //メインスロット : BET枚数

 var $original_win ; //メインスロット : WIN枚数

 var $tryLuck_win = 0 ; //次回 : WINした場合のWIN枚数

 var $credit_medal = false ; //コインを貯めない状態
 var $select = 0 ; //selectボタン



 /* ------------------------------------------------------------------------------------------------------------------- */
 function SpecialBonus_Payments(){

	 var pay = [2000,4,4,4,8,50,60,70,100,500] ;

	 $original_win = parseInt ( $original_win ) ;


	 for (var [index, item] of pay.entries()) {//

//10,10,10
	   var $pay10;
		if(index==0){
		  $pay10 = ($bet/8) * item * $original_win ;//
		  document.SLOT.pay10_1LINE.value = $pay10 ;
		}

//9,9,9
		 var $pay9;
		 if(index==9){
		  $pay9 = ($bet/8) * item  * $original_win ;//
		  document.SLOT.pay9_1LINE.value = $pay9 ;
		}

//8,8,8
		 var $pay8;
		 if(index==8){
		  $pay8 = ($bet/8) * item  * $original_win ;//
		  document.SLOT.pay8_1LINE.value = $pay8 ;
		 }

//7,7,7
		 var $pay7;
		 if(index==7){
		  $pay7 = ($bet/8) * item  * $original_win ;//
		  document.SLOT.pay7_1LINE.value = $pay7 ;
		 }

//6,6,6
		 var $pay6;
		 if(index==6){
		  $pay6 = ($bet/8) * item  * $original_win ;//
		  document.SLOT.pay6_1LINE.value = $pay6 ;
		 }

//5,5,5
		 var $pay5;
		 if(index==5){
		  $pay5 = ($bet/8) * item  * $original_win ;//
		  document.SLOT.pay5_1LINE.value = $pay5 ;
		 }

//4,4,4
		 var $pay4;
		 if(index==4){
		  $pay4 = ($bet/8) * item  * $original_win ;//
		  document.SLOT.pay4_1LINE.value = $pay4 ;
		 }

//3,3,3
		 var $pay3;
		 if(index==3){
		  $pay3 = ($bet/8) * item  * $original_win ;//
		  document.SLOT.pay3_1LINE.value = $pay3 ;
		 }

//2,2,2
		 var $pay2;
		 if(index==2){
		 $pay2 = ($bet/8) * item  * $original_win ;//
		  document.SLOT.pay2_1LINE.value = $pay2 ;
		 }

//1,1,1
		 var $pay1;
		 if(index==1){
		  $pay1 = ($bet/8) * item  * $original_win ;//
		  document.SLOT.pay1_1LINE.value = $pay1 ;
		 }

	}//for
 }
 /*-------------------------------------------------------------------------------------------------------------------*/



/* ------------------------------------------
ドラム状態を示す配列
-------------------------------------------- */
var $DR = new Array();

$DR[2] = false ;                                    //上の段 :スロット停止中
$DR[4] = $DR[5] = $DR[6] = false ;   // 下の段 : スロット停止中



/* ------------------------------------------
ゲーム開始関数　状況把握とゲーム開始
-------------------------------------------- */

function GetStart(){

	$DR[2] = true ;                                    //上の段 :スロット回転
	$DR[4] = $DR[5] = $DR[6] =  true ; //下の段 :スロット回転

	$_n=0;


			DoRoll2();

            document.SLOT.mes.value = "PUSH SELECT Button!!";

           	setTimeout("DoRoll4()", 1000);
            setTimeout("DoRoll5()", 1000);
            setTimeout("DoRoll6()", 1000);
          /*   document.roll.elements[0].disabled=true; */
        	/* document.SLOT.btn4.focus();
          	document.SLOT.btn5.focus();
          	document.SLOT.btn6.focus(); */
          	document.getElementById('btn4').focus();
            document.getElementById('btn5').focus();
            document.getElementById('btn6').focus();
}



/* ------------------------------------------
ドラム回転関数、ドラムの画像初期値、速度
-------------------------------------------- */
var  $cl2 = 4 ;
var  $cl4 = $cl5 = $cl6 = 0 ;

var $speed = 200;
var selectnum = Math.floor(Math.random() * imgs.length);

function DoRoll2(){

   if($DR[2]){

	   		function repeat2(){

	   					$cl2++;

	   					if($cl2 >= 10){ $cl2 = 0 ; }

						document.images["CELL2"].src = $imgs[$cl2].src;
						return cl2;
	   			}

    	$set_id2 = setInterval(repeat2,100);//何回も呼び出すとき()をつけない

    		 function Clear2(){
    	    			clearInterval($set_id2);
    		 }
    		  setTimeout(Clear2, 2010);
     } //if

}//DoRoll2


function DoRoll4(){

	if($DR[4]){

			function repeat4(){

					   	$cl4++;

						if($cl4 >= 10){ $cl4 = 0 ; }

						document.images["CELL4"].src = $imgs[$cl4].src;
						return cl4;
			}

			$set_id4 = setInterval(repeat4,100);//何回も呼び出すとき()をつけない
	 }
}

function DoRoll5(){

	if($DR[5]){

		function repeat5(){

						$cl5++;

						if($cl5 >= 10){ $cl5 = 0; }

						document.images["CELL5"].src = $imgs[$cl5].src;
						return cl5;
			}
			$set_id5 = setInterval(repeat5,100);//何回も呼び出すとき()をつけない
    }
}

function DoRoll6(){

	if($DR[6]){

		function repeat6(){

						$cl6++;

						if($cl6 >= 10){ $cl6 = 0; }

						document.images["CELL6"].src = $imgs[$cl6].src;
						 return cl6;
			}
			$set_id6 = setInterval(repeat6,100);//何回も呼び出すとき()をつけない
    }
}


/* document.slide.elements[0].disabled=false; */


/* ------------------------------------------
ドラム停止関数・selectボタンどれか押す→判定処理呼び出し
-------------------------------------------- */

function StopRoll( _n ){

		function Clear4(){
			clearInterval($set_id4);
		}
		if(_n!=4){
		setTimeout(Clear4, 900);
		}
		else if(_n==4){
			setTimeout(Clear4, 1800);
		}

	//---------------------------------------//

		function Clear5(){
			clearInterval($set_id5);
		}
		if(_n!=5){
			setTimeout(Clear5, 700);
		}
		else if(_n==5){
			setTimeout(Clear5, 1800);
		}

	//---------------------------------------//

		function Clear6(){
			clearInterval($set_id6);
		}
		if(_n!=6){
			setTimeout(Clear6, 900);
		}
		else if(_n==6){
			setTimeout(Clear6, 1800);
		}

		//スロットが停止したら,SPECIAL BONUS( ぞろ目 )の判定 (328行目)
		setTimeout(FirstCheck, 1800) ;


    //SPECIAL BONUS( ぞろ目 )の判定
	function FirstCheck(){

		if( ($cl4 == $cl5) && ($cl5 == $cl6) ){  //■1■ SpecialBonusの計算 */
			SpecialBonus();

		}else {
			ready();         //↓の計算の準備。選んだボタンをselectに代入
			DoubleUp(); //■2■ DOUBLE UPの計算 */
 		}

}//StopRoll( _n )



/*-------------------------------------------------------------------------------------------------------------------*/
function SpecialBonus(){

	 var atariSP = [2000,4,4,8,50,60,70,100,500];

		if( ($cl4 == $cl5) && ($cl5 == $cl6) ){                      //★if文_1
				for (var [index, item] of atariSP.entries() ) {  // index
				  if( index == $cl5){ //★if文_2

					  $tryLuck_win = $bet * item ;

					  document.SLOT.collected_win.value = $tryLuck_win ; //今回 : WIN枚数

					  document.SLOT.mes.value ="SPECIAL BONUS !!" ;

					  $collected_win = $tryLuck_win * 2 ; //次回 : WINした場合のWIN枚数→修正必要???

					  document.SLOT.tryLuck_win.value = $collected_win ; //修正必要???

				  } //★if文_2
			} //index
		} //★if文_1
} //SpecialBonus()

/*---------------------------------------------------------------------------------------------------------*/
	function ready(){

			//ユーザーが選択したボタンをselectにいれる,
			//_n→選んだボタンの番号

		if( _n==4 ){

			$select = $cl4 ;

		}else if( _n==5 ){

			$select = $cl5 ;

		}else if( _n==6 ){

			$select=$cl6;
		}

 }//ready()

/*---------------------------------------------------------------------------------------------------------*/

	function DoubleUp(){

	 //●同じ数の場合・・・REPLAY
		if ( $cl2-1 == $select-1 ){//画像変更後の修正箇所

			document.SLOT.mes.value ="REPLAY!! PUSH START !!";

	//●WINの場合
		}else if( $cl2-1< $select-1 ){//画像変更後の修正箇所


			if($original_win >1){

					document.SLOT.collected_win.value = $collected_win ; //今回 : WIN枚数

					document.SLOT.mes.value = "CREDIT or Charenge ?" ;

					/*-----------------------------------------次回の処理--------------------------------------------*/
					$collected_win = $collected_win * 2 ;
					document.SLOT.tryLuck_win.value = $collected_win ; //次回 : WINした場合のWIN枚数
					/*------------------------------------------------------------------------------------------------*/


			}else if( ($collected_win => $original_win * 2 ) && ($collected_win <= 100000) ){//修正必要

					document.SLOT.$collected_win.value = $collected_win ; //今回 : WIN枚数

					document.SLOT.mes.value = "CREDIT or Charenge ?" ;

					/*-----------------------------------------次回の処理--------------------------------------------*/
					$collected_win = $collected_win * 2 ;
					document.SLOT.tryLuck_win.value = $collected_win ;
					/*------------------------------------------------------------------------------------------------*/

					SpecialBonus_TryLuck();

			}


 //●LOSTの場合
		}else if( $cl2-1 > $select -1 ){//画像変更後の修正箇所

			document.SLOT.collected_win.value = 0 ; //今回 : 0枚
	 		document.SLOT.mes.value = "GAME OVER";

	 		 setTimeout(function() {//自動でMAIN SLOTにもどる
	 		 		window.close();
				}, 2000)
			}//setTimeout

	}//●if文

}//DoubleUp()

/*-------------------------------------------------------------------------------------------------------------------*/

 function SpecialBonus_TryLuck(){

	 var atariSP_TryLuck = [2000,4,4,4,8,50,60,70,100,500];


	 for (var [index, item] of atariSP_TryLuck.entries() ) {

//10,10,10
	 var $pay10;
		if(index==0){
		  $pay10 = ($bet/8) * item *  ( $collected_win * 0.7 ) ; //
		  $pay10 = parseInte( $pay10 ) ;
		  document.SLOT.pay10_1LINE.value = $pay10 ;
		}

//9,9,9
		 var $pay9;
		 if(index==9){
		  $pay9 = ($bet/8) * item  *  ( $collected_win * 0.7 ) ; //
		  $pay9 = parseInte($pay9);
		  document.SLOT.pay9_1LINE.value = $pay9 ;
		}

//8,8,8
		 var $pay8;
		 if(index==8){
		  $pay8 = ($bet/8) * item  *  ( $collected_win * 0.7 ) ; //
		  $pay8 = parseInte($pay8);
		  document.SLOT.pay8_1LINE.value = $pay8 ;
		 }

//7,7,7
		 var $pay7;
		 if(index==7){
		  $pay7 = ($bet/8) * item  *  ( $collected_win * 0.7 ) ; //
		  $pay7 = parseInte($pay7);
		  document.SLOT.pay7_1LINE.value = $pay7 ;
		 }

//6,6,6
		 var $pay6;
		 if(index==6){
		  $pay6 = ($bet/8) * item  *   ( $collected_win * 0.7 ) ; //
		  pay6 = parseInte($pay6);
		  document.SLOT.pay6_1LINE.value = $pay6 ;
		 }

//5,5,5
		 var $pay5;
		 if(index==5){
		  $pay5 = ($bet/8) * item  *   ( $collected_win * 0.7 ) ; //
		  pay5 = parseInte($pay5);
		  document.SLOT.pay5_1LINE.value = $pay5 ;
		 }

//4,4,4
		 var $pay4;
		 if(index==4){
		  $pay4 = ($bet/8) * item  *  ( $collected_win * 0.7 ) ; //
		  pay4 = parseInte($pay4);
		  document.SLOT.pay4_1LINE.value = $pay4 ;
		 }

//3,3,3
		 var $pay3;
		 if(index==3){
		  $pay3 = ($bet/8) * item  *  ( $collected_win * 0.7 ) ; //
		  pay3 = parseInte($pay3);
		  document.SLOT.pay3_1LINE.value = $pay3 ;
		 }

//2,2,2
		 var $pay2;
		 if(index==2){
		 $pay2 = ($bet/8) * item  *  ( $collected_win * 0.7 ) ; //
		 pay2 = parseInte($pay2);
		  document.SLOT.pay2_1LINE.value = $pay2 ;
		 }

//1,1,1
		 var $pay1;
		 if(index==1){
		  $pay1 = ($bet/8) * item  *   ( $collected_win * 0.7 ) ; //
		  pay1 = parseInte($pay1) ;
		  document.SLOT.pay1_1LINE.value = $pay1 ;
		 }

	}//for
 }//SpecialBonus_TryLuck()

 /*---------------------------------------------------------------------------------------------------------------------*/

	function Credit() {

     		 	if( ( 1 < $collected_win )  || ( 1 < $tryLuck_win ) ){

     		 		$credit_medal = true ;

     		 		/****■total2( hidden ) : WIN後の合計枚数■****/
     		 		$total2 =
     		 		parseInt($total) + parseInt ( $collected_win / 2 ) ;

     		 	/****MAIN SLOTに■total2( hidden ) : WIN後の合計枚数■を渡す****/
     		 		document.SLOT.total2.value= $total2 ;


     		 /*-------メダルが増える処理--------$total : 開始枚数   $total2 : 終了枚数----------*/
     		 		setInterval ( function(){

     					if( $total <= $total2-1 ){
     						$total++;
     						document.SLOT.total.value = $total ;
     					}

     				},10);
     		 	}//setInterval
           /*---------------------------------------------------------------------------------*/


  				// 親画面にて定義した<div id="result">を取得
     		 	var toMainSlot = window.opener.document.getElementById("result");


     		 	// 親画面に渡す値を ■id="returnvalue" (hidden, name="total2")より取得。
     		 	var fromDoubleGame = document.getElementById("returnvalue");


     		 	//値の受け渡し
     		 	toMainSlot.innerText = fromDoubleGame.value ;


     		 	/*一応、元に戻す*/
     		 	$credit_medal = false;
     		 	$original_win = 0 ;
     		 	$collected_win = 0 ;
     		 	$tryLuck_win = 0 ;


     		 	 setTimeout(function() {//自動で閉じて元のゲームにもどる
 	 		 		window.close();
 				}, 2000)

}//Credit()

</script>


<style >

.totalArea{
	/*  position : absolute; */
	bottom : -100px;
	left : 3px;
}

#payments{
	 position : absolute;
	/* float :left; */
	top : 1px;
}


#win_table{
	position : absolute;
	top :3px;
	left : 140px;
	zoom : 130%;
}

.show{
	position : absolute;
	top : 70px;
	margin : 0px;
	margin-left : 120px;
	zoom : 150%;
}



#bigMes input{
	position : absolute;
	top : 360px;
	right : 100px;
	color : #ff00ff;
  		text-shadow:0 0 10px #FF0;
		 font-size : 20px;
		 text-align : center;
   		border : none ;
    	 outline : none ;
		 background : none;
}

#btn4,#btn5,#btn6 {
margin : 5px;
zoom: reset;
position : relative;
bottom : -40px;
left : 6px;
color: #000000;/* #b1921b */
  border-right: 4px solid #cea82c;
  border-bottom: 10px solid #987c1e;
  border-left: 4px solid #ffed8b;
  border-radius: 0;
  background: -webkit-gradient(linear, right top, left top, from(#ffd75b), color-stop(30%, #fff5a0), color-stop(40%, #fffabe), color-stop(50%, #ffffdb), color-stop(70%, #fff5a0), to(#fdd456));
  background: -webkit-linear-gradient(right, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  background: linear-gradient(-90deg, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);

}

.button input{
/* position : absolute;
bottom : 40px;
 right : 2px; */
position : relative;
bottom : -358px;
left : 15px;
margin : 5px;
color: #000000;/* #b1921b */
  border-right: 4px solid #cea82c;
  border-bottom: 10px solid #987c1e;
  border-left: 4px solid #ffed8b;
  border-radius: 0;
  background: -webkit-gradient(linear, right top, left top, from(#ffd75b), color-stop(30%, #fff5a0), color-stop(40%, #fffabe), color-stop(50%, #ffffdb), color-stop(70%, #fff5a0), to(#fdd456));
  background: -webkit-linear-gradient(right, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  background: linear-gradient(-90deg, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
}

#betArea {
position : absolute;
left :30px;
bottom : 90px;
	color : white;
}

#totalArea {
position : absolute;
left :22px;
bottom : 60px;
		color : white;

}


#betArea input{
position : absolute;
display : inline-block;
float :left;
left :60px;
bottom : -4px;
	 	font-size : 20px;
		color : white;
   		border : none ;
    	 outline : none ;
		 background : none;
}

#totalArea input{
position : absolute;
display : inline-block;
float :left;
left :60px;
bottom : -6px;
		font-size : 20px;
		color : white;
   		border : none ;
    	 outline : none ;
		 background : none;
}

</style>
</head>

<body BGCOLOR="#000000" TEXT="#FFFFFF" >

<FORM NAME="SLOT">

<!----------------------------------------------payments（メダル支払のテーブル） ----------------------------------------------------------->

<p>SPECIAL BONUS</p>

<table id="payments">

<td><pre>  </pre></td>

<tr>
<td style=background-image:url(./image/pay10.png)>101010</td>
<td><div class="payMedal"><INPUT NAME="pay10_1LINE" TYPE="text" SIZE=8.8 VALUE="■■■■■"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay9.png)>9 9 9 </td>
<td><div class="payMedal"><INPUT NAME="pay9_1LINE" TYPE="text" SIZE=8.8 VALUE="□□□□□"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay8.png)>8 8 8 </td>
<td><div class="payMedal"><INPUT NAME="pay8_1LINE" TYPE="text" SIZE=8.8 VALUE="■■■■■"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay7.png)>7 7 7</td>
<td><div class="payMedal"><INPUT NAME="pay7_1LINE" TYPE="text" SIZE=8.8 VALUE="□□□□□"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay6.png)>6 6 6 </td>
<td><div class="payMedal"><INPUT NAME="pay6_1LINE" TYPE="text" SIZE=8.8 VALUE="■■■■■"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay5.png)>5 5 5</td>
<td><div class="payMedal"><INPUT NAME="pay5_1LINE" TYPE="text" SIZE=8.8 VALUE="□□□□□"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay4.png)>4 4 4</td>
<td><div class="payMedal"><INPUT NAME="pay4_1LINE" TYPE="text" SIZE=8.8 VALUE="■■■■■"></div></td>
</tr>


<tr>
<td style=background-image:url(./image/pay3.png)>3 3 3</td>
<td><div class="payMedal"><INPUT NAME="pay3_1LINE" TYPE="text" SIZE=8.8 VALUE="□□□□□"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay2.png)>2 2 2</td>
<td><div class="payMedal"><INPUT NAME="pay2_1LINE" TYPE="text" SIZE=8.8 VALUE="■■■■■"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay1.png)>1 1 1</td>
<td><div class="payMedal"><INPUT NAME="pay1_1LINE" TYPE="text" SIZE=8.8 VALUE="□□□□□"></div></td>
</tr>

</table><!--table→payments-->
<!----------------------------------------------------------------------------->

<table id="win_table"  style="display:inline"><!--class→id  -->
<TR >
<TD >ORIGINAL WIN</TD>
<TD> <INPUT NAME="original_win"  size=12></TD>
</TR>

<TR>
<TH>COLLECTED</TH>
<TD> <INPUT NAME="collected_win" size=12></TD>
</TR>

<TR>
<TH>TRY LUCK</TH>
<TD><INPUT NAME="tryLuck_win"  size=12></TD>
</TR>
</table><!--table→win_table-->



<div id="betArea" >
<TR >BET
<TD ><INPUT NAME="bet" TYPE="text" SIZE=4 ></TD></TR>
</div>

<div id="totalArea" >
<TR >CR
<TD><INPUT NAME="total" TYPE="text" id="total" SIZE=4></TD></TR>
</div>





<!-- スロット表示 -->
<table class="show" CELLSPACING=3>
<TR >
<TD><IMG NAME="CELL1" hidden="hidden" SRC="./image/7.jpg" WIDTH="50" HEIGHT="76"></TD>

<TD><IMG NAME="CELL2" SRC="./imageDB/6.png" WIDTH="50" HEIGHT="76"></TD>

<TD><IMG NAME="CELL3" hidden="hidden"  SRC="./image/7.jpg" WIDTH="50" HEIGHT="76"></TD>
</TR>

<!-- ２列 -->

 <TR >

<TD><IMG NAME="CELL4" SRC="./imageDB/6.png" WIDTH="50" HEIGHT="76"></TD>

<TD><IMG NAME="CELL5" SRC="./imageDB/6.png" WIDTH="50" HEIGHT="76"></TD>

<TD><IMG NAME="CELL6" SRC="./imageDB/6.png" WIDTH="50" HEIGHT="76"></TD>

</TR>
<!-- </table> -->





<!-----------------------------中央にくるメッセージ------------------------------------------->
<div id="bigMes">
<INPUT NAME="mes"  VALUE="PUSH START !!"  size="60" >
</div>








<!-------------------------------------------------------------------------------------------------------------------------------->
<form name="select_bt">
<TR>
<TD><INPUT NAME="btn4"  id= "btn4" TYPE="button" VALUE="SELECT" onClick="StopRoll(4)" size=10></TD>
<TD ><INPUT NAME="btn5" id= "btn5" TYPE="button" VALUE="SELECT" onClick="StopRoll(5)" size=10></TD>
<TD><INPUT NAME="btn6"  id= "btn6"TYPE="button" VALUE="SELECT" onClick="StopRoll(6)" size=10></TD>
</TR>
</form>
<!-------------------------------------------------------------------------------------------------------------------------------->

<div class="button">
<INPUT NAME="start" TYPE="Button" VALUE="START" onClick="GetStart()">
<INPUT NAME="credit"   TYPE="Button" VALUE="CREDIT" onClick="Credit()">
</div>





<!-- 親画面に渡す値 -->
<input  NAME="total2" type="hidden"   id="returnvalue"  /><!--←これが渡される  -->





</table><!--show  -->
</FORM><!--SLOT-->

</body>
</html>

