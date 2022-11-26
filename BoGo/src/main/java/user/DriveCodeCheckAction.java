package user;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DriveCodeCheckAction
 */
// @WebServlet("/DriveCodeCheckAction")
public class DriveCodeCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DriveCodeCheckAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		 response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
//			URL url = new URL("http://ds.gscms.co.kr:8888/Rest/DriverLicense?type=json&sessionID=test" + 
//			"&path01=" + request.getParameter("path01") + "&path02=" + request.getParameter("path02") + 
//			"&path03=" + request.getParameter("path03") + "&path04=" + request.getParameter("path04") + 
//			"&path05=" + request.getParameter("path05") + "&path06=" + request.getParameter("path06"));
			
//			성명/생년월일/면허1/면허2/면허3/면허4
			String name = request.getParameter("path01");
			String birth = request.getParameter("path02");
			String path01 = request.getParameter("path03");
			String path02 = request.getParameter("path04");
			String path03 = request.getParameter("path05");
			String path04 = request.getParameter("path06");
//			URL url = new URL(String.format("https://api.goodapi.co.kr/DriverLicense/%s/%s/%s/%s/%s/%s?type=xml&sessionID=test", name, birth, path01, path02, path03, path04));
			
			URL url = new URL(" https://api.goodapi.co.kr/DriverLicense?type=json&sessionID=test");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("content-type", "application/json");

			/* Payload support */
			con.setDoOutput(true);
			DataOutputStream out = new DataOutputStream(con.getOutputStream());
			out.writeBytes(String.format("\"{\\\"path01\\\":\\\"%s\\\",\\\"path02\\\":\\\"%s\\\",\\\"path03\\\":\\\"%s\\\",\\\"path04\\\":\\\"%s\\\",\\\"path05\\\":\\\"%s\\\",\\\"path06\\\":\\\"%s\\\"}\"", name, birth, path01, path02, path03, path04));
			out.flush();
			out.close();

			int status = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer content = new StringBuffer();
			while((inputLine = in.readLine()) != null) {
				content.append(inputLine);
			}
			in.close();
			con.disconnect();
			System.out.println("Response status: " + status);
			System.out.println(content.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
