
import 'package:guzo_go_demo/core/controllers/homepage_controller.dart';
import 'package:guzo_go_demo/locator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';



import 'package:intl/date_symbol_data_local.dart' as date_format;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  Get.put(HomePageController());
  runApp(const MyApp());

  // Future.delayed(const Duration(milliseconds: 250), () async {
  //   // await settingController.autoLogin();
  // });
}
