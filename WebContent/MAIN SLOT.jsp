<%@ page language="java" contentType="text/html; charset=Shift_JIS"
pageEncoding="Shift_JIS"%>
<%@ page import = "model_Medal.Medal_Beans" %>

<%
//�������_���擾
Medal_Beans meda_B = (Medal_Beans) session.getAttribute("PostMedal") ;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <link rel="stylesheet" href="reset.css">
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<title>MAIN SLOT</title>
</head>

<script>
/*�摜�̃I�u�W�F�N�g��*/
var $imgs = new Array(10);
	for(i=0; i<10; i++){
   	 $imgs[i] = new Image();
	 $imgs[i].src ="./image/"+ i + ".png";
}

/* -------------------------------------------
�_�������ϐ��Ɠq�������̑����֐�
-------------------------------------------- */

var $t_point = <%= meda_B.getPost_medal() %> ; // �莝�����_��
var $b_point = 8 ;    //BET����

var $credit_medal = false; //�R�C���𒙂߂Ȃ����
var $doubButton = false; //�_�u���Q�[���֐i�܂Ȃ����

var $win = 0 ;
var DbWin = 0;//DOUBLE GAME�����win�����������



function BetCTRL(_n){

	if( !$DR_Row1[0] &&  !$DR_Row1[1]  &&  !$DR_Row1[2] &&
    	 !$DR_Row2[0] &&  !$DR_Row2[1]  &&  !$DR_Row2[2] &&
    	 !$DR_Row3[0] &&  !$DR_Row3[1]  &&  !$DR_Row3[2] ){


        if(_n == 1){ // +�̂Ƃ��P

            if (  ( ($t_point - $b_point) >= 8) &&  ( 8 <= $b_point && $b_point < 80)  ){ //UP����

            			$b_point += 8 ;
                	document.SLOT.bet.value = $b_point;
                	document.SLOT.bet1.value = $b_point;
                	document.SLOT.bet2.value = $b_point;
                	document.SLOT.bet3.value = $b_point;
                	document.SLOT.bet4.value = $b_point;
                	document.SLOT.bet5.value = $b_point;
                	document.SLOT.bet6.value = $b_point;
                	document.SLOT.bet7.value = $b_point;
                	document.SLOT.bet8.value = $b_point;

           			 }

           			else { if($b_point >= 80) {alert('�ō��q��������80���ł��B') ;}
           			else { alert('�莝���s���ł��B����ȏ�BETUP�ł��܂���'); }
           			 }

        }else{

            if( $b_point >= 16 ){//DOWN����

				  		$b_point -=8 ;
               	  		document.SLOT.bet.value = $b_point;

               	  		document.SLOT.bet1.value = $b_point;
                    	document.SLOT.bet2.value = $b_point;
                    	document.SLOT.bet3.value = $b_point;
                    	document.SLOT.bet4.value = $b_point;
                    	document.SLOT.bet5.value = $b_point;
                    	document.SLOT.bet6.value = $b_point;
                    	document.SLOT.bet7.value = $b_point;
                    	document.SLOT.bet8.value = $b_point;


            }else{ alert('�Œ�q��������8���ł�'); }

        }

    }else{ alert('�Q�[������BET�͂ł��܂���');}

}

/* ------------------------------------------
�h������Ԃ������z��
-------------------------------------------- */

var $DR_Row1 = new Array();
var $DR_Row2 = new Array();
var $DR_Row3 = new Array();

$DR_Row1[0] = $DR_Row1[1]= $DR_Row1[2] = false ;
$DR_Row2[0] = $DR_Row2[1]= $DR_Row2[2] = false ;
$DR_Row3[0] = $DR_Row3[1]= $DR_Row3[2] = false ;

/* ------------------------------------------
�Q�[���J�n�֐��@�󋵔c���ƃQ�[���J�n
-------------------------------------------- */

function GetStart(){

		 if (  !$DR_Row1[0] &&  !$DR_Row1[1]  &&  !$DR_Row1[2] &&
    		    !$DR_Row2[0] &&  !$DR_Row2[1]  &&  !$DR_Row2[2] &&
    		    !$DR_Row3[0] &&  !$DR_Row3[1]  &&  !$DR_Row3[2] && !$gameover  ){

        if( ($t_point - $b_point) < 0 ){

            $b_point = $t_point;

            document.SLOT.mes.value = "ALERT !!!";

            alert("�|�����_�����莝���������Ă��܂��̂ŁA�����I��$t_pont�ɕύX���܂��B start�{�^���������Ă��������B");

            document.SLOT.bet.value = $b_point;

        }else{

        $DR_Row1[0] = $DR_Row1[1]= $DR_Row1[2] = true;
        $DR_Row2[0] = $DR_Row2[1]= $DR_Row2[2] = true;
        $DR_Row3[0] = $DR_Row3[1]= $DR_Row3[2] = true;



        document.SLOT.mes.value = "START�I�I�I";
        document.SLOT.win.value =  "0" ;

        	Payments();
            DoRoll1();
          	DoRoll2();
            DoRoll3();
            DoRoll4();
            DoRoll5();
            DoRoll6();
            DoRoll7();
            DoRoll8();
            DoRoll9();


            Show();

            setTimeout(StopRoll,3800);

        }

    }else{

        if(!$navi){ alert('���̃u���E�U�ł̓Q�[�����ł��܂���');

        }else{

            if(!$gameover){ alert('�Q�[����');}

            else{ alert('GAME OVER�@please reset'); }

        }

    }

 } //* navi�̕��� */

