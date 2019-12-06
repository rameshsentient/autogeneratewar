package com.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String fullDateTimeFormat = "dd MMM yy HH:mm";
	
	public static String sqlDateTimeFormat = "yyyy-MM-dd HH:mm";
	
    public static String dateToStrDateTime(Date date){
		DateFormat format = new SimpleDateFormat(fullDateTimeFormat);
		
		return format.format(date);
	}
    
    public static String dateToStrSqlDateTime(Date date){
		DateFormat format = new SimpleDateFormat(sqlDateTimeFormat);
		
		return format.format(date);
	}

}
