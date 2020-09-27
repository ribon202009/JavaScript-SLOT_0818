package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_Medal.AtmLogic;
import model_Medal.AtmMedal;
import model_Medal.Medal_Beans;


@WebServlet("/AtmResult")
public class AtmResult extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメーターの取得
		request.setCharacterEncoding("UTF-8");

		String medal = request.getParameter("medal");//メダル枚数を受け取る

		Medal_Beans meda_B = new Medal_Beans () ;//投入したメダルのみのBeansクラス

		meda_B.setPost_medal( Integer.parseInt(medal) ); //setPost_MedalにInt型にして渡す

		//Int型にしてから保存する。
		HttpSession session1 = request.getSession();
		session1.setAttribute( "PostMedal", meda_B);


		AtmLogic aL = new AtmLogic();

		AtmMedal AtMeda = new AtmMedal();

		aL. AtmLogic( AtMeda , meda_B  ) ; //元のメダル枚数と投入メダル

		HttpSession session2 = request.getSession();
		session2.setAttribute("resultMedal", aL) ;


		RequestDispatcher d = request.getRequestDispatcher("/WEB-INF/jsp/atmResult.jsp");

		d.forward(request, response);








	}

}
