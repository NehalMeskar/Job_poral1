package com.severlet;

import java.io.IOException;
import com.db.*;
import com.dao.*;
import com.entity.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String qua=req.getParameter("qua");
			String email=req.getParameter("email");
			String ps=req.getParameter("ps");
		
			UserDAO dao = new UserDAO(dbconnect.getConn());

			user u = new user ();
			u.setId(id);
			u.setName(name);
			u.setQualification(qua);
			u.setEmail(email);
			u.setPassword(ps);

			boolean f = dao.updateUser(u);
			HttpSession session = req.getSession();
			if(f)
			{
				session.setAttribute("succMsg","Profile Update Sucessfully");
				resp.sendRedirect("home.jsp");
			}
			else
			{
				session.setAttribute("succMsg","Something wrong on server");
				resp.sendRedirect("home.jsp");
			}
		}
			catch(Exception e)
			{
				e.printStackTrace();

		}

	}	
}
