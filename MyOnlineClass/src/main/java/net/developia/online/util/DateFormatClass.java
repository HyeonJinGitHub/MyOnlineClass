package net.developia.online.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateFormatClass {
	private static String strdate;
	
	
	public String getStrdate() {
		strdate = strDateNow();
		return strdate;
	}


	public void setStrdate(String strdate) {
		this.strdate = strdate;
	}


	public static String strDateNow() {
		Date date = new Date();

		SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
		strdate = sDate.format(new Date());

		return strdate;
	}
	
	public static String strDateEnd(long date) {
		String enddate = strDateNow();
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        cal.add(Calendar.DATE, (int) date);
        enddate = df.format(cal.getTime());
        System.out.println("date num : " + date + "end date: " + df.format(cal.getTime()));
		return enddate;
	}
}
