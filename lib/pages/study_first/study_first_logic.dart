import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:study_records/db_study/db_study.dart';
import 'package:study_records/db_study/study_entity.dart';
import 'package:study_records/pages/study_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

class StudyFirstLogic extends GetxController {
  DBStudy dbStudy = Get.find<DBStudy>();

  var list = <TypeEntity>[].obs;

  void getData() async {
    list.value = await dbStudy.getAllData();
  }

  addType() async {
    var title = '';
    Get.dialog(AlertDialog(
      title: const Text(
        'Add Type',
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: double.infinity,
        height: 40,
        child: StudyTextField(
            hintText: 'Enter your type',
            textAlign: TextAlign.center,
            maxLength: 20,
            value: title,
            onChange: (value) {
              title = value;
            }),
      ).decorated(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white),
      actions: [
        <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: () async {
              if (title.isEmpty) {
                Fluttertoast.showToast(msg: 'Please input your type');
                return;
              }
              final entity = TypeEntity(
                  id: 0,
                  createTime: DateTime.now(),
                  title: title,
                  list: []);
              await dbStudy.insertData(entity);
              getData();
              Get.back();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.black),
            ),
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.center)
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
