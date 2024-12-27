//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/student/notification_screen_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';

class StudentNotificationScreen extends StatelessWidget {
  StudentNotificationScreen({super.key});

  final NotificationScreenController controller =
      Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: GetBuilder<NotificationScreenController>(
            builder: (controller) {
              if (!controller.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(controller.addRes.isEmpty) {
                return const Center(child: Text("No notification for you ."),) ;
              }
              return ListView.builder(
                itemCount: controller.addRes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: getPadding(all: 20.0),
                    child: SizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400] , 
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(all: 10.0),
                              child: Text(
                                "${controller.addRes[index].senderStudent?.firstName} ${controller.addRes[index].senderStudent?.midName} ${controller.addRes[index].senderStudent?.lastName} asked you to join its group :" ,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: getFontSize(20.0) ,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            if (controller.addRes[index].status == 2)
                              Row(
                                children: [
                                  Padding(
                                    padding: getPadding(left: 25.0, right: 25.0 , bottom: 25.0),
                                    child: Container(
                                      height: getVerticalSize(50.0),
                                      width: getHorizontalSize(120.0),
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius: BorderRadius.circular(7.0)),
                                      child: MaterialButton(
                                        child: Text(
                                          'Accept',
                                          style: TextStyle(
                                              fontSize: getFontSize(18),
                                              color: Colors.white),
                                        ),
                                        onPressed: () {
                                          controller.updateAddRequestStatus(
                                              index, 1);
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(left: 25.0, right: 25.0 , bottom: 25.0 ),
                                    child: Container(
                                      height: getVerticalSize(50.0),
                                      width: getHorizontalSize(120.0),
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius: BorderRadius.circular(7.0)),
                                      child: MaterialButton(
                                        child: Text(
                                          'Reject',
                                          style: TextStyle(
                                              fontSize: getFontSize(18.0),
                                              color: Colors.white),
                                        ),
                                        onPressed: () {
                                          controller.updateAddRequestStatus(
                                              index,
                                              0);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
