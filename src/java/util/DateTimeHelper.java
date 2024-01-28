/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class DateTimeHelper {

    public static ArrayList<java.sql.Date> getCurrentWeekDates() {
        ArrayList<java.sql.Date> dates = new ArrayList<>();

        java.util.Date now = new java.util.Date();

        Calendar calendar = Calendar.getInstance();

        calendar.setTime(now);

        int currentDay = calendar.get(Calendar.DAY_OF_WEEK);

        int daysToSubtract = currentDay - Calendar.MONDAY; 
        
        calendar.add(Calendar.DAY_OF_MONTH, -daysToSubtract);


        for (int i = 0; i < 7; i++) {

            dates.add(convertUtilToSql(removeTimeFromDate(calendar.getTime())));

            calendar.add(Calendar.DAY_OF_MONTH, 1);
        }

        return dates;
    }

    public static Date getCurrentDate() {
        
        java.sql.Date date;
        
        java.util.Date now = new java.util.Date();

        Calendar calendar = Calendar.getInstance();

        calendar.setTime(now);

        java.util.Date dateWithoutTime = removeTimeFromDate(calendar.getTime());

        date = convertUtilToSql(dateWithoutTime);

        return date;
    }

    public static java.util.Date removeTimeFromDate(java.util.Date inputDate) {

        if (inputDate == null) {
            return null;
        }

        Calendar cal = Calendar.getInstance();

        cal.setTime(inputDate);

        cal.set(Calendar.HOUR_OF_DAY, 0); 
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);


        return cal.getTime();
    }

    public static java.sql.Date convertUtilToSql(java.util.Date uDate) {

        if (uDate == null) {
            return null;
        }

        return new java.sql.Date(uDate.getTime());
    }

    public static ArrayList<java.sql.Date> getSqlDatesInRange(String startDateStr, String endDateStr) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        java.util.Date parsedStartDate = dateFormat.parse(startDateStr);
        java.util.Date parsedEndDate = dateFormat.parse(endDateStr);

        java.sql.Date startDate = new java.sql.Date(parsedStartDate.getTime());
        java.sql.Date endDate = new java.sql.Date(parsedEndDate.getTime());

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDate);

        ArrayList<java.sql.Date> dates = new ArrayList<>();

        while (!calendar.getTime().after(endDate)) {
            dates.add(new java.sql.Date(calendar.getTimeInMillis()));
            calendar.add(Calendar.DAY_OF_MONTH, 1);
        }

        return dates;
    }

    public static java.sql.Date getSqlDatesInDay(String DateStr) throws ParseException {

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        java.util.Date parsedDateStr = dateFormat.parse(DateStr);

        java.sql.Date Date = new java.sql.Date(parsedDateStr.getTime());

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(Date);

        java.sql.Date date = null;

        return date;
    }

}