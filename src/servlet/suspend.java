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
import model_Medal.Medal_Beans;


@WebServlet("/suspend")
public class suspend extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメーターの取得
		request.setCharacterEncoding("UTF-8");

		String total = request.getParameter("total");//メダル枚数を受け取る

		Medal_Beans meda_B = new Medal_Beans() ;


		meda_B.setSuspend_medal(Integer.parseInt(total));

		//Int型にしてから保存する。
		HttpSession session = request.getSession();
		session.setAttribute("SusMedal", meda_B);


		AtmLogic aL = new AtmLogic();

		aL. AtmLogicSus( meda_B  ) ;

		HttpSession session2 = request.getSession();
		session2.setAttribute("result_sus_Medal", aL) ;


		RequestDispatcher d = request.getRequestDispatcher("/WEB-INF/jsp/atmResult.jsp");

		d.forward(request, response);





	}

}
