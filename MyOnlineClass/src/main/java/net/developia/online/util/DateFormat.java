package net.developia.online.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	 Date date = new Date();
	
	 
	 
	 public String strDate() {
		 String strdate;
		 
		 SimpleDateFormat sDate = new SimpleDateFormat("yy/MM/dd");
		 strdate = sDate.format(new Date());
		 
		 return strdate;
	 }
}
