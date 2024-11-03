import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'study_second_logic.dart';

class StudySecondPage extends GetView<StudySecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all records', 'About US'];
    const icons = [
      Icon(
        Icons.delete_forever_outlined,
        size: 20,
        color: Colors.grey,
      ),
      Icon(
        Icons.info,
        size: 20,
        color: Colors.grey,
      )
    ];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        icons[index],
        const SizedBox(
          width: 10,
        ),
        Text(titles[index]),
      ].toRow(mainAxisAlignment: MainAxisAlignment.start),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanData();
          break;
        case 1:
          controller.aboutUS(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                _item(0, context),
                _item(1, context),
              ].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
