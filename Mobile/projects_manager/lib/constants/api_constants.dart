//
// API Constants
//
class ApiConstants {
  ///TODO : Add base url
  static String baseUrl = "";

  // Doctor
  static String doctorLogin = "$baseUrl/api/doctors/auth/login";
  static String getAddDoctors = "$baseUrl/api/doctors" ;


  // Students
  static String studentVerification = "$baseUrl/api/students/auth/student-verification" ;
  static String studentRegister = "$baseUrl/api/students/auth/register" ;
  static String studentLogin = "$baseUrl/api/students/auth/login" ;
  static String allStudents = "$baseUrl/api/students" ;
  static String checkStudents = "$baseUrl/api/check-students" ;

  // Groups
  static String createGroup = "$baseUrl/api/students/create-group" ;
  static String groupInfo = "$baseUrl/api/groups/" ;
  static String doctorGroups = "$baseUrl/api/doctor-groups/" ;


  // Add requests
  static String sendAddRequest = "$baseUrl/api/students/add-request" ;
  static String updateAddRequest = "$baseUrl/api/students/update-add-request" ;
  static String getAddRequests = "$baseUrl/api/students/get-add-requests/" ;


  // Projects
  static String sendProjectRequest = "$baseUrl/api/students/project-request" ;
  static String updateProjectRequest = "$baseUrl/api/doctors/update-project-request" ;
  static String getDoctorProjectsRequests ="$baseUrl/api/doctor-projcet-requests/" ;


  // Password
  static String forgetPassword = "$baseUrl/api/doctors/password/forget-password" ;
  static String resetPassword = "$baseUrl/api/doctors/password/reset-password" ;


  // Form rules
  static String getFormRules = "$baseUrl/api/form-rules/" ;
}
