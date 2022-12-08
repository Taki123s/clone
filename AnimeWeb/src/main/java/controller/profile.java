package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import database.Login;
import model.Account;
import model.ListAccount;

@MultipartConfig
@WebServlet("/anime-main/profile")
public class profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String sessionId = ";jsessionid=" + session.getId();
		Account user = (Account) session.getAttribute("user");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		Part file = request.getPart("files");
		boolean error = false;

		Path nameFile = Path.of(file.getSubmittedFileName().toString());
		if (user == null || user.getUserName().length() > 25 || pass.length() < 6
				|| pass.length() > 25 && !(nameFile.endsWith("jpg") || nameFile.endsWith("png"))
				|| "".equalsIgnoreCase(nameFile.toString())) {
			error = true;
		}
		if (error == false) {
			String filename = nameFile.toString();
			String appPath = request.getServletContext().getRealPath("");
			String path = appPath + "anime-main\\storage\\avatarUser";
			Login login = new Login();
			String img = "avatar." + filename.subSequence(filename.length() - 3, filename.length());
			String savefile = path + "\\" + user.getUserName() + img;
			File f = new File(path + "\\" + user.getAvatar());
			if (f.exists()) {
				f.delete();
			}

		
			try {
			
				login.changeProfile(user.getUserName(), pass, email, user.getUserName() + img);
		
				ListAccount listAc = new ListAccount(new Login().getConnection());
				getServletContext().setAttribute("listUser",listAc);
			
				session.setAttribute("user", listAc.findByUserName(user.getUserName()));
				file.write(savefile);
				response.sendRedirect(getServletContext().getContextPath() + "/anime-main/index.jsp" + sessionId);
			} catch (ClassNotFoundException | SQLException e) {
					//chuyen den trang loi
			}

			

		} else {
			response.sendRedirect(getServletContext().getContextPath() + "/anime-main/index.jsp" + sessionId);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
