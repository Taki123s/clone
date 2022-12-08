package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.ListMovie;
import model.Movie;

/**
 * Servlet implementation class watching
 */
@WebServlet("/anime-main/watching")
public class watching extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String nameFile = request.getParameter("cid");
		String[] split = nameFile.split("_");
		try {
			int id = Integer.valueOf(split[0]);
			ListMovie list =(ListMovie) getServletContext().getAttribute("listMovie");
			Movie m = list.findMovie(id);
			request.setAttribute("viewFilm", m);
			request.setAttribute("linkChap", nameFile);
			request.setAttribute("cr", new Date().toString());
			request.getRequestDispatcher("/anime-main/anime-watching.jsp").forward(request, response);
		} catch (Exception e) {
		
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
