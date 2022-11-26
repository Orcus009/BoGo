package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinAction
 */
// @WebServlet("/JoinAction")
public class JoinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		UserDao dao = UserDao.getInstance();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password2");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		String address_front = request.getParameter("member_addr");
		String address_back = request.getParameter("member_detailAddr");
		String address = "";
		
		address = address_front + " " + address_back;
		
		String driveCode = request.getParameter("driveCode");
		String driveCode1 = driveCode.substring(0, 2) + "-" + driveCode.substring(2, 4) + "-" + driveCode.substring(4, 10) + "-" + driveCode.substring(10, 12);
		
		int accountType = 1;

		UserDto userData = new UserDto(id, password, name, phone, address, driveCode1, accountType);

		dao.createUser(userData);

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
