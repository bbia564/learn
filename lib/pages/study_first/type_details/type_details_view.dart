import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_records/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'type_details_logic.dart';

class TypeDetailsPage extends GetView<TypeDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TypeDetailsLogic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.typeEntity.title),
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: <Widget>[
            Expanded(
                child: controller.typeEntity.list.isEmpty
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
                        itemCount: controller.typeEntity.list.length,
                        itemBuilder: (_, index) {
                          final entity = controller.typeEntity.list[index];
                          return Container(
                            padding: const EdgeInsets.all(12),
                            child: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(27),
                                child: Image.memory(
                                  entity.image,
                                  width: 54,
                                  height: 54,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: <Widget>[
                                Text(
                                  entity.title,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  entity.content,
                                  style: const TextStyle(fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                ).marginOnly(top: 5)
                              ].toColumn(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start))
                            ].toRow(),
                          )
                              .decorated(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12))
                              .marginOnly(bottom: 10)
                              .gestures(onTap: () {
                            Get.toNamed('/studyAdd',
                                    arguments: controller.typeEntity,
                                    parameters: {'index': index.toString()})
                                ?.then((value) {
                              if (value != null) {
                                controller.typeEntity = value;
                                controller.typeEntity.list.sort((a, b) =>
                                    b.createTime.compareTo(a.createTime));
                                controller.update();
                              }
                            });
                          });
                        })),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                'Add',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
                .decorated(
                    color: primaryColor, borderRadius: BorderRadius.circular(8))
                .marginOnly(top: 10)
                .gestures(onTap: () {
              Get.toNamed('/studyAdd', arguments: controller.typeEntity)
                  ?.then((value) {
                if (value != null) {
                  controller.typeEntity = value;
                  controller.typeEntity.list
                      .sort((a, b) => b.createTime.compareTo(a.createTime));
                  controller.update();
                }
              });
            })
          ].toColumn().marginAll(15)),
        ),
      );
    });
  }
}
