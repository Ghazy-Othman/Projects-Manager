//
//
//



import 'package:projects_manager/data/models/student.dart';

class AddRequest {

  int? addRequestID ;
  int? groupID ;
  Student? senderStudent;
  int? receiverStudentId;
  int? status ;


  AddRequest.fromJson(Map<String , dynamic> json ) {
    addRequestID = json["add_request_id"] ;
    groupID = json["group_id"] ;
    senderStudent = Student.fromJson(json["sender_student"]) ;
    receiverStudentId = json["reciver_student_id"] ;
    status = json["status"] ;
  }





}