/* ------------------------------------------------------------------------------------------------------------------- */
 function Payments(){

	 var pay = [4,4,4,8,50,60,70,100,500,2000];

//10,10,10
	 for ( var [index, item] of pay.entries() ) {//
	 if( index == 9){//
		 var $pay10;

		  $pay10 = ($b_point/8) * item;//
		  document.SLOT.pay10_1LINE.value = $pay10 ;
		  document.SLOT.pay10_2LINE.value = $pay10 * 2;
		  document.SLOT.pay10_3LINE.value = $pay10 * 3;
		  document.SLOT.pay10_4LINE.value = $pay10 * 4;
		  document.SLOT.pay10_5LINE.value = $pay10 * 5;
		  document.SLOT.pay10_6LINE.value = $pay10 * 6;
		  document.SLOT.pay10_7LINE.value = $pay10 * 7;
		  document.SLOT.pay10_8LINE.value = $pay10 * 8;
	  }///index

	 if( index == 8){//
		 var $pay9;
		  $pay9 = ($b_point/8) * item;//
		  document.SLOT.pay9_1LINE.value = $pay9 ;
		  document.SLOT.pay9_2LINE.value = $pay9 * 2;
		  document.SLOT.pay9_3LINE.value = $pay9 * 3;
		  document.SLOT.pay9_4LINE.value = $pay9 * 4;
		  document.SLOT.pay9_5LINE.value = $pay9 * 5;
		  document.SLOT.pay9_6LINE.value = $pay9 * 6;
		  document.SLOT.pay9_7LINE.value = $pay9 * 7;
		  document.SLOT.pay9_8LINE.value = $pay9 * 8;
	  }///index

	 if( index == 7){//
		 var $pay8;
		  $pay8 = ($b_point/8) * item;//
		  document.SLOT.pay8_1LINE.value = $pay8 ;
		  document.SLOT.pay8_2LINE.value = $pay8 * 2;
		  document.SLOT.pay8_3LINE.value = $pay8 * 3;
		  document.SLOT.pay8_4LINE.value = $pay8 * 4;
		  document.SLOT.pay8_5LINE.value = $pay8 * 5;
		  document.SLOT.pay8_6LINE.value = $pay8 * 6;
		  document.SLOT.pay8_7LINE.value = $pay8 * 7;
		  document.SLOT.pay8_8LINE.value = $pay8 * 8;
	  }///index

	 if( index == 6){//
		 var $pay7;
		  $pay7 = ($b_point/8) * item;//
		  document.SLOT.pay7_1LINE.value = $pay7 ;
		  document.SLOT.pay7_2LINE.value = $pay7 * 2;
		  document.SLOT.pay7_3LINE.value = $pay7 * 3;
		  document.SLOT.pay7_4LINE.value = $pay7 * 4;
		  document.SLOT.pay7_5LINE.value = $pay7 * 5;
		  document.SLOT.pay7_6LINE.value = $pay7 * 6;
		  document.SLOT.pay7_7LINE.value = $pay7 * 7;
		  document.SLOT.pay7_8LINE.value = $pay7 * 8;
	  }///index

	 if( index == 5){//
		 var $pay6;
		  $pay6 = ($b_point/8) * item;//
		  document.SLOT.pay6_1LINE.value = $pay6 ;
		  document.SLOT.pay6_2LINE.value = $pay6 * 2;
		  document.SLOT.pay6_3LINE.value = $pay6 * 3;
		  document.SLOT.pay6_4LINE.value = $pay6 * 4;
		  document.SLOT.pay6_5LINE.value = $pay6 * 5;
		  document.SLOT.pay6_6LINE.value = $pay6 * 6;
		  document.SLOT.pay6_7LINE.value = $pay6 * 7;
		  document.SLOT.pay6_8LINE.value = $pay6 * 8;
	  }///index

	 if( index == 4){//
		 var $pay5;
		  $pay5 = ($b_point/8) * item;//
		  document.SLOT.pay5_1LINE.value = $pay5 ;
		  document.SLOT.pay5_2LINE.value = $pay5 * 2;
		  document.SLOT.pay5_3LINE.value = $pay5 * 3;
		  document.SLOT.pay5_4LINE.value = $pay5 * 4;
		  document.SLOT.pay5_5LINE.value = $pay5 * 5;
		  document.SLOT.pay5_6LINE.value = $pay5 * 6;
		  document.SLOT.pay5_7LINE.value = $pay5 * 7;
		  document.SLOT.pay5_8LINE.value = $pay5 * 8;
	  }///index

	 if( index == 3){//
		 var $pay4;
		  $pay4 = ($b_point/8) * item;//
		  document.SLOT.pay4_1LINE.value = $pay4 ;
		  document.SLOT.pay4_2LINE.value = $pay4 * 2;
		  document.SLOT.pay4_3LINE.value = $pay4 * 3;
		  document.SLOT.pay4_4LINE.value = $pay4 * 4;
		  document.SLOT.pay4_5LINE.value = $pay4 * 5;
		  document.SLOT.pay4_6LINE.value = $pay4 * 6;
		  document.SLOT.pay4_7LINE.value = $pay4 * 7;
		  document.SLOT.pay4_8LINE.value = $pay4 * 8;
	  }///index

	 if( index == 2){//
		 var $pay3;
		  $pay3 = ($b_point/8) * item;//
		  document.SLOT.pay3_1LINE.value = $pay3 ;
		  document.SLOT.pay3_2LINE.value = $pay3 * 2;
		  document.SLOT.pay3_3LINE.value = $pay3 * 3;
		  document.SLOT.pay3_4LINE.value = $pay3 * 4;
		  document.SLOT.pay3_5LINE.value = $pay3 * 5;
		  document.SLOT.pay3_6LINE.value = $pay3 * 6;
		  document.SLOT.pay3_7LINE.value = $pay3 * 7;
		  document.SLOT.pay3_8LINE.value = $pay3 * 8;
	  }///index

	 if( index == 1){//
		 var $pay2;
		  $pay2 = ($b_point/8) * item;//
		  document.SLOT.pay2_1LINE.value = $pay2 ;
		  document.SLOT.pay2_2LINE.value = $pay2 * 2;
		  document.SLOT.pay2_3LINE.value = $pay2 * 3;
		  document.SLOT.pay2_4LINE.value = $pay2 * 4;
		  document.SLOT.pay2_5LINE.value = $pay2 * 5;
		  document.SLOT.pay2_6LINE.value = $pay2 * 6;
		  document.SLOT.pay2_7LINE.value = $pay2 * 7;
		  document.SLOT.pay2_8LINE.value = $pay2 * 8;
	  }///index

	 if( index == 0){//
		 var $pay1;
		  $pay1 = ($b_point/8) * item;//
		  document.SLOT.pay1_1LINE.value = $pay1 ;
		  document.SLOT.pay1_2LINE.value = $pay1 * 2;
		  document.SLOT.pay1_3LINE.value = $pay1 * 3;
		  document.SLOT.pay1_4LINE.value = $pay1 * 4;
		  document.SLOT.pay1_5LINE.value = $pay1 * 5;
		  document.SLOT.pay1_6LINE.value = $pay1 * 6;
		  document.SLOT.pay1_7LINE.value = $pay1 * 7;
		  document.SLOT.pay1_8LINE.value = $pay1 * 8;
	  }///index


	}//for
 }
 /* ------------------------------------------------------------------------------------------------------------------- */

 function Show(){

	//DOUBLE GAME��ʂ�total2( WIN��̍��v����)�����C����ʂŕ\��
	 var $result =  document.getElementById("result").innerHTML ; //value��NG

	 //result�ɂ�WIN��̍��v�����������Ă���
	 var $result =  Number($result) ; //parseint��NG


     if( $result > 3){ //�_�u���Q�[���ɐi�񂾌�AWIN LOST�ǂ���ł�

    	//�_�u����ʂœ������������̂ݎ��o��
    	$DbWin = $result - $t_point;
    	 alert("�_�u���̓����薇��" + $DbWin);

    	$b_point = parseInt($b_point) ;
    	$t_point = parseInt($t_point) ;

		//���݂̃g�[�^�����������o��
    	 $t_point = $DbWin + $t_point;
    	 alert("���݂̃g�[�^��"+$t_point);

    	 //�q���������������g�[�^��


    	 $t_point =  $t_point - $b_point ;
    	 alert("�X�^�[�g��������̌��݂̃g�[�^��"+$t_point);
    	/*  document.SLOT.total.value = $t_point ;/ */
    	/*  document.SLOT.total.value = $t_point;//�����C����ʂŕ\��*/



    	document.getElementById("result").innerHTML = $t_point;//0526PM2200�ύX */

    	document.SLOT.total_sub.value = $t_point ;//���_�u����ʂɓn���ihidden)
     	/* document.SLOT.total.value = $result ; *///���̒i : �����薇�����v���\�������B
     	//�C���������ӏ������̌�ɏ�̒i���B������
     	//��̒iname=dbWin��ݒ肵�Ă������ς��Ȃ�

    	 $result = 0;//�Ӗ��Ȃ����ɖ߂��Ȃ��Ǝ���̉�]��else�ɂ����Ȃ�

     }else {//1���

     $t_point -= $b_point ;

     document.SLOT.total.value = $t_point ;//�����C����ʂŕ\��
     document.SLOT.total_sub.value = $t_point ;//���_�u����ʂɓn���p�ihidden)
     document.SLOT.bet_sub.value = $b_point ;//���_�u����ʂɂɓn���p�ihidden)

     }

}//ShowTotal
//-------------------------------------------------------------------------------------//



