<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Schedule</title>
</head>
<body>
<form action="/SchoolSchedule/Schedule" method="post">
	Course Name: <input type="text" name="title" size="35"><br>
	Course Time:
	Sun<input type="checkbox" name="day" value="sun">
	Mon<input type="checkbox" name="day" value="mon"> 
	Tue<input type="checkbox" name="day" value="tue"> 
	Wed<input type="checkbox" name="day" value="wed"> 
	Thu<input type="checkbox" name="day" value="thu"> 
	Fri<input type="checkbox" name="day" value="fri"> 
	Sat<input type="checkbox" name="day" value="sat">
	<select name="starttime">
		<option value="8">8:00am</option>
		<option value="9">9:00am</option>
		<option value="10">10:00am</option>
		<option value="11">11:00am</option>
		<option value="12">12:00pm</option>
		<option value="13">1:00pm</option>
		<option value="14">2:00pm</option>
		<option value="15">3:00pm</option>
		<option value="16">4:00pm</option>
		<option value="17">5:00pm</option>
		<option value="18">6:00pm</option>
		<option value="19">7:00pm</option>
		<option value="20">8:00pm</option>
		<option value="21">9:00pm</option>
	</select> 
	<select name="endtime">
		<option value="9">9:00am</option>
		<option value="10">10:00am</option>
		<option value="11">11:00am</option>
		<option value="12">12:00pm</option>
		<option value="13">1:00pm</option>
		<option value="14">2:00pm</option>
		<option value="15">3:00pm</option>
		<option value="16">4:00pm</option>
		<option value="17">5:00pm</option>
		<option value="18">6:00pm</option>
		<option value="19">7:00pm</option>
		<option value="20">8:00pm</option>
		<option value="21">9:00pm</option>
		<option value="22">10:00pm</option>
	</select>
	<br><br>
	<input type="submit" name="Submit" value="Add Course">
</form>



<TABLE border="1" cellspacing="0">
<TBODY>
<TR>
<TH align="center" valign="middle" width="80"></TH>
<TH align="center" valign="middle" width="100">Sunday</TH>
<TH align="center" valign="middle">Monday</TH>
<TH align="center" valign="middle">Tuesday</TH>
<TH align="center" valign="middle">Wednesday</TH>
<TH align="center" valign="middle">Thursday</TH>
<TH align="center" valign="middle">Friday</TH>
<TH align="center" valign="middle">Saturday</TH>
</TR>


<c:forEach begin="8" end="21" step="1" var="time">
<TR>
<TD align="center" valign="middle" width="80">
<c:choose>
<c:when test="${time == 12}">
<c:out value="${time}" />:00pm
</c:when>
<c:when test="${time > 12}">
<c:out value="${time - 12}" />:00pm
</c:when>
<c:otherwise>
<c:out value="${time}" />:00am
</c:otherwise>
</c:choose></TD>
<c:forEach begin="0" end="6" step="1" var="day">
<TD align="center" valign="middle" width="100">
<c:forEach items="${SchoolSchedule.classes}" var="sclass">
<c:if test="${sclass.startTime <= time 
&& sclass.endTime > time 
&& sclass.day == day}">
<c:out value="${sclass.title}" />
</c:if>
</c:forEach>
</TD>
</c:forEach>
</TR>
</c:forEach>
</TBODY>
</TABLE>

</body>
</html>