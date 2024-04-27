// // ignore_for_file: constant_identifier_names

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';

// import '../../controllers/setting_controller.dart';

// class DioService {
//   static String baseUrl = 'https://standard.hrotg.com/api/';
//   static String adminToken = "EUJKbhKXOWEP6_sHPciKA7ESknwPnMo0";
//   static Dio getDio() {
//     Dio dio = Dio(
//       BaseOptions(
//         baseUrl: baseUrl,
//         headers: getHeader(),
//       ),
//     );
//     dio.interceptors.add(getInterceptor());
//     return dio;
//   }

//   static Dio getDioAuth(
//       {bool useAdminToken = false, String specialBaseUrl = ""}) {
//     Dio dio = Dio(
//       BaseOptions(
//         baseUrl: specialBaseUrl.isNotEmpty ? specialBaseUrl : getBaseUrl(),
//         headers: getHeader(isAuth: true, useAdmin: useAdminToken),
//         connectTimeout: 60000,
//         receiveTimeout: 70000,
//       ),
//     );
//     dio.interceptors.add(getInterceptor());
//     return dio;
//   }

//   static String getBaseUrl() {
//     final settingController = Get.put(SettingController());
//     if (settingController.userInfo4.isNotEmpty) {
//       return "${settingController.userInfo4}/";
//     } else {
//       return baseUrl;
//     }
//   }

//   static getHeader({bool isAuth = false, bool useAdmin = false}) {
//     var header = {
//       'content-Type': 'application/json',
//       // 'Content-Type': isUpload ? 'multipart/form-data' : 'application/json',
//     };

//     if (isAuth) {
//       final settingController = Get.put(SettingController());

//       // String token =
//       //     useAdmin ? adminToken : settingController.userInfo1.accessToken;
//       // header['authorization'] = 'Bearer $token';
//     }
//     debugPrint('header $header');
//     return header;
//   }

//   static InterceptorsWrapper getInterceptor() {
//     var logger = Logger();
//     return InterceptorsWrapper(
//       onRequest: (requestOptions, handler) {
//         logger.d(
//           'REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}'
//           '=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}',
//         );
//         logger.d('REQUEST DATA==> ${requestOptions.data.toString()}');
//         return handler.next(requestOptions);
//       },
//       onResponse: (response, handler) {
//         logger.i('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
//         return handler.next(response);
//       },
//       onError: (err, handler) {
//         logger.e('RESPONSE[${err.response?.statusCode}]', [err]);
//         logger.e('RESPONSE[BODY]', [err.response?.data]);

//         if (err.response?.statusCode == 401) {
//           // Get.put(SettingController()).clearLoginInfo();
//           // Get.offAndToNamed("/F01");
//           EasyLoading.dismiss();
//           showTokenExpDialog();
//         } else {
//           return handler.next(err);
//         }
//       },
//     );
//   }
// }

// showTokenExpDialog() {
//   AwesomeDialog(
//     // dismissOnTouchOutside: true,
//     headerAnimationLoop: false,
//     context: Get.context!,
//     animType: AnimType.scale,
//     dialogType: DialogType.noHeader,
//     btnOkText: "ok".tr,
//     btnOkColor: Colors.blue,
//     showCloseIcon: true,
//     btnOkOnPress: () async {
//       Get.put(SettingController()).userLogout(needRequest: false);
//       Get.offAndToNamed("/F01");
//     },
//     btnCancel: null,
//     btnCancelText: "cancel".tr,
//     btnCancelColor: Colors.red,
//     btnCancelOnPress: () {
//       Get.put(SettingController()).userLogout(needRequest: false);
//       Get.offAndToNamed("/F01");
//     },
//     title: "expired_login".tr,
//     titleTextStyle: Theme.of(Get.context!).textTheme.titleSmall,
//     desc: "token_expired".tr,
//     descTextStyle: Theme.of(Get.context!).textTheme.titleSmall,
//     dialogBackgroundColor: Theme.of(Get.context!).dialogBackgroundColor,
//   ).show();
// }
