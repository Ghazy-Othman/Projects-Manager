//
//
//
import 'package:admin/controllers/upload_file_page_controller.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadFileScreen extends StatelessWidget {
  UploadFileScreen({super.key});

  final UploadFilePageController controller =
      Get.put(UploadFilePageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadFilePageController>(builder: (controller) {
      if (!controller.done) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getVerticalSize(20.0),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0, bottom: 25.0),
              child: Text(
                "Students file",
                style: TextStyle(
                  fontSize: getFontSize(32.0),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0C49CD),
                ),
              ),
            ),

            SizedBox(
              height: getVerticalSize(30.0),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0, bottom: 20.0),
              child: Text(
                  controller.fileUploaded
                      ? "Delete all data ."
                      : 'Upload file that contains students information.',
                  style: TextStyle(
                      fontSize: getFontSize(20),
                      color: const Color(0xFF2F2E41),
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0),
              child: Text(
                  controller.fileUploaded
                      ? "Note : This action will remove all students information with their groups and projects and it can't be undone!!"
                      : 'Note : File must be an excel file. '
                          '(Allowed extensions : xlsx )',
                  style: TextStyle(
                    fontSize: getFontSize(16),
                    color: const Color(0xFF2F2E41),
                  )),
            ),

            SizedBox(
              height: getVerticalSize(40),
            ),

            // Update btn
            Container(
              margin: getMargin(left: 25, right: 25),
              width: double.infinity,
              height: getVerticalSize(60.0),
              decoration: BoxDecoration(
                  color: controller.fileUploaded
                      ? Colors.grey[300]
                      : const Color(0xFF2F80ED),
                  borderRadius: BorderRadius.circular(8)),
              child: MaterialButton(
                child: Text(
                  controller.fileUploaded ? "Delete" : 'Upload file',
                  style: TextStyle(
                      fontSize: getFontSize(20),
                      color:
                          controller.fileUploaded ? Colors.red : Colors.white),
                ),

                ///TODO : Upload file
                onPressed: () {
                  ///TODO : Two actions to choose depends on fileUploaded
                  !controller.fileUploaded
                      ? controller.uploadFile()
                      : controller.deleteData();
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
