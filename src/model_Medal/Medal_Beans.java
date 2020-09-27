package model_Medal;
import java.io.Serializable;


public class Medal_Beans implements Serializable{

	private int post_medal;//投入メダル

	private int suspend_medal ; //中断したメダル



	public int getPost_medal() { return post_medal; }

	public void setPost_medal(int post_medal ) { this.post_medal = post_medal ; }


	public int getSuspend_medal() { return suspend_medal; }

	public void setSuspend_medal(int suspend_medal ) { this.suspend_medal = suspend_medal ; }





}
