package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RegisterUserLogic;
import model.User;


@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//フォワード先
		String forwardPath = null;


		//サーブレットクラスの動作を決定する『action』の値をnullにする
		//リクエストパラメーターから取得
		String action = request.getParameter("action");


		//登録ボタンをを押していないとき
		if(action==null) {//パラメーターのaction設定は登録確認画面で設定している

			forwardPath ="/WEB-INF/jsp/registerForm.jsp";
		}

		//登録ボタンををsubmitされたとき
		else if (action.contentEquals("done")) {
			//セッションスコープに保存された登録ユーザーを取得

			//■Sessionインスタンスを取得（準備）
			HttpSession session = request.getSession();

			//■Sessionスコープからインスタンスを取得
			User registerUser = ( User ) session.getAttribute("registerUser");
			//取得するインスタンスの型　　変数名 =  (取得するインスタンスの型) ("属性名")


			//登録処理の呼び出し
			RegisterUserLogic logic = new RegisterUserLogic();//インスタンス作成

			logic.execute(registerUser); //executeメソッドはboolean型　その中に 取得した情報をいれる

			//追加する？
			//削除する前にLoginLogicにいれる





			//設定されたフォワード先にフォワード(フォワード使うときの決まりの文）
			RequestDispatcher d = request.getRequestDispatcher("/WEB-INF/jsp/registerDone.jsp");//→foward先 /WEB-INF・・・でも良い
			d.forward(request,response);


			//前の情報は削除 これはどこにいれるのか
//			session.removeAttribute("registerUser");

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		//リクエストパラメーターの取得
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");

		//登録するユーザー情報の設定
		User registerUser = new User(name,pass);


		//セッションスコープに登録ユーザーを保存
		HttpSession session = request.getSession();
		session.setAttribute("registerUser", registerUser);


		//設定されたフォワード先にフォワード(フォワード使うときの決まりの文）
				RequestDispatcher d = request.getRequestDispatcher("/WEB-INF/jsp/registerConfirm.jsp");//→foward先 /WEB-INF・・・でも良い
				d.forward(request,response);

	}

}
