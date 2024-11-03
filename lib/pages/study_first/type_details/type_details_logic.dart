import 'package:get/get.dart';
import 'package:study_records/db_study/db_study.dart';

import '../../../db_study/study_entity.dart';

class TypeDetailsLogic extends GetxController {

  DBStudy dbStudy = Get.find<DBStudy>();
  TypeEntity typeEntity = Get.arguments;



  @override
  void onInit() {
    // TODO: implement onInit
    typeEntity.list.sort((a, b) => b.createTime.compareTo(a.createTime));
    update();
    super.onInit();
  }

}
