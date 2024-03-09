/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author anhye
 */
public class Constants {
	public static String GOOGLE_CLIENT_ID = System.getenv("GOOGLE_CLIENT_ID");
	public static String GOOGLE_CLIENT_SECRET = System.getenv("GOOGLE_CLIENT_SECRET");
	public static String GOOGLE_REDIRECT_URI = System.getenv("GOOGLE_REDIRECT_URI");
	public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
	public static String GOOGLE_GRANT_TYPE = "authorization_code";
	public static final String[] PROFILE_OPTION = new String[]{"information", "change password"};
        public static final String PATH_DOWN = "D:/data.xlsx";
}


