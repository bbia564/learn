import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'study_rember_logic.dart';

class StudyRemberView extends GetView<PageLogic> {
  const StudyRemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.zieme.value
              ? const CircularProgressIndicator(color: Colors.yellow)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.meuodva();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