/* ------------------------------------------
�h������]�֐��A�h�����̉摜�����l�A���x
-------------------------------------------- */
var $cl1 = $cl2 = $cl3 = $cl4 = $cl5 = $cl6 =$cl7 = $cl8 = $cl9 =7;
/* var selectnum = Math.floor(Math.random() * imgs.length); */
 /* $cl1 = Math.floor( Math.random() * 10 );//�X�܂ł̐��� */

var $speed = 80;

/*----------------------------------------------------------------------*/

function DoRoll1(){

    if($DR_Row1[0]){ /* $DR[1] */

    		function repeat1(){
					$cl1++;

			if($cl1 >= 10){ $cl1 = 0; }
				document.images["CELL1"].src = $imgs[$cl1].src;
				return cl1;
			}
	$set_id1 = setInterval(repeat1, $speed);//������Ăяo���Ƃ�()�����Ȃ�


		function Clear1(){
			clearInterval($set_id1);
		}
		setTimeout(Clear1, 	3600);

	}//  if($DR_Row1[1])

}//DoRoll

/*------------------------------------------------------------------------------------*/
function DoRoll2(){

    if($DR_Row1[1]){
		function repeat2(){
					$cl2++;

				if($cl2 >= 10){ $cl2 = 0; }
				document.images["CELL2"].src = $imgs[$cl2].src;
				return cl2;
			}
		$set_id2 = setInterval(repeat2, $speed);//������Ăяo���Ƃ�()�����Ȃ�

 		function Clear2(){
			clearInterval($set_id2);
 		}
  		setTimeout(Clear2, 3600);

    }//  if($DR_Row1[1])

}//DoRoll
/*------------------------------------------------------------------------------------*/

function DoRoll3(){

    if($DR_Row1[2]){

   		function repeat3(){
			$cl3++;

		if($cl3 >= 10){ $cl3 = 0; }
			document.images["CELL3"].src = $imgs[$cl3].src;
			return cl3;
		}

   		$set_id3 = setInterval(repeat3, $speed);//������Ăяo���Ƃ�()�����Ȃ�

	function Clear3(){
		clearInterval($set_id3);
	}
	setTimeout(Clear3, 3600);

	}//  if($DR_Row1[1])

}//DoRoll

/*------------------------------------------------------------------------------------*/

function DoRoll4(){

    if($DR_Row2[0]){

   		function repeat4(){
			$cl4++;

	if($cl4 >= 10){ $cl4 = 0; }
		document.images["CELL4"].src = $imgs[$cl4].src;
		return cl4;
	}
$set_id4 = setInterval(repeat4, $speed);//������Ăяo���Ƃ�()�����Ȃ�

function Clear4(){
	clearInterval($set_id4);
}
setTimeout(Clear4, 3280);

}//  if($DR_Row1[1])

}//DoRoll

/*------------------------------------------------------------------------------------*/
function DoRoll5(){

    if($DR_Row2[1]){

    	   		function repeat5(){
    				$cl5++;

    		if($cl5 >= 10){ $cl5 = 0; }
    			document.images["CELL5"].src = $imgs[$cl5].src;
    			return cl5;
    		}
    	$set_id5 = setInterval(repeat5, $speed);//������Ăяo���Ƃ�()�����Ȃ�

    	function Clear5(){
    		clearInterval($set_id5);
    	}
    	setTimeout(Clear5, 3400);

    	}//  if($DR_Row1[1])

   }//DoRoll

  /*------------------------------------------------------------------------------------*/
function DoRoll6(){

    if($DR_Row2[2]){

    	function repeat6(){
			$cl6++;

		if($cl6 >= 10){ $cl6 = 0; }
			document.images["CELL6"].src = $imgs[$cl6].src;
			return cl6;
		}

    	$set_id6 = setInterval(repeat6, $speed);//������Ăяo���Ƃ�()�����Ȃ�

	function Clear6(){
		clearInterval($set_id6);
	}
	setTimeout(Clear6, 2700);

	}//  if($DR_Row1[1])

}//DoRoll

