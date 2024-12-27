//
//
//
import 'package:admin/controllers/form_page_controller.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final FormPageController controller = Get.put(FormPageController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: getVerticalSize(20.0),
      ),
      Padding(
        padding: getPadding(left: 25.0, right: 25.0, bottom: 25.0),
        child: Text(
          "Form Rules",
          style: TextStyle(
            fontSize: getFontSize(32.0),
            fontWeight: FontWeight.w500,
            color: const Color(0xFF0C49CD),
          ),
        ),
      ),

      // Number of students
      Container(
        padding: getPadding(all: 15.0),
        margin: getMargin(left: 25.0, right: 25.0),
        decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Number of students per group:',
                style: TextStyle(
                    fontSize: getFontSize(20),
                    color: const Color(0xFF2F2E41),
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: getPadding(top: 7.0, bottom: 7.0),
              child: Text(
                'Min:',
                style: TextStyle(
                  fontSize: getFontSize(20),
                  color: const Color(0xFF00A3FF),
                ),
              ),
            ),
            SizedBox(
              height: getVerticalSize(60.0),
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: controller.studentsMinController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: const Color(0xFF0C49CD),
                        fontSize: getFontSize(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF0C49CD), width: 2))),
              ),
            ),
            Padding(
              padding: getPadding(top: 7.0, bottom: 7.0),
              child: Text(
                'Max:',
                style: TextStyle(
                  fontSize: getFontSize(20),
                  color: const Color(0xFF00A3FF),
                ),
              ),
            ),
            SizedBox(
              height: getVerticalSize(60.0),
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: controller.studentsMaxController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: const Color(0xFF0C49CD),
                        fontSize: getFontSize(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF0C49CD), width: 2))),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: getVerticalSize(25),
      ),

      // Number of groups
      Container(
          padding: getPadding(all: 15.0),
          margin: getMargin(left: 25.0, right: 25.0),
          decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Number of groups for a doctor:',
                style: TextStyle(
                    fontSize: getFontSize(20),
                    color: const Color(0xFF2F2E41),
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: getPadding(top: 7.0, bottom: 7.0),
              child: Text(
                'Max:',
                style: TextStyle(
                  fontSize: getFontSize(20),
                  color: const Color(0xFF00A3FF),
                ),
              ),
            ),
            SizedBox(
              height: getVerticalSize(60.0),
              child: TextField(
                controller: controller.groupMaxController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: const Color(0xFF0C49CD),
                        fontSize: getFontSize(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF0C49CD), width: 2))),
              ),
            )
          ])),
      SizedBox(
        height: getVerticalSize(25),
      ),

      // Mix
      Container(
          padding: getPadding(all: 10.0),
          margin: getMargin(left: 20.0, right: 20.0),
          decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GetBuilder<FormPageController>(builder: (controller) {
              return CheckboxListTile(
                  title: Text(
                    "Ability of mix : ",
                    style: TextStyle(
                        fontSize: getFontSize(20.0),
                        color: const Color(0xFF2F2E41),
                        fontWeight: FontWeight.bold),
                  ),
                  value: controller.abilityOfMix,
                  onChanged: (v) {
                    controller.updateAbilityOfMix();
                  });
            })
          ])),
      SizedBox(
        height: getVerticalSize(20),
      ),

      // Update btn
      Container(
        margin: getMargin(left: 20, right: 20),
        width: double.infinity,
        height: getVerticalSize(60.0),
        decoration: BoxDecoration(
            color: const Color(0xFF2F80ED),
            borderRadius: BorderRadius.circular(8)),
        child: MaterialButton(
          child: Text(
            'Update',
            style: TextStyle(fontSize: getFontSize(20), color: Colors.white),
          ),
          onPressed: () {
            controller.updateForm();
          },
        ),
      ),
      SizedBox(
        height: getVerticalSize(30),
      ),
    ]));
  }
}
