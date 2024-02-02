/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Admin 
 */
public class DateTimeHelper {
    public static ArrayList<java.sql.Date> getCurrentWeekDates() {
        // Create an instance of ArrayList to hold the dates.
        ArrayList<java.sql.Date> dates = new ArrayList<>();

        // Get the current date.
        java.util.Date now = new java.util.Date();

        // Create an instance of the Calendar object
        Calendar calendar = Calendar.getInstance();

        // Set the calendar time to the current date.
        calendar.setTime(now);

        // Determine the current day of the week (1 = Sunday, 2 = Monday, ..., 7 = Saturday)
        int currentDay = calendar.get(Calendar.DAY_OF_WEEK);

        // Calculate how much to add or subtract to get Monday's date.
        // Note: Calendar.DAY_OF_WEEK starts from 1 (Sunday) and ends at 7 (Saturday).
        int daysToSubtract = currentDay - Calendar.MONDAY; // For Monday, this would be 0.
        // Adjust the calendar to the beginning of the week (Monday)
        calendar.add(Calendar.DAY_OF_MONTH, -daysToSubtract);

        // For each day from Monday to Sunday, add the corresponding date to the ArrayList.
        for (int i = 0; i < 7; i++) {
            // Add the current calendar date to the list.
            dates.add(convertUtilToSql(removeTimeFromDate(calendar.getTime())));

            // Move the calendar to the next day.
            calendar.add(Calendar.DAY_OF_MONTH, 1);
        }

        return dates;
    }
    
    public static java.util.Date removeTimeFromDate(java.util.Date inputDate) {
        // Check for null input date
        if (inputDate == null) {
            return null;
        }

        // Create an instance of the calendar
        Calendar cal = Calendar.getInstance();
        // Set the calendar time to the input date
        cal.setTime(inputDate);

        // Set the time fields to zero
        cal.set(Calendar.HOUR_OF_DAY, 0); // Use 24-hour time format
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);

        // Return the date part only
        return cal.getTime();
    }
    
    public static java.sql.Date convertUtilToSql(java.util.Date uDate) {
        // Check for null
        if (uDate == null) {
            return null;
        }

        // java.sql.Date constructor takes the milliseconds since January 1, 1970, 00:00:00 GMT (the standard base time);
        // getTime() from java.util.Date provides it.
        return new java.sql.Date(uDate.getTime());
    }
    
    public static ArrayList<java.sql.Date> getSqlDatesInRange(String startDateStr, String endDateStr) throws ParseException {
        // Define the date format, e.g., "yyyy-MM-dd" for ISO 8601 format.
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        // Parse the date strings into java.util.Date objects.
        java.util.Date parsedStartDate = dateFormat.parse(startDateStr);
        java.util.Date parsedEndDate = dateFormat.parse(endDateStr);

        // Convert java.util.Date to java.sql.Date for the start and end dates.
        java.sql.Date startDate = new java.sql.Date(parsedStartDate.getTime());
        java.sql.Date endDate = new java.sql.Date(parsedEndDate.getTime());

        // Create a Calendar instance to iterate through the date range.
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDate);

        ArrayList<java.sql.Date> dates = new ArrayList<>();

        // Use a loop to go through each date in the range and add it to the list.
        while (!calendar.getTime().after(endDate)) {
            dates.add(new java.sql.Date(calendar.getTimeInMillis()));
            calendar.add(Calendar.DAY_OF_MONTH, 1);
        }

        return dates;
    }

}
