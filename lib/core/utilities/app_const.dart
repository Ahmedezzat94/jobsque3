class AppConst{

  static const String emailKey = "EMAIL";
  static const String idKey = "ID";
  static const String otpKey = "OTP";
  static const String userNameKey = "NAME";
  static const String tokenKey = "TOKEN";
  static const String profileKey = "PROFILE";
  static const String searchKey = "SEARCHKEY";
  static const String applyKey = "ApplyKey";


  static const String baseUrl = "http://167.71.79.133/api";
  static const String registerEndPoin = "/auth/register";
  static const String loginEndPoint = "/auth/login";
  static const String recenJobEndPoint = "/jobs";
  static const String searchEndpoint = "/jobs/search";
  static const String filterEndPoint = "/jobs/filter";
  static const String favoriteEndPoint = "favorites";
  static const String applyEndPoint = "apply";
  static const String editProfileBioMobileAddress = "/user/profile/edit/";
  static const String editProfileLanguageEndPoint = "user/profile/language/";
  static const String addEducationEndPoint ="education";

  // static const String addEducationEndPoint ="";
  // static const String addEducationEndPoint ="";
  // static const String addEducationEndPoint ="";

  static String showEducationEndPoint(int id) => "education/$id";
  static  String otpEndPoint(String email) => "/auth/otp/$email";
  static  String tokenEndPoint(int id) => "/auth/profile/$id";
  static String updateEndPoint(int id) => "/user/profile/$id";
  static String suggestedJobEndPoint(int id) => "/jobs/sugest/$id";

  static const String db ="AppDb";
  static const String sqfliteDB ="App_database.db";

}