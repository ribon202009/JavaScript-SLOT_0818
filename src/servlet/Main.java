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

import model.User;

@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

ServletContext application = this.getServletContext();


		//ログインしてるか確認

		//セッションスコープを取得
		HttpSession session = request.getSession();
		User loginUser = ( User ) session.getAttribute("loginUser");


		if(loginUser == null ) {//ログインしていない場合
			//リダイレクト
			response.sendRedirect("/0604AM11/") ;

		}else {//ログインしている場合

			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher
					("/WEB-INF/jsp/Main.jsp");
			dispatcher.forward(request,response);
		}



	}


//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//
//	}

}
