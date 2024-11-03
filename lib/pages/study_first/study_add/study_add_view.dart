import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_records/pages/study_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import 'study_add_logic.dart';

class StudyAddPage extends GetView<StudyAddLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudyAddLogic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.studyEntity == null ? 'Add knowledge point' : 'Edit knowledge point'),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                const Text(
                  'Select image',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 90,
                    height: 90,
                    child: controller.image == null
                        ? <Widget>[
                            Image.asset(
                              'assets/camera.webp',
                              width: 33,
                              height: 33,
                              fit: BoxFit.cover,
                            )
                          ].toColumn(
                            mainAxisAlignment: MainAxisAlignment.center)
                        : Image.memory(
                            controller.image!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ).decorated(color: Colors.grey.withOpacity(0.1)).gestures(
                      onTap: () {
                    controller.imageSelected();
                  }),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Knowledge point name',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 44,
                  child: StudyTextField(
                      maxLength: 20,
                      value: controller.title,
                      onChange: (value) {
                        controller.title = value;
                      }),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Take notes',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: StudyTextField(
                      maxLength: 200,
                      maxLines: 10,
                      value: controller.content,
                      onChange: (value) {
                        controller.content = value;
                      }),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    controller.studyEntity == null ? 'Add' : 'Edit',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
                    .decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8))
                    .marginOnly(top: 20)
                    .gestures(onTap: () {
                  controller.add(context);
                }),
                Visibility(
                  visible: controller.studyEntity != null,
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                      .decorated(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8))
                      .marginOnly(top: 20)
                      .gestures(onTap: () {
                    controller.delete(context);
                  }),
                )
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ),
          )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(10))
              .marginAll(15),
        ),
      );
    });
  }
}
