import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_records/pages/study_first/study_first_view.dart';

import '../../main.dart';
import '../study_second/study_second_view.dart';
import 'study_tab_logic.dart';

class StudyTabPage extends GetView<StudyTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          StudyFirstPage(),
          StudySecondPage(),
        ],
      ),
      bottomNavigationBar: Obx(()=>_navEnBars()),
    );
  }

  Widget _navEnBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.home, color: primaryColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.settings,color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
