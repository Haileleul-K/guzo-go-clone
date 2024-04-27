import 'package:guzo_go_demo/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';

import 'ui/router.dart';



class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final settingController = Get.put(SettingController());
    // PlatformDispatcher.instance.onLocaleChanged = rebuildOnLocaleChange();
    ///   Intl.systemLocale= settingController.localLabel.value;
    /// // Set the status bar and navigation bar colors to green
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return OverlaySupport.global(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        onGenerateRoute: AppRouter.generateRoute,
    //    locale: settingController.savedLocalLanguage,
      //  theme: settingController.savedTheme,
         
        theme: Themings.lightTheme,
        //translations: LocaleString(),
        fallbackLocale: const Locale('en', 'US'),
        builder: EasyLoading.init(),
      ),
    );
  }
}
