package org.eclipse.wtp.sample.classschedule;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class ScheduleServlet extends HttpServlet implements Servlet {

	//doPost method - form submits data using POST method
	//Reads in the information submitted by the form
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//Information can be obtained through req object's getParameter (one option) 
		//or geParameterValues (multiple options like days) method		
		String title = req.getParameter("title");
		int starttime = Integer.parseInt(req.getParameter("starttime"));
		int endtime = Integer.parseInt(req.getParameter("endtime"));
		String[] days = req.getParameterValues("day");
		
		SchoolSchedule schedule = (SchoolSchedule) req.getSession(true).getAttribute("schoolschedule");
		if(schedule == null){
			schedule = new SchoolSchedule();
		}
		
		if(days != null){
			for(int i = 0; i < days.length; i++){
				String dayString = days[i];
				int day;
				if(dayString.equalsIgnoreCase("SUN")) day = 0;
				else if(dayString.equalsIgnoreCase("MON")) day = 1;
				else if(dayString.equalsIgnoreCase("TUE")) day = 2;
				else if(dayString.equalsIgnoreCase("WED")) day = 3;
				else if(dayString.equalsIgnoreCase("THU")) day = 4;
				else if(dayString.equalsIgnoreCase("FRI")) day = 5;
				else day = 6;
				SchoolClass sclass = new SchoolClass(title, starttime, endtime, day);
				schedule.addClass(sclass);
			}
		}
		
		//Sets the schedule in the session so Schedule.jsp will have access to it and forward control back to Schedule.jsp
		req.getSession().setAttribute("schoolschedule", schedule);
		getServletContext().getRequestDispatcher("/Schedule.jsp").forward(req, resp);
	}

}