/*------------------------------------------------------------------------------------*/
function DoRoll7(){

    if($DR_Row3[0]){

    	function repeat7(){
			$cl7++;

		if($cl7 >= 10){ $cl7 = 0; }
			document.images["CELL7"].src = $imgs[$cl7].src;
			return cl7;
		}

    	$set_id7 = setInterval(repeat7, $speed);//������Ăяo���Ƃ�()�����Ȃ�

	function Clear7(){
		clearInterval($set_id7);
	}
	setTimeout(Clear7, 3400);

	}//  if($DR_Row1[1])

}//DoRoll

/*------------------------------------------------------------------------------------*/

function DoRoll8(){

    if($DR_Row3[1]){

    	function repeat8(){
			$cl8++;

		if($cl8 >= 10){ $cl8 = 0; }
			document.images["CELL8"].src = $imgs[$cl8].src;
			return cl8;
		}

    	$set_id8 = setInterval(repeat8, $speed);//������Ăяo���Ƃ�()�����Ȃ�

	function Clear8(){
		clearInterval($set_id8);
	}
	setTimeout(Clear8, 3200);

	}//  if($DR_Row1[1])

}//DoRoll

/*------------------------------------------------------------------------------------*/


function DoRoll9(){

    if($DR_Row3[2]){

    	function repeat9(){
			$cl9++;

		if($cl9 >= 10){ $cl9 = 0; }
			document.images["CELL9"].src = $imgs[$cl9].src;
			return cl9;
		}

    	$set_id9 = setInterval(repeat9, $speed);//������Ăяo���Ƃ�()�����Ȃ�

	function Clear9(){
		clearInterval($set_id9);
	}
	setTimeout(Clear9, 3780);

	}//  if($DR_Row1[1])

}//DoRoll

/*------------------------------------------------------------------------------------*/

/* ------------------------------------------
�h������~�֐��E�S��~�����菈���Ăяo��
-------------------------------------------- */



function StopRoll(){//1


	$DR_Row1[0] = $DR_Row1[1]= $DR_Row1[2] = false;
	$DR_Row2[0] = $DR_Row2[1]= $DR_Row2[2] = false;
	$DR_Row3[0] = $DR_Row3[1]= $DR_Row3[2] = false;


   if( !$DR_Row1[0] &&  !$DR_Row1[1]  &&  !$DR_Row1[2] &&
    	 !$DR_Row2[0] &&  !$DR_Row2[1]  &&  !$DR_Row2[2] &&
    	 !$DR_Row3[0] &&  !$DR_Row3[1]  &&  !$DR_Row3[2] ){

  		Result_Line();
  		ResultCheck();
	}//if

}//StopRpll



/* ------------------------------------------
 ����֐�   ���ƂŏC���K�v
----------------------------------------- */
$gameover = false;

function Result_Line(atari){//(atari)����Ȃ��Ă�OK?
	$win = 0;
 	$win_side1 = 0 ;
	$win_side2 = 0 ;
	$win_side3 = 0 ;
	$win_height1 = 0 ;
	$win_height2 = 0 ;
	$win_height3 = 0 ;
	$win_right = 0 ;
	$win_left = 0 ;
	$win_cross =0;

    var atari = [2000,4,4,4,8,50,60,70,100,500];

/*-------------------------------------------------*/

     if( ($cl1 == $cl2) && ($cl2 == $cl3 )  ){     //if��_1

	    	for (var [index, item] of atari.entries()) {//for    //let��var

	    		  if( (index == $cl1)&&(index == $cl3) ){///�������Q�ɂ��Ȃ��v�Z�ł��Ȃ�
	    			  $win_side1 = ($b_point/8) * item;//win������\�����邽�ߕK�v
	    			  alert($win_side1);
	    		  }///index
	    		}//for
	}//��if��_1 */


    if( ($cl4 == $cl5) && ($cl5 == $cl6) ){     //if��_1
    		    	for (var [index, item] of atari.entries()) {//for    //let��var
    		    		  if( (index== $cl4) && ( index == $cl6) ){///�������Q�ɂ���
    		    			  $win_side2 = ($b_point/8) * item;//win������\�����邽�ߕK�v
    		    		  }///index
    		    		}//for
     }//��if��_1 */

     if( ($cl7 == $cl8) && ($cl8 == $cl9) ){     //if��_1
    		    	for (var [index, item] of atari.entries()) {//for
    		    		  if( (index == $cl7) && (index == $cl9) ){///�������Q�ɂ���
    		    			  $win_side3 = ($b_point/8) * item;//win������\�����邽�ߕK�v
    		    		  }///index
    		    		}//for
     }//��if��_1

      if( ($cl1 == $cl4) && ($cl4 == $cl7) ){     //if��_1 //10���v�Z����Ȃ�
    		    	for (var [index, item] of atari.entries()) {//for
    		    		  if( (index == $cl1) && (index == $cl7) ){///�������Q�ɂ���
    		    			  $win_height1 = ($b_point/8) * item;//win������\�����邽�ߕK�v
    		    		  }///index
    		    		}//for
     }//��if��_1

     if( ($cl2 == $cl5) && ($cl5 == $cl8) ){     //if��_1�@//10���v�Z����Ȃ�
    		    	for (var [index, item] of atari.entries()) {//for
    		    		  if( ( index == $cl2) && (index == $cl8) ){///�������Q�ɂ���
    		    			  $win_height2 = ($b_point/8) * item;//win������\�����邽�ߕK�v
    		    		  }///index
    		    		}//for
     }//��if��_1

     if( ($cl3 == $cl6)  && ($cl6 == $cl9) ){     //if��_1
    		    	for (var [index, item] of atari.entries() ) {//for
    		    		  if( (index == $cl3) && (index == $cl9) ){///�������Q�ɂ���
    		    			  $win_height3 = ($b_point/8) * item;//win������\�����邽�ߕK�v
    		    		  }///index
    		    		}//for
     }//��if��_1

     /*---------�΂߂̌v�Z------------------------*/
     if( ($cl1 == $cl5)  && ($cl5 == $cl9 ) ){     //

    	   var atari2 = [2000,4,4,4,8,50,60,70,100,500]; //�΂߂͂܂Ƃ߂�
    		    	for (var [index2, item2] of atari2.entries()) {//for
    		    		  console.log(index2, item2);// index
    		    		  if( index2== $cl1 ){///�������Q�ɂ���///
    		    			  $win_left = ($b_point/8) * item2;//win������\�����邽�ߕK�v
    		    		  }///index
    		    		}//for
 	}//��if��_1

 	/*---------�΂߂̌v�Z------------------------*/
      if( ($cl3 == $cl5)  && ($cl5 == $cl7 ) ){     //if��_1�@�E�΂ߌv�Z����Ȃ�

    	 var atari2 = [2000,4,4,4,8,50,60,70,100,500];  //�΂߂͂܂Ƃ߂�
    		    	for (var [index2, item2] of atari2.entries()) {//for
    		    		  console.log(index2, item2);// index1,2,�������P�Q�ł��v�Z����Ȃ�
    		    		  if( ( index2 == $cl3) &&( index2 == $cl5) ){///�������Q�ɂ��� {///
    		    			  $win_right = ($b_point/8) * item2;//win������\�����邽�ߕK�v
    		    		  }///index
    		    		}//for
     }//��if��_1


 } //Result_Line(atari)
 /*--------------------------------------------------------------------------------------------*/

 function ResultCheck(){

    if( ($win_side1> 3 ) || ($win_side2 > 3 ) || ($win_side3 > 3 ) ||
    	 ($win_height1 > 3) || ( $win_height2 > 3 ) || ( $win_height3 > 3) ||
    	 ($win_right > 3) || ( $win_left > 3) ){

    		    		$win = $win_side1 + $win_side2 + $win_side3 +
    								$win_height1 + $win_height2 + $win_height3  +
    								$win_right + $win_left  ;



			alert($win);
		//----------------------------���\����----------------------------------//
			document.SLOT.mes.value = "DOUBLEUP or CREDIT ??";
    		document.SLOT.win.value = $win ;
   		//----------------------------��������----------------------------------//

   		//--------------------��DOUBLE��ʂɑ��遙-------------------------//
   			document.SLOT.win_sub.value = $win ;
   		//----------------------------��������----------------------------------//

    		document.SLOT.doub.focus();
     		document.getElementById('doub').focus();

      }else if( $win == 0 ){

		document.SLOT.mes.value = "GAME OVER";
		document.SLOT.mes.value = "Next Game";
		document.SLOT.total.value = $t_point ;
		document.SLOT.start.focus();
	}

    NextDoub();
 	Credit();

  }//ResultCheck()




