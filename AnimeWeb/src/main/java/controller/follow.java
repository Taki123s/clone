package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.movie;
import model.Account;
import model.ListMovie;

@WebServlet("/anime-main/follow")
public class follow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idMovie = Integer.parseInt(request.getQueryString());
		HttpSession session = request.getSession();
		


		String sessionId = ";jsessionid=" + session.getId();
		Account user = (Account) session.getAttribute("user");
		if(user==null) {
			request.getRequestDispatcher("/anime-main/login.jsp").forward(request, response);
		}else {
			boolean checkFl = false;
			ListMovie list = null;
			try {
				checkFl= new movie().follow(user.getUserName(), idMovie);
				
				list = new movie().getMovie();
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
			
		
		
			request.setAttribute("viewFilm",list.findMovie(idMovie));
			request.setAttribute("checkFl", checkFl);
			response.sendRedirect(getServletContext().getContextPath()+"/anime-main/anime_details"+sessionId+"?"+idMovie);
					}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
