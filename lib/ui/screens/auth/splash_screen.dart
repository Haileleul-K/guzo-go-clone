import 'dart:async';

import 'package:guzo_go_demo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashView extends StatefulWidget {

  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
 
    super.initState();
    _proceedMethod();
  }

  @override
   Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //    systemNavigationBarColor: Colors.green,
    // //   statusBarColor: Colors.green
    // ));
  var  screenHeight = MediaQuery.of(context).size.height;
  var  screenWidth = MediaQuery.of(context).size.width;
  var  bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      
      backgroundColor: AppColors.primaryAppColor,
      body: Center(
        child: Container(padding: EdgeInsets.only(top: screenHeight*0.09,),
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            
           ),
          child: Center(child: Image.asset('assets/images/go.png',scale: 0.5,color: AppColors.secondaryAppColor,)),
        ),
      ),
    );
  }
  route() {
   Get.toNamed('/nav');
  }
  _proceedMethod() async{
    var duration = const Duration(seconds: 5);
    return  Timer(duration, route);  
  }
}
