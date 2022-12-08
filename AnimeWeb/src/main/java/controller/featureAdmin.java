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
import model.ListAccount;

@WebServlet("/admin/featureAdmin")
public class featureAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account ac = (Account) session.getAttribute("user");
		String query = request.getParameter("type");

	
		if(!"login".equals(query)){
			if(ac==null) {
				getServletContext().getRequestDispatcher("/admin/login.jsp").forward(request, response);
			}
			if(ac.getIsAdmin()==0) {
				response.sendRedirect("/admin/login.jsp");
			}
			if(ac.getIsAdmin()==1) {
			
				getServletContext().getRequestDispatcher("/admin/movieManagerment.jsp").forward(request, response);

			}
			
		}else {
			ListAccount list = (ListAccount) getServletContext().getAttribute("listUser");
			String userName=request.getParameter("userName");
			String passWord=request.getParameter("passWord");
			boolean validate= list.validateLogin(userName, passWord);
			if(validate) {
				boolean check=list.checkAdmin(userName, passWord)==null?false:true;
				if(check) {
					session.setAttribute("user", list.checkAdmin(userName, passWord));
					getServletContext().getRequestDispatcher("/admin/movieManagerment.jsp").forward(request, response);
				}else {
					request.setAttribute("error","đây không phải tài khoản admin ");
					getServletContext().getRequestDispatcher("/admin/login.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("error","Không được bỏ trống ");
				getServletContext().getRequestDispatcher("/admin/login.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
