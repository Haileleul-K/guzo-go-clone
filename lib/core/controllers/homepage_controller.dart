import 'package:guzo_go_demo/constants.dart';
import 'package:guzo_go_demo/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

class HomePageController extends GetxController {
  var salseDropdownValue = 'This Weak'.obs;

  var salseDropDownItmes = [
    'This Weak',
    'This Month',
    'ThisYear',
  ].obs;

  var onWaySelected = false.obs;
  var returnSelected = true.obs;
  var isEconomy = true.obs;
  var isBussines = false.obs;
  var isFirst = false.obs;

  var classNames = ['Economy', 'Bussiness', 'First'].obs;

  var airports = [
    ['Desse airport', 'Desse', 'DSS'],
    ['Gonder airport', 'Gonder', 'GDD'],
    ['Gambella airport', 'Gambella', 'GMB'],
    ['Mekele  airport', 'Mekele', 'MKL'],
    ['Awassa airport', 'Awasa', 'AWS'],
    ['Metu international airport', 'Metu', 'MTU'],
    ['Addis ababa airport', 'Addis', 'ADD'],
  ].obs;
  var dipaCode = 'ADD'.obs;
  var dipaName = 'Addis'.obs;
  var dipaAirP = 'Addis ababa airport'.obs;
  var destCode = 'GDD'.obs;
  var destName = 'Gonder'.obs;
  var desAirP = 'Gonder airport'.obs;

  var isforFrom = false.obs;
  var isforTo = false.obs;
  var adultNo = 0.obs;
  var tinegeNo = 0.obs;
  var babyNo = 0.obs;

  late int adultEditted;
  late int tinEditted;
  late int babyEditted;