//------------------------------------------
function NextDoub() {

	  if(($win>3)&&(!$doubButton)){
		$doubButton = true;
		 }
	  $doubButton = false;
  }//Double()

  //------------------------------------------

  function Credit() {
	 	$credit_medal = true;

     		 	if( $win > 3) {

     		 		document.SLOT.mes.value = "�R�C���𒙂߂܂���";
     		 		document.SLOT.mes.value = "NextGame";

     		 		 $t_point = $t_point + $win;
					alert("�R�C���𒙂߂���"+$t_point);
					document.getElementById("result").innerHTML = $t_point;
     		 	 	 /* document.SLOT.total.value = $t_point ; */

     		 	}
     		 	$credit_medal = false;//���ɖ߂� */
}//credit()







  /*
function Credit() {
	 	$credit_medal = true;
     		 	if( $win > 4) {
     		 		/* document.SLOT.mes.value = "�R�C���𒙂߂܂���"; */
     		 		/* document.SLOT.mes.value = "WINNER�I�I�I"; */

     		 	/* 	 $t_point2 = parseInt($t_point) + parseInt($win);//���I�������p */


     		 		//------------------------------------------------------//
      		 	 	//$t_point(WIN�o���O) ���J�n����
      		 		//$t_point2(WIN��j���I������



     			//------------------------------------------------------//

 				/*  $t_point = $t_point + $win;//
 				document.getElementById("result").innerHTML = $t_point; */
     		 	 	/* document.SLOT.total.value = $t_point ; */
     		 	 	/* $credit_medal = false;//���ɖ߂� */
     		 	//}
//}//credit() */ */
//------------------------------------------
//��������Ȃ�
  ///�R�C�����Ȃ��Ȃ����Ƃ��̏���
 /*    if($t_point < 8){

        $gameover = true;

        document.SLOT.mes.value = "Game Over!!";

        document.SLOT.clear.focus();

    }else{ document.SLOT.start.focus();}

} */





/* ------------------------------------------
���Z�b�g�󋵃`�F�b�N�֐�
-------------------------------------------- */

function ClearAll(){

    if($gameover){

        ResetAll();

    }else{

        if(confirm('�Q�[�����s�\�ł��B�ŏ������蒼���܂���?')){ ResetAll();}
    }
}

/* ------------------------------------------
���Z�b�g�E�������֐�
-------------------------------------------- */

var $Timer1,$Timer2,$Timer3,$Timer4,$Timer5,$Timer6$,Timer7,$Timer8,$Timer9;

function ResetAll(){

    if($Timer1){ clearTimeout($Timer1); }
    if($Timer2){ clearTimeout($Timer2); }
    if($Timer3){ clearTimeout($Timer3); }
    if($Timer4){ clearTimeout($Timer4); }
    if($Timer5){ clearTimeout($Timer5); }
    if($Timer6){ clearTimeout($Timer6); }
    if($Timer7){ clearTimeout($Timer7); }
    if($Timer8){ clearTimeout($Timer8); }
    if($Timer9){ clearTimeout($Timer9); }

    document.SLOT.reset();

    document.images["CELL1"].src = $imgs[7].src;
    document.images["CELL2"].src = $imgs[7].src;
    document.images["CELL3"].src = $imgs[7].src;
    document.images["CELL4"].src = $imgs[7].src;
    document.images["CELL5"].src = $imgs[7].src;
    document.images["CELL6"].src = $imgs[7].src;
    document.images["CELL7"].src = $imgs[7].src;
    document.images["CELL8"].src = $imgs[7].src;
    document.images["CELL9"].src = $imgs[7].src;

    $cl1 = $cl2 = $cl3 = $cl4 = $cl5 = $cl6 = $cl7 = $cl8 = $cl9=7;


    $gameover = false;

  /*   $DR[1] = $DR[2] = $DR[3] =$DR[4] = $DR[5] = $DR[6]= $DR[7] = $DR[8] = $DR[9]=false; //��~�� */

	$DR_Row1[0] = $DR_Row1[1]= $DR_Row1[2] = false;
	$DR_Row2[0] = $DR_Row2[1]= $DR_Row2[2] = false;
	$DR_Row3[0] = $DR_Row3[1]= $DR_Row3[2] = false;


    $t_point = 800;

    $b_point = 8;

    document.SLOT.start.focus();

}

