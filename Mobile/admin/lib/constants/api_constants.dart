//
// This file contains all API endpoints
//
class ApiConstants {

  ///TODO : Change base url to host url.
  static String baseUrl = "" ;


  // Admin
  static String adminRegister = "$baseUrl/api/admins/auth/register" ;
  static String adminLogin = "$baseUrl/api/admins/auth/login" ;
  static String getAdminInfo = "$baseUrl/api/admins/{admin_id}" ;
  static String addDoctor = "$baseUrl/api/admins/add-doctor" ;
  static String uploadFile = "$baseUrl/api/admins/upload-file" ;
  static String updateForm = "$baseUrl/api/admins/update-form-rules" ;
  static String forgetPassword = "$baseUrl/api/admins/password/forget-password" ;
  static String resetPassword = "$baseUrl/api/admins/password/reset-password" ;
  static String checkFile = "$baseUrl/api/check-file-uploaded/" ;
  static String getFormRules = "$baseUrl/api/form-rules/" ;

  // Doctor
  static String getAllDoctors = "$baseUrl/api/doctors" ;

}