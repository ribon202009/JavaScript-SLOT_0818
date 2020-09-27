package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginLogic;
import model.User;
import model_Medal.AtmMedal;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメーターの取得
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");


		//Userクラスのインスタンス作成（ユーザー情報の生成）
		User user = new User(name, pass) ;

		//ログイン処理
		LoginLogic loginLogic = new LoginLogic();

		//LoginLogicクラスはtrueかfalse判定のみ

		boolean isLogin = loginLogic.execute(user);


		//ログイン成功の処理
		if(isLogin) {

			//ユーザー情報をセッションスコープに保存
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", user);

			//アプリケーションスコープを取得
			ServletContext application = this.getServletContext();

			AtmMedal AtMeda = new AtmMedal () ;
			application.setAttribute("atmMedal", AtMeda);


		}

		//ログイン結果をフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/loginResult.jsp");

		dispatcher.forward(request,response);
	}

}