</script>

</HEAD>

<style>
/* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
/*  �����܂�resetCSS*/




body {
	background-image: url("./image/BackGround0.png");
	background-repeat: no-repeat;
	background-size:contain;
}


  table {
 	    position : relative; /* ���Δz�u */
 	    top : 58px;
  		left : 65px;
  		padding : 30px;
  }

   #slot td{
   border : 2px solid #ccc ;
   border-bottom-left-radius: 20px 100px;
   border-bottom-right-radius: 20px 100px;
   border-top-left-radius: 20px 100px;
   border-top-right-radius: 20px 100px;
  /* padding : 4px;  */
   }

.ShowBet input {/*�g���A�����̐F  */
	 color : #ccc;/* �����̐F */
	 border : 1px solid #ccc ;
	 border-radius: 0.37em;
	 text-align : center;
	 background-color : #000080;
	}

#Show1Bet {/* �ʒu,���̐F�����߂� */
		position : absolute; /* ���Δz�u */
		bottom : 220px;
		left : 54px;
	}

#Show2Bet {/* �ʒu,���̐F�����߂� */
		position : absolute; /* ���Δz�u */
		bottom : 283px;
		left : 30px;
	}

#Show3Bet {/* �ʒu,���̐F�����߂� */
		position : absolute; /* ���Δz�u */
		bottom : 382px;
		left : 30px;
	}

#Show4Bet {/* �ʒu,���̐F�����߂� */
		position : absolute; /* ���Δz�u */
		top : 92px;
		left : 30px;
	}


#Show5Bet {/* �ʒu,���̐F�����߂� */
		position : absolute; /* ���Δz�u */
		top : 19px;
		left : 37px;
	}

#Show6Bet {/* �ʒu,���̐F�����߂� */
		position : absolute; /* ���Δz�u */
		top : 10px;
		left : 110px;
	}

#Show7Bet {/* �ʒu,���̐F�����߂� */
		position : absolute; /* ���Δz�u */
		top : 10px;
		left : 212px;
	}

#Show8Bet {/* �ʒu,���̐F�����߂� */
		position : absolute; /* ���Δz�u */
		top : 10px;
		left : 316px;
	}

	 #bigMes input {
		position : absolute; /* ���Δz�u */
 		text-align : center;
 		margin : 70px 100px;
  		color : #ff00ff;
  		text-shadow:0 0 10px #FF0;
		 font-size : 20px;
		 text-align : center;
   		border : none ;
    	 outline : none ;
		 background : none;
  }

 .bet {
		position : relative;
		top:37px;
		left: -315px;
		margin-left : 7px;
		float: left;
}

/*
#win{
		/* display : inline;
		left : 15px;
  		bottom : -190px;
		color : #ff00ff;
		font-size : 20px;
		text-align : center;
} */

  #win input {
		position : absolute; /* ���Δz�u */
  		left : -85px;
  		bottom : 160px;/* �ǉ�*/

  		color : #ff00ff;
		 font-size : 20px;
		 text-align : center;

   		border : none ;
    	 outline : none ;
		 background : none;
  }



 .bet {
		position : relative;
		top:37px;
		left: -315px;
		margin-left : 7px;
		float: left;
}

.bet input{
		position : relative;
		top : 20px;
 		left: -25px;
 		bottom:-13;
		color : white;
		 font-size : 20px;
   		border : none ;
    	 outline : none ;
		 background : none;
	}


  #total {
 		position : relative;
 		bottom:-88;
  		 left : -90px;
  		text-align : center;
  		margin : 17px 0px;
  }


 	#result input{
 		position : relative;
 		/* right : 5px; */
 		bottom : -12;
 		color : white;
		 font-size : 20px;
		 text-align : center;
 		 border : none ;
    	 outline : none ;
		 background : none;

	}