  var selectedClassName = 'Economy'.obs;
  void openBottomSheet() {
    Get.bottomSheet(Container(
      color: AppColors.whiteColor,
      child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Obx(() {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cabin Class',
                    style: AppConstants.boldTextStyle(
                        fontSize: 16, color: AppColors.primaryAppColor),
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Text(
                      'Cancel',
                      style: AppConstants.boldTextStyle(
                          fontSize: 16, color: AppColors.primaryAppColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
              InkWell(
                onTap: () => _changeClass(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      classNames[0],
                      style: AppConstants.lightTextStyle(
                          fontSize: 16, color: AppColors.primaryAppColor),
                    ),
                    if (isEconomy.value)
                      Icon(
                        Icons.check,
                        color: AppColors.primaryAppColor,
                      )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: AppColors.lightGrayText,
              ),
              InkWell(
                onTap: () => _changeClass(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      classNames[1],
                      style: AppConstants.lightTextStyle(
                          fontSize: 16, color: AppColors.primaryAppColor),
                    ),
                    if (isBussines.value)
                      Icon(
                        Icons.check,
                        color: AppColors.primaryAppColor,
                      )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: AppColors.lightGrayText,
              ),
              InkWell(
                onTap: () => _changeClass(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      classNames[2],
                      style: AppConstants.lightTextStyle(
                          fontSize: 16, color: AppColors.primaryAppColor),
                    ),
                    if (isFirst.value)
                      Icon(
                        Icons.check,
                        color: AppColors.primaryAppColor,
                      )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: AppColors.lightGrayText,
              )
            ]);
          })),
    ));
  }

  void swapDestination() {
    // Store the initial values in temporary variables
    var tempName = destName.value;
    var tempCode = destCode.value;
    var tempAirP = desAirP.value;

    // Update the original variables with the values from the destination
    destName.value = dipaName.value;
    destCode.value = dipaCode.value;
    desAirP.value = dipaAirP.value;
    dipaName.value = tempName;
    dipaCode.value = tempCode;
    dipaAirP.value = tempAirP;
  }

  void airportDisplay() {
    Get.bottomSheet(Container(
        height: Get.height * 0.7,
        color: AppColors.whiteColor,
        padding: EdgeInsets.only(top: Get.width * 0.09),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Airport',
                    style: AppConstants.lightTextStyle(fontSize: 20)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () => Get.back(),
                      child: Text(
                        'Cancel',
                        style: AppConstants.boldTextStyle(
                            fontSize: 20, color: AppColors.primaryAppColor),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.47,
              child: ListView.builder(
                  itemCount: airports.value.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              if (isforFrom.value) {
                                dipaAirP.value = airports[index][1];
                                dipaName.value = airports[index][0];
                                dipaCode.value = airports[index][2];
                              } else if (isforTo.value) {
                                desAirP.value = airports[index][1];
                                destName.value = airports[index][0];
                                destCode.value = airports[index][2];
                              }

                              isforFrom.value = false;
                              isforTo.value = false;
                              Get.back();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.airplane_ticket_outlined,
                                  color: AppColors.primaryAppColor,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  '${airports.value[index][0]}, ${airports.value[index][1]} ',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppConstants.boldTextStyle(
                                      fontSize: 16,
                                      color: AppColors.primaryAppColor),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Divider(
                              thickness: 1,
                              color: AppColors.lightGrayText,
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
            ),
          ],
        )));
  }

  void passengerBottomSheet() {
    adultEditted = adultNo.value;
    babyEditted = babyNo.value;
    tinEditted = tinegeNo.value;
    Get.bottomSheet(Container(
      color: AppColors.whiteColor,
      child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Obx(() {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Passengers',
                    style: AppConstants.boldTextStyle(
                        fontSize: 16, color: AppColors.primaryAppColor),
                  ),
                  _buttons()
                ],
              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Adult',
                    style: AppConstants.boldTextStyle(
                        fontSize: 16, color: AppColors.primaryAppColor),
                  ),
                  _passManipulate(adultNo, 'a')
                ],
              ),
              Divider(
                thickness: 1,
                color: AppColors.lightGrayText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Children',
                    style: AppConstants.boldTextStyle(
                        fontSize: 16, color: AppColors.primaryAppColor),
                  ),
                  _passManipulate(tinegeNo, 't')
                ],
              ),
              Divider(
                thickness: 1,
                color: AppColors.lightGrayText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Infant',
                    style: AppConstants.boldTextStyle(
                        fontSize: 16, color: AppColors.primaryAppColor),
                  ),
                  _passManipulate(babyNo, 'b')
                ],
              ),
              Divider(
                thickness: 1,
                color: AppColors.lightGrayText,
              )
            ]);
          })),
    ));
  }

  Row _passManipulate(var currentValue, String code) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
            onTap: () {
              if (currentValue.value > 0) {
                currentValue.value -= 1;
                if (code == 'a') {
                  adultEditted = currentValue.value;
                } else if (code == 't') {
                  tinEditted = currentValue.value;
                } else if (code == 'b') {
                  babyEditted = currentValue.value;
                }
              }
            },
            child: Icon(Icons.do_not_disturb_on_outlined)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          child: Text(
            '$currentValue',
            style: AppConstants.lightTextStyle(fontSize: 13),
          ),
        ),
        GestureDetector(
            onTap: () {
              currentValue.value += 1;
              if (code == 'a') {
                adultEditted = currentValue.value;
              } else if (code == 't') {
                tinEditted = currentValue.value;
              } else if (code == 'b') {
                babyEditted = currentValue.value;
              }
            },
            child: Icon(Icons.add_circle_outline_sharp))
      ],
    );
  }

  _changeClass(index) {
    if (index == 0) {
      isEconomy.value = true;
      isBussines.value = false;
      isFirst.value = false;
      selectedClassName.value = classNames[0];
      Get.back();
    } else if (index == 1) {
      isEconomy.value = false;
      isBussines.value = true;
      isFirst.value = false;
      selectedClassName.value = classNames[1];
      Get.back();
    } else if (index == 2) {
      isEconomy.value = false;
      isBussines.value = false;
      isFirst.value = true;
      selectedClassName.value = classNames[2];
      Get.back();
    }
  }

  _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
            child: Text(
              'cancel',
              style: AppConstants.boldTextStyle(
                  fontSize: 13, color: AppColors.primaryAppColor),
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.03,
        ),
        InkWell(
            onTap: () {
              adultNo.value = adultEditted;
              tinegeNo.value = tinEditted;
              babyNo.value = babyEditted;
              update();
              Get.back();
            },
            child: Text(
              'Done',
              style: AppConstants.boldTextStyle(
                  fontSize: 13, color: AppColors.primaryAppColor),
            ))
      ],
    );
  }
}
