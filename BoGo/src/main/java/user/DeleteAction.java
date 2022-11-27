package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class deleteAction
 */
// @WebServlet("/deleteAction")
public class DeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("log");
		String logPw = (String)session.getAttribute("logPw");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		UserDao dao = UserDao.getInstance();
		
		String idCheck = dao.userIdCheck(logId);
		
		if(id==logId && pw==logPw) {
			dao.userDelete(idCheck);
			System.out.println("탈퇴 완료");
			session.removeAttribute("log");
			session.removeAttribute("logPw");
		}
		
		else {
			System.out.println("탈퇴 실패");
		}
		request.getRequestDispatcher("index").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
