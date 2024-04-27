import 'package:guzo_go_demo/constants.dart';
import 'package:guzo_go_demo/core/controllers/homepage_controller.dart';
import 'package:guzo_go_demo/theme/theme.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return portraitView();
  }

  Widget portraitView() {
    {
      return Scaffold(
        backgroundColor: AppColors.primaryAppColor,
        body: Container(
          padding: EdgeInsets.only(top: 20),
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              _bannerWithNotification(),
              _homePageUpperContent(),
              Expanded(child: _homeBottomComponent())
            ],
          ),
        ),
      );
    }
  }

  Widget _bannerWithNotification() {
    return ListTile(
      contentPadding: EdgeInsets.only(right: 8),
      title: Padding(
        padding: EdgeInsets.all(Get.width * 0.02),
        child: Image.asset(
          'assets/images/go.png',
          height: Get.height * 0.07,
        ),
      ),
      trailing: Container(
          padding: EdgeInsets.all(Get.width * 0.02),
          decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: AppColors.lightGrayText,
              ),
              borderRadius: BorderRadius.circular(8)),
          child: Icon(
            Icons.notifications,
            color: AppColors.whiteColor,
            size: Get.height * 0.03,
          )),
    );
  }

  Widget _homePageUpperContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [_waySelect(), _addressSelection()],
      ),
    );
  }

  double containerWidth = Get.width * 0.96;
  Widget _waySelect() {
    return Obx(() {
      return Container(
        width: containerWidth,
        padding: EdgeInsets.all(2),
        margin:
            EdgeInsets.only(top: Get.height * 0.06, bottom: Get.height * 0.02),
        //  width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                controller.returnSelected.value = true;
                controller.onWaySelected.value = false;
              },
              child: Container(
                width: containerWidth / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: controller.returnSelected.value
                        ? AppColors.whiteColor
                        : null),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text(
                    'Return',
                    style: AppConstants.boldTextStyle(
                        fontSize: 15,
                        color: controller.returnSelected.value
                            ? AppColors.primaryAppColor
                            : AppColors.whiteColor),
                  ),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.onWaySelected.value = true;
                controller.returnSelected.value = false;
              },
              child: Container(
                //  width: double.infinity*0.5,
                width: (containerWidth / 2) - 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: controller.onWaySelected.value
                        ? AppColors.whiteColor
                        : null),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text(
                    'One-way',
                    style: AppConstants.boldTextStyle(
                        fontSize: 15,
                        color: controller.onWaySelected.value
                            ? AppColors.primaryAppColor
                            : AppColors.whiteColor),
                  ),
                )),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _addressSelection() {
    return Obx(() {
        return Container(
            padding: EdgeInsets.all(Get.width * 0.02),
            margin:
                EdgeInsets.only(right: Get.width * 0.03, bottom: Get.width * 0.22),
            height: Get.width * 0.25,
            child: Row(
              //  mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.isforFrom.value =true;
                    controller.airportDisplay();
                  } ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'From',
                        style: AppConstants.lightTextStyle(
                            fontSize: 11, color: AppColors.whiteColor),
                      ),
                      Text(
                        controller.dipaCode.value,
                        style: AppConstants.boldTextStyle(
                            fontSize: 24, color: AppColors.whiteColor),
                      ),
                      Text(
                        controller.dipaName.value,
                        style: AppConstants.lightTextStyle(
                            fontSize: 13, color: AppColors.whiteColor),
                      ),
                      Text(
                        controller.dipaAirP.value,
                        style: AppConstants.lightTextStyle(
                            fontSize: 10, color: AppColors.whiteColor),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){

                    
                   // Store the initial values in temporary variables
  var tempName = controller.destName.value;
  var tempCode = controller.destCode.value;
  var tempAirP = controller.desAirP.value;

  // Update the original variables with the values from the destination
  controller.destName.value = controller.dipaName.value;
  controller.destCode.value = controller.dipaCode.value;
  controller.desAirP.value = controller.dipaAirP.value;

  // Update the destination variables with the values from the temporary variables
  controller.dipaName.value = tempName;
  controller.dipaCode.value = tempCode;
  controller.dipaAirP.value = tempAirP;
                  },
                  child: Container(
                    height: Get.width * 0.1,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.compare_arrows_sharp,
                      size: Get.width * 0.06,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.isforTo.value =true;
                    controller.airportDisplay();
                  } ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'To',
                        style: AppConstants.lightTextStyle(
                            fontSize: 11, color: AppColors.whiteColor),
                      ),
                      Text(
                        controller.destCode.value,
                        style: AppConstants.boldTextStyle(
                            fontSize: 24, color: AppColors.whiteColor),
                      ),
                      Text(
                        controller.destName.value,
                        style: AppConstants.lightTextStyle(
                            fontSize: 13, color: AppColors.whiteColor),
                      ),
                      Text(
                        controller.desAirP.value,
                        style: AppConstants.lightTextStyle(
                            fontSize: 10, color: AppColors.whiteColor),
                      )
                    ],
                  ),
                ),
              ],
            ));
      }
    );
  }

  Widget _homeBottomComponent() {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _detailsInfo(),

           _serchButton()
        ],
      ),
    );
  }

  _detailsInfo() {
    return Obx( () {
        return Container(
          child: Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.54,
                  decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: AppColors.hintTextColor
                        )
                        
                      )
                    ),
                  padding: EdgeInsets.only(top:Get.width*0.03,left: Get.width*0.05,right: Get.width*0.15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Departure Date',
                      style:
                          AppConstants.lightTextStyle(fontSize: 14, color: Colors.black)
                              .copyWith(),
                    ),
                    SizedBox(height: Get.height*0.022,),
                    Row(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '26',
                          style: AppConstants.lightTextStyle(
                                  fontSize: 53, color: AppColors.primaryAppColor)
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: Get.width*0.015,),
                        Text(
                          'Fri\nFeb',
                          style: AppConstants.lightTextStyle(
                                  fontSize: 23, color: Colors.black)
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )),
              
              
            if(controller.returnSelected.value)     
             Container(
             padding: EdgeInsets.only(top:Get.width*0.03,left: Get.width*0.05,right:Get.width*0.05),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Return Date',
                 style:
                     AppConstants.lightTextStyle(fontSize: 14, color: Colors.black)
                         .copyWith(),
               ),
               SizedBox(height: Get.height*0.022,),
               Row(
               //  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     '29',
                     style: AppConstants.lightTextStyle(
                             fontSize: 53, color: AppColors.primaryAppColor)
                         .copyWith(fontWeight: FontWeight.bold),
                   ),
                   SizedBox(width: Get.width*0.015,),
                   Text(
                     'Sat\nFeb',
                     style: AppConstants.lightTextStyle(
                             fontSize: 23, color: Colors.black)
                         .copyWith(fontWeight: FontWeight.bold),
                   )
                 ],
               )
             ],
                       )),

              ],
            ),
            Container(
                decoration: BoxDecoration(
              border: Border.all(
                 width: 1,
                    color: AppColors.hintTextColor
                
                
              )
                ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                    return InkWell(
                      onTap: ()  =>  controller.openBottomSheet(),
                      child: Container(
                        width: Get.width*0.54,
                        decoration: BoxDecoration(
                border: const Border(
                   right: BorderSide(
                    width: 1,
                      color: AppColors.hintTextColor
                  
                   )
                  
                )
                ),
                        padding: EdgeInsets.only(top:Get.width*0.03,left: Get.width*0.05),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                          Text(
                            'Cabin Class',
                            style:
                                AppConstants.lightTextStyle(fontSize: 14, color: Colors.black)
                                    .copyWith(),
                          ),
                          SizedBox(height: Get.height*0.012,),
                          Padding(
                            padding: EdgeInsets.only(bottom: Get.height*0.012),
                            child: Text(
                                  controller.selectedClassName.value,
                                  style: AppConstants.lightTextStyle(
                                          fontSize: 23, color: AppColors.primaryAppColor)
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                          )
                                            ],
                                          ),
                      ),
                    );
                  }
                ),
              
              Obx(() {
                  return GestureDetector(
                    onTap: () => controller.passengerBottomSheet(),
                    child: Container(
                      
                      padding: EdgeInsets.only(top:Get.width*0.03,left: Get.width*0.05,right: Get.width*0.088),
                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                          Text(
                            'Passengers',
                            style:
                                AppConstants.lightTextStyle(fontSize: 14, color: Colors.black)
                                    .copyWith(),
                          ),
                          SizedBox(height: Get.height*0.012,),
                          Container(
                          //  crossAxisAlignment: CrossAxisAlignment.start,
                          
                          child:    Padding(
                            padding: EdgeInsets.only(bottom: Get.height*0.012),
                            child: Row(
                              children: [
                                Icon(Icons.boy_rounded,size: Get.width*0.07,),
                                Text(controller.adultNo.value.toString(),style: AppConstants.lightTextStyle(fontSize: 13,color: AppColors.primaryAppColor),),
                                SizedBox(width: 10,),
                                Icon(Icons.boy_rounded,size: Get.width*0.05,),
                                Text(controller.tinegeNo.value.toString(),style: AppConstants.lightTextStyle(fontSize: 13,color: AppColors.primaryAppColor),),
                                SizedBox(width: 10,),
                                Icon(Icons.boy_rounded,size: Get.width*0.03,),
                                Text(controller.babyNo.value.toString(),style: AppConstants.lightTextStyle(fontSize: 13,color: AppColors.primaryAppColor),),
                                SizedBox(width: 10,)
                              ],
                            ),
                          ),
                            
                          
                          )
                                              ],
                                            ),
                    ),
                  );
                }
              ),
               
              ],
              ),
            )
          ]),
        );
      }
    );
  }

  _serchButton() {
    return Padding(
      padding:  EdgeInsets.only(top: 80.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: Get.width*0.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.secondaryAppColor
        ),
        width: Get.width*0.7,
        child: Center(child: Text('Search Flight',style: AppConstants.lightTextStyle(fontSize: 20,color: AppColors.primaryAppColor),)),)
    );
  }
}
