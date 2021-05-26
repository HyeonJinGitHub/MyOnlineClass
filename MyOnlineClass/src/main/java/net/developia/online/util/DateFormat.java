package net.developia.online.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	Date date = new Date(); 
	
	public String strDate() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
		String strDate = simpleDateFormat.format(date); 
		return strDate;
	}

}