.startBt input{
position : relative;
top:50px;
left: 43px;
  float: left;
  color: #000000;/* #b1921b */
  border-right: 4px solid #cea82c;
  border-bottom: 10px solid #987c1e;
  border-left: 4px solid #ffed8b;
  border-radius: 0;
  background: -webkit-gradient(linear, right top, left top, from(#ffd75b), color-stop(30%, #fff5a0), color-stop(40%, #fffabe), color-stop(50%, #ffffdb), color-stop(70%, #fff5a0), to(#fdd456));
  background: -webkit-linear-gradient(right, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  background: linear-gradient(-90deg, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  text-shadow: -1px -1px 1px #ffffd9;

}

.startBt input:hover {
  margin-top: 3px;
  top:50px;
  color: #b1921b;
  border-right: 4px solid #cea82c;
  border-bottom: 7px solid #987c1e;
  border-left: 4px solid #ffed8b;
}

.creditBt input{
position : relative;
top:50px;
left: 47px;
  float: left;
  color: #000000;/* #b1921b */
  border-right: 4px solid #cea82c;
  border-bottom: 10px solid #987c1e;
  border-left: 4px solid #ffed8b;
  border-radius: 0;
  background: -webkit-gradient(linear, right top, left top, from(#ffd75b), color-stop(30%, #fff5a0), color-stop(40%, #fffabe), color-stop(50%, #ffffdb), color-stop(70%, #fff5a0), to(#fdd456));
  background: -webkit-linear-gradient(right, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  background: linear-gradient(-90deg, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  text-shadow: -1px -1px 1px #ffffd9;
  /*  margin : 5px; */

}

.creditBt input:hover {
  margin-top: 3px;
  top:50px;
  color: #b1921b;
  border-right: 4px solid #cea82c;
  border-bottom: 7px solid #987c1e;
  border-left: 4px solid #ffed8b;
}

.doubleBt input{
position : relative;
top:50px;
left: 53px;
  float: left;
  color: #000000;/* #b1921b */
  border-right: 4px solid #cea82c;
  border-bottom: 10px solid #987c1e;
  border-left: 4px solid #ffed8b;
  border-radius: 0;
  background: -webkit-gradient(linear, right top, left top, from(#ffd75b), color-stop(30%, #fff5a0), color-stop(40%, #fffabe), color-stop(50%, #ffffdb), color-stop(70%, #fff5a0), to(#fdd456));
  background: -webkit-linear-gradient(right, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  background: linear-gradient(-90deg, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  text-shadow: -1px -1px 1px #ffffd9;
   /* margin : 5px; */
}

.doubleBt input:hover {
top:50px;
  margin-top: 3px;
  color: #b1921b;
  border-right: 4px solid #cea82c;
  border-bottom: 7px solid #987c1e;
  border-left: 4px solid #ffed8b;
}


.betPlus input{
position : relative;
	left: 63px;
	top:50px;
  float: left;
  color: #000000;/* #b1921b */
  border-right: 4px solid #cea82c;
  border-bottom: 10px solid #987c1e;
  border-left: 4px solid #ffed8b;
  border-radius: 0;
  background: -webkit-gradient(linear, right top, left top, from(#ffd75b), color-stop(30%, #fff5a0), color-stop(40%, #fffabe), color-stop(50%, #ffffdb), color-stop(70%, #fff5a0), to(#fdd456));
  background: -webkit-linear-gradient(right, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  background: linear-gradient(-90deg, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  text-shadow: -1px -1px 1px #ffffd9;
   /* margin : 5px; */
}

.betPlus input:hover {
  margin-top: 3px;
  top:50px;
  color: #b1921b;
  border-right: 4px solid #cea82c;
  border-bottom: 7px solid #987c1e;
  border-left: 4px solid #ffed8b;
}

.betMinus input{
position : relative;
top:50px;
 left: 63px;
  float: left;
  color: #000000;/* #b1921b */
  border-right: 4px solid #cea82c;
  border-bottom: 10px solid #987c1e;
  border-left: 4px solid #ffed8b;
  border-radius: 0;
  background: -webkit-gradient(linear, right top, left top, from(#ffd75b), color-stop(30%, #fff5a0), color-stop(40%, #fffabe), color-stop(50%, #ffffdb), color-stop(70%, #fff5a0), to(#fdd456));
  background: -webkit-linear-gradient(right, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  background: linear-gradient(-90deg, #ffd75b 0%, #fff5a0 30%, #fffabe 40%, #ffffdb 50%, #fff5a0 70%, #fdd456 100%);
  text-shadow: -1px -1px 1px #ffffd9;
   /* margin : 5px; */
}

.betMinus input:hover {
  margin-top: 3px;
  top:50px;
  color: #b1921b;
  border-right: 4px solid #cea82c;
  border-bottom: 7px solid #987c1e;
  border-left: 4px solid #ffed8b;
}


/* .box{
	border: double 3px /* #ccc ;
	width: 400px;
  	height: 40px;
  	margin: 10px;
	padding: 1em;
	padding-border: 1em;
} */

h1{
position : absolute;
top : 10px;
 left: 500px;

}

#payments {
position : absolute;
top : 60px;
left: 500px;
}

#payments td{
border : 1px solid #191970;
font-family : fantasy;
font-size : 12px;
color : ;
text-align : center;
}

.payMedal input{
 		color : #ff00ff;
		 font-size : 20px;
		 text-align : center;
 		 border : none ;
    	 outline : none ;
		 background : none;
}

#ser{
position : absolute;
 left: 500px;
}

</style>


<BODY BGCOLOR="#000000" TEXT="#FFFFFF" >

<FORM NAME="SLOT"  action="/0604AM11/DOUBLE GAME.jsp" method="GET" target="_blank"  >


<div id="slot">
<TABLE  >

<TR ><!-- 1�� -->

<TD><IMG NAME="CELL1" SRC="./image/7.png" WIDTH="100" HEIGHT="100"></TD>

<TD><IMG NAME="CELL2" SRC="./image/7.png" WIDTH="100" HEIGHT="100"></TD>

<TD><IMG NAME="CELL3" SRC="./image/7.png" WIDTH="100" HEIGHT="100"></TD>

</TR>

<TR><!-- �Q�� -->


<TD><IMG NAME="CELL4" SRC="./image/7.png" WIDTH="100" HEIGHT="100"></TD>

<TD><IMG NAME="CELL5" SRC="./image/7.png" WIDTH="100" HEIGHT="100"></TD>

<TD><IMG NAME="CELL6" SRC="./image/7.png" WIDTH="100" HEIGHT="100"></TD>

</TR>


<!-- 3�� -->
<TR  >

<TD>

<IMG NAME="CELL7" SRC="./image/7.png" WIDTH="100" HEIGHT="100"></TD>

<TD>

<IMG NAME="CELL8" SRC="./image/7.png" WIDTH="100" HEIGHT="100"></TD>

<TD>

<IMG NAME="CELL9" SRC="./image/7.png" WIDTH="100" HEIGHT="100"></TD>

</TR>

</table>
</div>

<!-- -------------------------------------------------------------------------------------------- -->


<!-- �傫���\�����郁�b�Z�[�W -->
<div id="bigMes" >
<INPUT NAME="mes" TYPE="text" VALUE="PUSH START�I�I�I"  >
</div>





<!----------DOUBLE��ʂɑ���win����---------->
<INPUT NAME="win_sub" TYPE="hidden">
<!------------------------------------------------->


<!-------------------------------�Q�[������߂ă��_���������̃X�R�[�v�ɕۑ�����{�^��-------------------------------------------->
<!-- �O�U�O�V�ǉ� -->
<!-- <form name="servlet" action="/0604AM11/suspend" method="post">
 -->


<!---------------WIN������\��------------------------->
<div id="win">

<!-- WIN -->
<br>
<INPUT NAME="win" TYPE="text" VALUE="" >

</div>
<!------------------------------------------------------->




<!------------------TOTAL������\��---------------------------->
<div id ="total">
<TR>
<TD>CREDITS

<div id="result" ><!-- ���_�u����ʂ���n���ꂽ�l��\�� -->
<INPUT NAME="total"  VALUE=" <%= meda_B.getPost_medal() %>" SIZE=10 >
</div>

</TD>
</TR>
</div>
<!---------------------------------------------------------------->

<!----------DOUBLE��ʂɑ���total---------->
<INPUT NAME="total_sub" TYPE="hidden">
<!---------------------------------------------->

<!-- �O�U�O�V�ǉ� -->
<!-- <div id="ser">
<input type="submit" name ="ser" value="Suspend">
</div>
</form>
 -->

<!---------------------------------------------------------------------------------------------------------->
<div class ="box">

<div class="startBt">
<INPUT NAME="start" TYPE="button"  VALUE="START / REPLAY" onClick="GetStart()">
</div>

<div class="creditBt">
<INPUT NAME="credit"   TYPE="button" VALUE="CREDITS" onClick="Credit()">
</div>

<div class="doubleBt"><!-- MainSlot��DoubleGame�� -->
<input type="submit" NAME="doub" value="DOUBLE" onClick="NextDoub()">
</div>


<TR><TD>


<div class="betPlus">
<INPUT NAME="down" TYPE="button" VALUE="-" onClick="BetCTRL(0)">
</div>

<div class="betMinus">
<INPUT NAME="up" TYPE="button" VALUE="+" onClick="BetCTRL(1)">
</div>

<div class="bet">
<TR><TD COLSPAN=3 ALIGN="center">BET
<INPUT NAME="bet" TYPE="text" SIZE=3 VALUE="8"></TD></TR>
</div>


</TD></TR>

</div><!--box-->
<!---------------------------------------------------------------------------------------------------------->

<!----------DOUBLE��ʂɑ���BET---------->
<INPUT NAME="bet_sub" TYPE="hidden">
<!---------------------------------------------->





<!-----------------------��������Show1Bet----------------------------------------------------->
<div id="Show1Bet">
<div class="ShowBet"><INPUT NAME="bet1" TYPE="text" SIZE=2 VALUE="8"></div>
</div>

<div id="Show2Bet">
<div class="ShowBet"><INPUT NAME="bet2" TYPE="text" SIZE=2 VALUE="8"></div>
</div>

<div id="Show3Bet">
<div class="ShowBet"><INPUT NAME="bet3" TYPE="text" SIZE=2 VALUE="8"></div>
</div>

<div id="Show4Bet">
<div class="ShowBet"><INPUT NAME="bet4" TYPE="text" SIZE=2 VALUE="8"></div>
</div>

<div id="Show5Bet">
<div class="ShowBet"><INPUT NAME="bet5" TYPE="text" SIZE=2 VALUE="8"></div>
</div>

<div id="Show6Bet">
<div class="ShowBet"><INPUT NAME="bet6" TYPE="text" SIZE=2 VALUE="8"></div>
</div>

<div id="Show7Bet">
<div class="ShowBet"><INPUT NAME="bet7" TYPE="text" SIZE=2 VALUE="8"></div>
</div>

<div id="Show8Bet">
<div class="ShowBet"><INPUT NAME="bet8" TYPE="text" SIZE=2 VALUE="8"></div>
</div>

<!----------------------------------------------payments�i���_���x���̃e�[�u���j ----------------------------------------------------------->
<table id="payments">

<h1>PAYMENTS</h1>

<td><pre>  </pre><td>1 LINE</td><td>2 LINE </td><td>3 LINE</td><td>4 LINE</td>
<td>5 LINE</td><td>6 LINE</td><td>7 LINE</td><td>8 LINE</td>


<tr>
<td style=background-image:url(./image/pay10.png)>101010</td>
<td><div class="payMedal"><INPUT NAME="pay10_1LINE" TYPE="text" SIZE=8 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay10_2LINE" TYPE="text" SIZE=8 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay10_3LINE" TYPE="text" SIZE=8 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay10_4LINE" TYPE="text" SIZE=8 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay10_5LINE" TYPE="text" SIZE=8 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay10_6LINE" TYPE="text" SIZE=8 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay10_7LINE" TYPE="text" SIZE=8 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay10_8LINE" TYPE="text" SIZE=8 VALUE="��"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay9.png)>9 9 9 </td>
<td><div class="payMedal"><INPUT NAME="pay9_1LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay9_2LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay9_3LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay9_4LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay9_5LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay9_6LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay9_7LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay9_8LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay8.png)>8 8 8 </td>
<td><div class="payMedal"><INPUT NAME="pay8_1LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay8_2LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay8_3LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay8_4LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay8_5LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay8_6LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay8_7LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay8_8LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay7.png)>7 7 7</td>
<td><div class="payMedal"><INPUT NAME="pay7_1LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay7_2LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay7_3LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay7_4LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay7_5LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay7_6LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay7_7LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay7_8LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay6.png)>6 6 6 </td>
<td><div class="payMedal"><INPUT NAME="pay6_1LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay6_2LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay6_3LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay6_4LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay6_5LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay6_6LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay6_7LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay6_8LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay5.png)>5 5 5</td>
<td><div class="payMedal"><INPUT NAME="pay5_1LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay5_2LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay5_3LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay5_4LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay5_5LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay5_6LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay5_7LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay5_8LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay4.png)>4 4 4</td>
<td><div class="payMedal"><INPUT NAME="pay4_1LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay4_2LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay4_3LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay4_4LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay4_5LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay4_6LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay4_7LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay4_8LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
</tr>


<tr>
<td style=background-image:url(./image/pay3.png)>3 3 3</td>
<td><div class="payMedal"><INPUT NAME="pay3_1LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay3_2LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay3_3LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay3_4LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay3_5LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay3_6LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay3_7LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay3_8LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay2.png)>2 2 2</td>
<td><div class="payMedal"><INPUT NAME="pay2_1LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay2_2LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay2_3LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay2_4LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay2_5LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay2_6LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay2_7LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay2_8LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
</tr>

<tr>
<td style=background-image:url(./image/pay1.png)>1 1 1</td>
<td><div class="payMedal"><INPUT NAME="pay1_1LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay1_2LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay1_3LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay1_4LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay1_5LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay1_6LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay1_7LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
<td><div class="payMedal"><INPUT NAME="pay1_8LINE" TYPE="text" SIZE=5 VALUE="��"></div></td>
</tr>


</table>


<!----------------------------------------------dd �������̔�\�� ----------------------------------------------------------->
<br>
<TR><TD COLSPAN=3 ALIGN="center" >
<INPUT NAME="clear" TYPE="img" src="" VALUE="RESET" onClick="ClearAll()" style="visibility:hidden">
</TD></TR>
<!--------------------------------------------------------------------------------------------------------------------------->

</TABLE>

</FORM>




</body>
</html>
