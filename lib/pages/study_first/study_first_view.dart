import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'study_first_logic.dart';

class StudyFirstPage extends GetView<StudyFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current learning"),
      ),
      body: <Widget>[
        Stack(
          children: [
            Image.asset(
              'assets/homeBG.webp',
              width: double.infinity,
              height: 209,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 160,
              child: <Widget>[
                const Text(
                  'Welcome to English Learning Diary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Here you can record and review your English study notes',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 105,
                  height: 32,
                  alignment: Alignment.center,
                  child: const Text(
                    'Add type',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ).decorated(
                    color: const Color(0xffffbe55),
                    borderRadius: BorderRadius.circular(10)).gestures(onTap: (){
                      controller.addType();
                })
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ).marginAll(15)
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(child: Obx(() {
          return controller.list.value.isEmpty
              ? <Widget>[
                  Image.asset(
                    'assets/noData.webp',
                    width: 63,
                    height: 63,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'No data',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ].toColumn(mainAxisAlignment: MainAxisAlignment.center)
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      child: <Widget>[
                        Image.asset(
                          'assets/book.webp',
                          width: 28,
                          height: 21,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: <Widget>[
                          Text(
                            entity.title,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Knowledge point: ${entity.list.length}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey),
                          ),
                        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
                      ].toRow(),
                    )
                        .decorated(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10))
                        .marginOnly(bottom: 10)
                        .gestures(onTap: () {
                          Get.toNamed('/typeDetails',arguments: entity)?.then((_) {
                            controller.getData();
                          });
                    });
                  });
        }))
      ].toColumn().marginAll(15),
    );
  }
}
