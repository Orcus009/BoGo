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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String rentalDate = request.getParameter("rentalDate");
		
		Timestamp rentalDate1 = null;
		try {
			rentalDate1 = (Timestamp)sdf.parse(rentalDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		int price = Integer.parseInt(request.getParameter("price"));
		
		RentDao dao = RentDao.getInstance();
		RentDto rent = new RentDto(user_id, carName, rentalDate1, startDate, endDate, price);
		dao.createRent(rent);
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
