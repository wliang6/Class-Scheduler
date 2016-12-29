package org.eclipse.wtp.sample.classschedule;

public class SchoolClass {

	private String title;
	private int day;
	private int startTime;
	private int endTime;
	
	public SchoolClass(String title, int startTime, int endTime, int day){
		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
		this.day = day;
	}

	public String getTitle() {
		return title;
	}

	public int getDay() {
		return day;
	}

	public int getStartTime() {
		return startTime;
	}

	public int getEndTime() {
		return endTime;
	}
}
