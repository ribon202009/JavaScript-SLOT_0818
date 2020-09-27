package model_Medal;
import java.io.Serializable;

//メダルを管理するBeansクラス

public class AtmLogic  implements Serializable{

	private int atm_medal ;
	private int post_medal ;

	private int result_Medal ;  //預けてあるメダル - 投入メダル

	private int suspend_medal ; //中断したメダル

	private int  result_sus_Medal ; //預けてあるメダル - 中断したメダル

	public AtmLogic() {}


	//預けてあるメダル - 投入メダル
	public void  AtmLogic (  AtmMedal  AtMeda ,  Medal_Beans meda_B  ) {
		 atm_medal = AtMeda.getAtm_medal() ;
		 post_medal =  meda_B.getPost_medal(); //投入したメダル

		 this.result_Medal =   this.atm_medal  - this. post_medal ;

	}

	//預けてあるメダル - 投入メダル
		public int getResult_Medal() { return result_Medal; }






	//預けてあるメダル - 中断したメダル
	public void  AtmLogicSus(Medal_Beans meda_B  ) {

		suspend_medal  = meda_B.getSuspend_medal() ; //中断したメダル


		if(  this.suspend_medal  > this. result_Medal ) {

			this.result_sus_Medal =   this.suspend_medal  - this. result_Medal ;

		}else {

			this.result_sus_Medal =   this. result_Medal -  this.suspend_medal ;

		}
	}

	//預けてあるメダル - 中断したメダル
	public int getResult_sus_Medal() { return result_sus_Medal; }

}
