package rent;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RentAction
 */
// @WebServlet("/RentAction")
public class RentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	
		String user_id = request.getParameter("user_id");
		String carName = request.getParameter("carName");
		
		String rentalDate = request.getParameter("rentalDate");
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		int carPrice = Integer.parseInt(request.getParameter("carPrice"));
		
		System.out.println(user_id);
		System.out.println(carName);
		System.out.println(rentalDate);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(carPrice);
		
		
		RentDao dao = RentDao.getInstance();
		RentDto rent = new RentDto(user_id, carName, rentalDate, startDate, endDate, carPrice);
		dao.createRent(rent);
		
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
