import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_records/db_study/db_study.dart';
import 'package:study_records/pages/study_first/study_add/study_add_binding.dart';
import 'package:study_records/pages/study_first/study_add/study_add_view.dart';
import 'package:study_records/pages/study_first/study_first_binding.dart';
import 'package:study_records/pages/study_first/study_first_view.dart';
import 'package:study_records/pages/study_first/type_details/type_details_binding.dart';
import 'package:study_records/pages/study_first/type_details/type_details_view.dart';
import 'package:study_records/pages/study_second/study_second_binding.dart';
import 'package:study_records/pages/study_second/study_second_view.dart';
import 'package:study_records/pages/study_tab/study_tab_binding.dart';
import 'package:study_records/pages/study_tab/study_tab_view.dart';

Color primaryColor = const Color(0xffffbe55);
Color bgColor = const Color(0xfff8f8f8);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DBStudy().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Uss,
      initialRoute: '/studyTab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Uss = [
  GetPage(name: '/studyTab', page: () => StudyTabPage(), binding: StudyTabBinding()),
  GetPage(name: '/studyFirst', page: () => StudyFirstPage(), binding: StudyFirstBinding()),
  GetPage(name: '/studySecond', page: () => StudySecondPage(), binding: StudySecondBinding()),
  GetPage(name: '/studyAdd', page: () => StudyAddPage(), binding: StudyAddBinding()),
  GetPage(name:'/typeDetails', page: () => TypeDetailsPage(), binding: TypeDetailsBinding())
];
