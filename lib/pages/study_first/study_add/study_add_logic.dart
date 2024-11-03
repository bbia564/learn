import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study_records/db_study/study_entity.dart';

import '../../../db_study/db_study.dart';

class StudyAddLogic extends GetxController {
  DBStudy dbStudy = Get.find<DBStudy>();

  TypeEntity typeEntity = Get.arguments;
  StudyEntity? studyEntity;
  int? index;

  Uint8List? image;
  String title = '';
  String content = '';

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void add(BuildContext context) async {
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select an image');
      return;
    }
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter a title');
      return;
    }
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter content');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    final currentStudyEntity = StudyEntity(
        createTime: DateTime.now(),
        image: image!,
        title: title,
        content: content);
    if (studyEntity != null) {
      studyEntity!.image = image!;
      studyEntity!.title = title;
      studyEntity!.content = content;
      typeEntity.list[index!] = studyEntity!;
    } else {
      typeEntity.list.add(currentStudyEntity);
    }
    await dbStudy.updateData(typeEntity);
    Get.back(result: typeEntity);
  }

  void delete(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    typeEntity.list.removeAt(index!);
    await dbStudy.updateData(typeEntity);
    Get.back(result: typeEntity);
  }

  @override
  void onInit() {
    final result = Get.parameters['index'];
    if(result != null){
      index = int.parse(result);
      studyEntity = typeEntity.list[index!];
      image = studyEntity!.image;
      title = studyEntity!.title;
      content = studyEntity!.content;
    }
    update();
    super.onInit();
  }
}
