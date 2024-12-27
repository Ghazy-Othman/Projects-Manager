//
//
//
import 'dart:io';
import 'package:admin/core/utils/pref_helper.dart';
import 'package:admin/services/admin_services.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as getx;

class UploadFilePageController extends getx.GetxController {
  bool fileUploaded = false;
  bool done = false;

  @override
  void onInit() {
    checkIFAlreadyFileUploaded();
    super.onInit();
  }

  Future<void> checkIFAlreadyFileUploaded() async {
    fileUploaded = await AdminServices.checkFile(
        (await PrefHelper.getAdminInfo()).section!);
    done = true;
    update();
  }

  //
  Future<void> uploadFile() async {
    File? file = await _pickFile();
    if (file != null) {
      Map<String, dynamic> data = {
        "students": await MultipartFile.fromFile(file.path)
      };
      bool res = await AdminServices.uploadFile(data);
      if (res) {
        fileUploaded = true ;
        update() ;
        Fluttertoast.showToast(msg: "File uploaded successfully");
      }
    } else {
      Fluttertoast.showToast(msg: "Failed to select file . Try again.");
    }
  }

  //
  Future<File?> _pickFile() async {
    FilePickerResult? file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["xlsx"]);
    if (file != null) {
      return File(file.files.single.path!);
    }
    return null;
  }

  Future<void> deleteData() async {
    ///TODO : Make endpoint for delete all data , and call this function
  }
}
