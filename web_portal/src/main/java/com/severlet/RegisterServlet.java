package com.severlet;
import com.entity.*;

import java.io.IOException;
import com.db.dbconnect;
import com.dao.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	try {
		String name = req.getParameter("name");
		String qua = req.getParameter("qua");
		String email = req.getParameter("email");
		String ps = req.getParameter("ps");
		
		UserDAO dao  = new UserDAO(dbconnect.getConn());
		
		user u = new user(name,email,ps,qua,"user");
		boolean f = dao.addUser(u);
		
		HttpSession session = req.getSession();
		if (f)
		{
			session.setAttribute("succMsg","Registration Sucessfully");
			resp.sendRedirect("signup.jsp");
		}
		else
		{
			session.setAttribute("succMsg","Something wrong on server");
			resp.sendRedirect("signup.jsp");
		}
	    }
	     catch(Exception e)
	{
		e.printStackTrace();
		
	}
	}
	}


