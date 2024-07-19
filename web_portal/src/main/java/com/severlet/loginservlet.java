package com.severlet;
import java.sql.*;
import com.severlet.*;
import com.db.*;
import com.dao.*;
import java.io.IOException;
import com.entity.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Login")
public class loginservlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		try {
			String em=req.getParameter("email");
			String ps=req.getParameter("password");
			user u= new user();
			HttpSession session=req.getSession();
		
			if("admin@gmail.com".equals(em) && "admin@121".equals(ps))
			{
				session.setAttribute("userobj",u);
				u.setRole("admin");
			    resp.sendRedirect("admin.jsp");
			}
			else
			{
				UserDAO dao = new UserDAO(dbconnect.getConn());
				user u1 = dao.login(em, ps);
				if(u1!=null)
				{
					session.setAttribute("userobj", u1);
					resp.sendRedirect("home.jsp");
				}
				else 
				{
					session.setAttribute("succMsg","Invalid Email & Password");
					resp.sendRedirect("login.jsp");
				}
			}
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}

}
