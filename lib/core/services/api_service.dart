// import 'dart:convert';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:dio/dio.dart';
// import 'package:guzo_go_demo/core/enums/http_type.dart';

// import 'package:guzo_go_demo/utils/parse_tool.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart' as GetX;
// import 'package:guzo_go_demo/core/controllers/setting_controller.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:intl/intl.dart';
// import 'package:logger/logger.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../constants.dart';
// import '../../ui/screens/no_network.dart';
// import '../../utils/net_work_check.dart';
// import '../models/attachment.dart';
// import '../models/contact_info_model.dart';
// import '../models/display_org_level.dart';
// import '../models/employee_schedule.dart';
// //import '../models/leave/leave_setting.dart';
// import '../models/leave/leave_setting.dart';
// import '../models/new_dashboard.dart';
// import '../models/notification_count_model.dart';
// import '../models/open_shift.dart';
// import '../models/pay_cycle.dart';
// import '../models/pay_rule.dart';
// import '../models/personal_timesheet/approval_level.dart';
// import '../models/personal_timesheet/assigned_assistant.dart';
// import '../models/personal_timesheet/employee_pay_cycle.dart';
// import '../models/personal_timesheet/sub_ordinate_profile.dart';
// import '../models/personal_timesheet/timesheet_detail.dart';
// import '../models/personal_timesheet/timesheet_employee.dart';
// import '../models/settings/derp_device_token.dart';
// import '../models/shift_bidding.dart';
// import '../models/shift_date_week.dart';
// import '../models/site_sch.dart';
// import '../models/swap_shift_calendar_week.dart';
// import '../models/swat_rest/check_compliances.dart';
// import '../models/swat_rest/shift_item.dart';
// import '../models/system_work_type.dart';
// import '../repositories/dashboard/dashboard_repository.dart';
// import '../repositories/leave/leave_repository.dart';
// import '../repositories/notification/notification_repository.dart';
// import '../repositories/settings/settings_repository.dart';
// import 'package:guzo_go_demo/core/models/leave_balance.dart' as cs;

// class ApiService {
//   final Dio _dio = Dio();
//   final String hrotgUrl = 'http://www.hrotg.com/';
//   final String baseUrl = "https://standard.hrotg.com/api/";
//   final String login = "identity/user";
//   final String checkSupvRole = "Employee/CheckSupvRole/";
//   final String getMobileMenu = "System/GetMobileMenu/{FuncID}/{language}";
//   final String news = "Home/News/{language}";
//   final String getCompLogo = "Attachment/GetCompLogo/{language}";
//   final String deviceTokenRegistration = "MEUser/DeviceTokenRegistration";
//   final String updateUserSetting = "MEUser/UpdateUserSetting/";
//   final String forgotPassword = "identity/user/forgot";
//   final String changePassword = "identity/Change";
//   final String logOut = "Identity/Logout";
//   final String deviceTokenSignOut = "MEUser/DeviceTokenSignOut";
//   final String getListOfSubOrdinate =
//       "Employee/MSS/SubOrdinate/Profile/{empId}/{language}";
//   final String getLeaveBalanceInfo1 = "Balance/AL/Current/{empId}";
//   final String getLeaveBalanceInfo2 = "Leave/Taken/{empId}/{leaveType}/{year}";
//   final String getOtBalanceInfo =
//       "Overtime/Employee/{empId}/{startDate}/{endDate}";
//   final String latestProfile = "Employee/LatestProfile/{emp_id}/{language}";
//   final String displayOrgLevel = "Employee/DisplayOrgLevel/{emp_id}/{language}";
//   final String updateProfile = "Employee/Update/Profile";
//   final String updateAttachment = "Attachment/AddOrUpdate";
//   final String employeeRestDay = "Employee/RestDay/{empId}/{fromDate}/{toDate}";
//   final String employeeCreateRestDay = "Employee/Create/RestDay/{language}";
//   final String payRule = "System/Payrule/{emp_id}/{effectiveDate}";
//   final String payRuleRD = "System/PayruleRD/{PayruleId}/{emp_id}";
//   final String employeeDeleteRestDay =
//       "Employee/Delete/RestDay/{EmpRestDayUID}";
//   final String availabilityGetByEmpID =
//       "Availability/GetByEmpID/{empId}/{fromDate}/{toDate}";
//   final String getLeaveBasicUrl =
//       "Leave/Employee/Basic/{empId}/{startDate}/{endDate}/{language}";
//   final String getSubOrdinatePendingLeaveUrl =
//       "Leave/MSS/Pending/{empId}/{language}";
//   final String systemPayruleAvail =
//       "System/Payrule/Avail/{payruleId}/{effectiveDate}";
//   final String systemCode = "System/Code/{categories}/{language}";
//   final String availabilityCreate = "Availability/Create/{language}";
//   final String availabilityDelete =
//       "Availability/Delete/{EmpAvailUID}/{language}";
//   final String openShiftGetShiftBiddings =
//       "OpenShift/GetShiftBiddings/{empID}/{DateFrom}/{DateTo}/{language}";
//   final String openShiftGetEmpOpenShiftByMonth =
//       "OpenShift/GetEmpOpenShiftByMonth/{empID}/{Period}/{language}"; //2022-12-11 deprecate by Vick
//   final String openShiftGetEmpOpenShiftCalendar =
//       "OpenShift/GetEmpOpenShiftCalendar/{empID}/{Period}/{language}";
//   final String openShiftByDate =
//       "OpenShift/GetEmpOpenShiftByDate/{empID}/{Date}/{language}";
//   final String openShiftEmployeeBid =
//       "OpenShift/Employee/Bid/{empID}/{openShiftID}/{language}";

//   final String swapShiftRequest =
//       "SwapShift/Request/Personal/{SwapType}/{empID}/{DateFrom}/{DateTo}/{language}";

//   final String swapShiftGetEmpSchCalendar =
//       "SwapShift/GetEmpSch/Calendar/{empID}/{StartDate}/{EndDate}/{language}";
//   final String swapShiftGetSiteSch =
//       "SwapShift/GetSiteSch/{SwapType}/{schID}/0/{language}";

//   final String swapShiftGetSiteSchNew =
//       "SwapShift/GetSiteSch/{SwapType}/{schID}/{RestDayID}/{language}";
//   final String swapShiftRequestCreate = "SwapShift/Request/Create/{{language}}";
//   final String swapShiftRequestPending =
//       "SwapShift/Request/Pending/{empID}/{StartDate}/{EndDate}/{language}";
//   final String notificationList =
//       "Employee/GetEmpNotification/{EmpID}/{language}";
//   final String swapShiftApprove =
//       "SwapShift/Approve/{ActionID}/{requestID}/{empID}/{language}";
//   final String getAttchmentUrl = "Leave/Attachment/{leaveId}";
//   final String cancelLeaveUrl = "Leave/Employee/Cancel/{leaveId}/{language}";
//   final String updateAttchmentForLeaveUrl =
//       "Leave/Employee/UpdateAttachment/{language}";
//   final String approveLeaveUrl = "Leave/MSS/Approval";
//   final String getApprovedHistoryDataUrl =
//       "Leave/MSS/Approved/{empId}/{NOD}/{language}";
//   final String getRejectedHistoryDataUrl =
//       "Leave/MSS/Rejected/{empId}/{NOD}/{language}";
//   final String getleaveTypeListUrl =
//       "Employee/GetleaveList/{empId}/{Date}/{language}";
//   final String calNoOfDaysForLeaveUrl = "Leave/Employee/calNoOfDays";
//   final String getLeaveReasonListUrl =
//       "System/LeaveReasons/{leaveType}/{language}";
//   final String submitNewLeaveUrl = "Leave/Employee/Create/{language}";
//   final String withdrawRequest =
//       "SwapShift/Request/Cancel/{RequestUID}/{language}";
//   final String claimEmployeeBasic =
//       "Claim/Employee/Basic/{EmpID}/{StartDate}/{EndDate}/{language}";
//   final String openShiftEmployeeWithdraw =
//       "OpenShift/Employee/Withdraw/{biddingID}/{language}";
//   final String systemWorkTypes = "System/WorkTypes/{language}";
//   final String systemAllowances = "System/Allowances/{language}";
//   final String systemContracts =
//       "System/Contracts/Number/{Contract_num}/{language}";
//   final String employeePayCycle = "Employee/GetPayCycle/{empId}";
//   final String claimEmployeeCreate = "Claim/Employee/Create/{language}";
//   final String claimEmployeeUpdate = "Claim/Employee/Update/{language}";
//   final String claimAttachment = "Claim/Attachment/{LateTSID}";
//   final String appliedEmployeeBasic = "Claim/MSS/Pending/{EmpID}/{language}";
//   final String claimMssApproval = "Claim/MSS/Approval";
//   final String claimMssApprovedHistory =
//       "Claim/MSS/Approved/{EmpID}/{NOD}/{language}";
//   final String claimMssRejectedHistory =
//       "Claim/MSS/Rejected/{EmpID}/{NOD}/{language}";
//   final String clockingGetByEmpID =
//       "Clocking/GetByEmpID/{empId}/{fromDate}/{toDate}/{language}";
//   final String clockingGetLastAction = "Clocking/GetLastAction/{empId}/{dDate}";
//   final String clockingGetNextAction =
//       "Clocking/GetNextAction/{ActionCode}/{language}";
//   final String generateClocking =
//       "Timesheet/Clocking/Validate/{GenClocking}/{language}";
//   final String claimEmployeeCancel =
//       "Claim/Employee/Cancel/{LateTSID}/{language}";
//   final String employeePayCycleHr = "Employee/GetPayCycle/{empId}";
//   final String systemPayCycle = "System/PayCycle/Detail/{pID}/{Year}";
//   final String timesheetEmployee =
//       "Timesheet/Employee/{empID}/{startDate}/{endDate}/{language}";
//   final String meUserUpdateUserSetting = "MEUser/UpdateUserSetting/{empID}";
//   final String timesheetGetByID = "Timesheet/GetByID/{TS_ID}/{language}";
//   final String timesheetDetails = "Timesheet/Details/{TS_ID}/{language}";
//   final String systemShifts = "System/Shifts/{language}";
//   final String timesheetUpdate = "Timesheet/Update";
//   final String timesheetSummaryUpdate = "Timesheet/Summary/Update";
//   final String timesheetSummaryCreate = "Timesheet/Summary/Create";
//   final String timesheetMSSApprove = "Timesheet/MSS/Approve";
//   final String employeeScheduleGetCurrentPeriod =
//       "Employee/Schedule/GetCurrentPeriod/{empId}";
//   final String employeeGetAssignedAssistant =
//       "Employee/GetAssignedAssistant/{empId}/{TS_ID}";
//   final String timesheetDetailRecord =
//       "Timesheet/DetailRecord/{TS_DetailID}/{language}";
//   final String systemTransports = "System/Transports/{language}";
//   final String timesheetDetailUpdate = "Timesheet/Detail/Update";
//   final String timeSheetDetailSummaryUpdate =
//       "Timesheet/DetailSummary/Update/{TS_DetailID}";
//   final String timesheetDetailDelete = "Timesheet/Detail/Delete/{TSDetailID}";
//   final String timesheetDelete = "Timesheet/Delete/{TS_ID}";
//   final String timesheetDetailCreate = "Timesheet/Detail/Create";
//   final String employeeGetAssistant = "Employee/GetAssistant/{empId}/{TS_ID}";
//   final String timesheetCopyToAssistant =
//       "Timesheet/CopyTimeSheetToAssistant/{TS_ID}/{AsstEmpID}";
//   final String employeeMssSubOrdinateProfile =
//       "Employee/MSS/SubOrdinate/Profile/{empId}";
//   final String timesheetGetApprovalLevel =
//       "Timesheet/GetApprLevel/{EmpId}/{language}";
//   final String employeeLatestPayslip =
//       "Employee/GetLatestPayslip/{EmpID}/{language}";
//   final String employeeYearParameter =
//       "Employee/GetYearParameter/{EmpID}/{language}/{fileType}";
//   final String employeePayslipByYear =
//       "Employee/GetPayslipByYear/{EmpID}/{Year}/{language}";
//   final String attachmentEmpPayslip =
//       "Attachment/GetEmpPayslip/{empId}/{payCycleDetailID}/{language}";
//   final String attachmentEmpIRD =
//       "Attachment/GetEmpIRD/{empId}/{Year}/{language}";
//   final String irdByYear = "Employee/GetIRDByYear/{EmpID}/{Year}/{language}";
//   final String deleteAccount = "MEUser/Disable/{EmpID}/{language}";
//   final String homeNewDashboard =
//       "Home/NewDashboard/{EmpID}/{FuncId}/{isMobile}/{language}";
//   final String notificaitonCount =
//       "Employee/GetEmpNotificationCount/{EmpID}/{language}";
//   final String reaAllNotification = "Employee/ResetNotificationCounter/{EmpID}";
//   final String checkCompliances =
//       "CheckCompliances/{checkStartTime}/{checkEndTime}/{language}";
//   final String leaveSetting =
//       "System/Code/LEAVE_SETTING/ALLOW_CANCEL/{language}";
//   var logger = Logger(printer: PrettyPrinter(printTime: true));
//   //timesheet service
//   final String EMPLOYEE_PAY_CYCLE = "Employee/PayCycle/{empId}";
//   final String EMPLOYEE_SCHEDULE = "Employee/Schedule/GetCurrentPeriod/{empId}";
//   final String SCHEDULE_DATA_URL =
//       "Schedule/Data/{empId}/{schStart}/{schEnd}/{language}";
//   //calendar service
//   final String SYS_COLOR_CODE_URL = "System/Code/PERSONAL_CALENDAR/EN";
//   final String CALENDAR_SCHEDULE_DATA_URL =
//       "Schedule/Data/{empId}/{schStart}/{schEnd}/{language}";
//   final String LEAVE_BALANCE_URL = "Balance/AL/current/{empId}";
//   final String LEAVE_TAKEN_URL =
//       "Leave/Taken/{empId}/{leaveType}/{currentYear}";
//   final String OVERTIME_URL = "Overtime/Employee/{empId}";
//   final String SCHEDULE_SUBORDINATE_SUMMARY =
//       "Schedule/SubordinateSummary/{empId}/{schDate}/EN";
//   final String SCHEDULE_SUBORDINATE_DETAIL =
//       "Schedule/SubordinateDetail/{empId}/{schDate}/{num}/{language}";

//   final int _connectTimeout = 60000;
//   final int _receiveTimeout = 70000;

//   ApiService() {
//     //   _dio.options.baseUrl = 'https://standard.hrotg.com/api/';
//     // _dio.options.baseUrl = 'http://www.hrotg.com/';
//     // _dio.options.baseUrl = settingController.userInfo4;
//     _dio.options.connectTimeout = _connectTimeout;
//     _dio.options.receiveTimeout = _receiveTimeout;
//   }

//   NotificationRepositoryImpl notificationRepository =
//       NotificationRepositoryImpl();
//   DashboardRepositoryImpl dashboardRepository = DashboardRepositoryImpl();
//   SettingsRepositoryImpl settingsRepository = SettingsRepositoryImpl();
//   LeaveRepositoryImpl leaveRepository = LeaveRepositoryImpl();

// //TODO: Implement your api calls here
//   void getHttp() async {
//     try {
//       var response = await Dio().get(_dio.options.baseUrl);
//       debugPrint(response.toString());
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint(exception.toString());
//     }
//   }

//   Future<bool> _checkNetWork() async {
//     bool netCheck = await NetWorkCheck.checkNet();
//     if (!netCheck) {
//       debugPrint("無網路");
//       EasyLoading.show(status: "loading".tr);
//       Future.delayed(const Duration(seconds: 1), () {
//         EasyLoading.dismiss();
//         GetX.Get.offAndToNamed("/F99");
//       });
//     }
//     return netCheck;
//   }

//   ///重新初始化ApiService的時候，需要呼叫這個Function補回baseUrl
//   reCheckBaseUrl() {
//     final settingController = GetX.Get.put(SettingController());
//     _dio.options.baseUrl = settingController.userInfo4;
//   }

//   Future<LeaveSetting> getLeaveSetting() async {
//     String apiUrl = _dio.options.baseUrl + leaveSetting;
//     debugPrint("執行getLeaveSetting: $apiUrl");
//     try {
//       var settingController = GetX.Get.put(SettingController());
//       var token = settingController.userInfo1.accessToken;
//       _dio.options.headers['content-Type'] = 'application/json';
//       _dio.options.headers["authorization"] = "Bearer $token";
//       var response = await _dio.get(
//         apiUrl,
//       );
//       return LeaveSetting.fromJson(response.data);
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint("Error: $exception");
//       return LeaveSetting();
//     }
//   }

//   ///使用者登入
//   Future<ApiResult> userLogin(String account, String password) async {
//     String apiUrl = hrotgUrl + login;
//     logger.d("執行登入: $apiUrl");
//     final settingController = GetX.Get.put(SettingController());
//     try {
//       Dio dio = Dio();
//       dio.options.headers['content-Type'] = 'application/json';
//       dio.options.headers["Accept"] = "*/*";
//       dio.options.headers["Accept-Encoding"] = "gzip, deflate, br";
//       dio.options.headers["Connection"] = "keep-alive";

//       bool netResult = await _checkNetWork();
//       if (!netResult) {
//         return ApiResult();
//       }

//       var response = await dio.post(
//         apiUrl,
//         options: Options(
//           contentType: 'application/json',
//           receiveTimeout: _receiveTimeout,
//           sendTimeout: _connectTimeout,
//         ),
//         data: {
//           "username": account,
//           "password": password,
//           "action": "login",
//           "device": "Browser",
//         },
//       );
//       settingController.userInfo1 =
//           LoginInfoItem1.fromJson(response.data["item1"]);
//       settingController.userInfo2 =
//           LoginInfoItem2.fromJson(response.data["item2"]);
//       settingController.userInfo3 =
//           LoginInfoItem3.fromJson(response.data["item3"]);
//       settingController.userInfo4 = response.data["item4"];
//       settingController.userInfo5 = response.data["item5"];

//       _dio.options.baseUrl = "${settingController.userInfo4}/";
//       //  debugPrint("Success with response item1: ${settingController.userInfo1.accessToken}");
//       //  debugPrint("Success with response item2: ${settingController.userInfo2.pwResetRequired}");
//       //  debugPrint("Success with response item3: ${settingController.userInfo3.empCode}");
//       //  debugPrint("Success with response item4: ${settingController.userInfo4}");
//       //  debugPrint("Success with response item5: ${settingController.userInfo5}");
//       logger.d("Api回傳Login資訊");
//       ApiResult apiResult = ApiResult();
//       apiResult.message = Constants.apiOK;
//       return apiResult;
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint("Error: $exception");
//       return ApiResult.fromJson(exception.response?.data);
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint("Error: $exception");
//       return ApiResult();
//     }
//   }

//   ///DeviceTokenRegistration
//   doDeviceTokenRegistration(String empId, String accessToken,
//       String? deviceToken, String deviceInfo) async {
//     String apiUrl = _dio.options.baseUrl + deviceTokenRegistration;
//     Logger().e("執行DeviceTokenRegistration: $apiUrl");
//     debugPrint("當前DeviceToken為: $deviceToken");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.POST, needAuth: true, bodyData: {
//         "emP_ID": empId,
//         "devicetype":
//             deviceInfo.length > 20 ? deviceInfo.substring(0, 20) : deviceInfo,
//         "devicetoken": deviceToken,
//         "uid": 0,
//         "createdBy": 0,
//         "createdDate": ParseTool.dateToApiDate(DateTime.now()),
//         "modifiedBy": 0,
//         "modifiedDate": ParseTool.dateToApiDate(DateTime.now()),
//       });
//       if (response.statusCode == 200) {
//         debugPrint("DeviceTokenRegistration: $response");
//       } else {
//         debugPrint("DeviceTokenRegistration: $response");
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint("Error: $exception");
//     }
//   }

//   ///SupervisorRole
//   Future<SupervisorRole> checkSupervisorRole(String empId, String token) async {
//     String apiUrl = _dio.options.baseUrl + checkSupvRole + empId;
//     debugPrint("執行CheckSupervisorRole: $apiUrl");
//     try {
//       Dio dio = Dio();
//       dio.options.headers['content-Type'] = 'application/json';
//       dio.options.headers["authorization"] = "Bearer $token";
//       var response = await dio.get(
//         apiUrl,
//       );

//       return SupervisorRole.fromJson(response.data);
//     } on DioError catch (exception) {
//       if (exception.response?.statusCode == 401) {
//         // GetX.Get.put(SettingController()).userLogout();
//         GetX.Get.put(SettingController()).clearLoginInfo();

//         GetX.Get.offAndToNamed("/F01");
//       }

//       rethrow;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint("Error: $exception");
//       return SupervisorRole.makeEmptyOne();
//     }
//   }

//   ///GetMobileMenu
//   Future<List<MobileMenu>> getMobileMenuList(
//       String funcId, String language) async {
//     List<MobileMenu> resultList = [];
//     List<Map<String, dynamic>> map = [];
//     String apiUrl = getMobileMenu;
//     List<MobileMenu> dataList = List.empty(growable: true);
//     debugPrint("執行GetMobileMenu: ${apiUrl + funcId}");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'FuncID': funcId,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         Logger().e("執行getMobileMenuList Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(MobileMenu.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }

//       /*
//       Dio dio = Dio();
//       dio.options.headers['content-type'] = 'application/json';
//       dio.options.headers["authorization"] = "Bearer $token";
//       var response = await dio.get(
//         _dio.options.baseUrl + "/"+getMobileMenu + funcId,
//       );
//       //  debugPrint("GetMobileMenu Success with response: $response");
//       map = List<Map<String, dynamic>>.from(response.data);
//       for (var element in map) {
//         resultList.add(MobileMenu.fromMap(element));
//       }
//       return resultList;*/
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint("Error: $exception");
//       return [];
//     }
//   }

//   ///GetNews
//   Future<News> getNews(String language, String token) async {
//     String apiUrl = news;
//     // debugPrint("執行GetNews: $apiUrl");
//     try {
//       var response = await _call(apiUrl, HttpType.GET,
//           needAuth: true, pathData: {"language": language});

//       /*
//       Dio dio = Dio();
//       dio.options.headers['content-Type'] = 'application/json';
//       dio.options.headers["authorization"] = "Bearer $token";
//       var response = await dio.get(
//         _dio.options.baseUrl + news + language,
//       );*/
//       //  debugPrint("執行GetNews Success with response: ${response.data}");
//       return News.fromJson(response.data[0]);
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       //   debugPrint("Error: $exception");
//       return News.makeEmptyOne();
//     }
//   }

//   ///Attachment/GetCompLogo/{language}
//   Future<CompLogo> attachmentGetCompLogo(String language, String token) async {
//     String apiUrl = getCompLogo;
//     // debugPrint("執行GetCompLogo: $getCompLogo");
//     try {
//       var response = await _call(apiUrl, HttpType.GET,
//           needAuth: true, pathData: {"language": language});

//       /*
//       Dio dio = Dio();
//       dio.options.headers['content-Type'] = 'application/json';
//       dio.options.headers["authorization"] = "Bearer $token";
//       var response = await dio.get(
//         _dio.options.baseUrl + getCompLogo,
//       );*/
//       // debugPrint("執行GetCompLogo Success with response: ${response.data}");
//       return CompLogo.fromJson(response.data);
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       //   debugPrint("Error: $exception");
//       return CompLogo.makeEmptyOne();
//     }
//   }

//   ///ForgotPassword
//   Future<bool> doForgotPassword(String account, String familyName) async {
//     String apiUrl = forgotPassword;
//     debugPrint("執行ForgotPassword: $apiUrl");
//     try {
//       var response = await _call(apiUrl, HttpType.POST,
//           needAuth: true,
//           needSetBaseUrl: false,
//           isHrotg: true,
//           bodyData: {
//             "username": account,
//             "password": "",
//             "newPassword": "",
//             "action": "forgot",
//             "device": "Mobile",
//             "forgotToken": familyName,
//             "faceImage": ""
//           });

//       /*
//       Dio dio = Dio();
//       dio.options.headers['content-Type'] = 'application/json';
//       //  dio.options.headers["authorization"] = "Bearer $token";
//       var response =
//           await dio.put(_dio.options.baseUrl + forgotPassword, data: {
//         "username": account,
//         "password": "",
//         "newPassword": "",
//         "action": "forgot",
//         "device": "Mobile",
//         "forgotToken": familyName,
//         "faceImage": ""
//       });*/
//       logger.d("執行ForgotPassword Success with response: ${response.data}");
//       return true;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       logger.d("Error: $exception");
//       return false;
//     }
//   }

//   Future<Response<T>> _call<T>(
//     String path,
//     HttpType type, {
//     bool needAuth = true,
//     bool needSetBaseUrl = true,
//     Map<String, dynamic>? pathData,
//     Map<String, dynamic>? bodyData,
//     List<Map<String, dynamic>?> listBodyData = const [],
//     bool isHrotg = false,
//   }) async {
//     Response<T> result;
//     var settingController = GetX.Get.put(SettingController());

//     //default setting
//     _dio.options.headers['content-Type'] = 'application/json';
//     _dio.options.receiveTimeout = 300000;
//     //set base url
//     if (needSetBaseUrl) {
//       _dio.options.baseUrl = '${settingController.userInfo4}/';
//     } else {
//       if (isHrotg) {
//         _dio.options.baseUrl = hrotgUrl;
//       } else {
//         _dio.options.baseUrl = baseUrl;
//       }
//     }

//     //check if need to auth
//     if (needAuth) {
//       var token = settingController.userInfo1.accessToken;

//       _dio.options.headers['authorization'] = "Bearer $token";
//     }

//     if (pathData != null) {
//       for (var param in pathData.entries) {
//         path = path.replaceAll('{${param.key}}', param.value);
//       }
//     }

//     try {
//       switch (type) {
//         case HttpType.GET:
//           result = await _dio.get(path);
//           break;
//         case HttpType.POST:
//           if (listBodyData.isNotEmpty) {
//             String bData = "[";
//             for (var i = 0; i < listBodyData.length; i++) {
//               if (i != listBodyData.length - 1) {
//                 bData += "${listBodyData[i]},";
//               } else {
//                 bData += "${listBodyData[i]}";
//               }
//             }
//             bData += "]";
//             result = await _dio.post(path, data: jsonEncode(listBodyData));
//           } else {
//             result = await _dio.post(path, data: bodyData);
//             print('result=>${result}');
//           }
//           break;
//         case HttpType.PUT:
//           result = await _dio.put(path, data: bodyData);
//           break;
//         case HttpType.DELETE:
//           result = await _dio.delete(path, data: bodyData);
//           break;
//         case HttpType.PATCH:
//           result = await _dio.patch(path, data: bodyData);
//           break;
//       }

//       // token login is expire
//       if (result.statusCode == 401) {
//         // GetX.Get.put(SettingController()).clearLoginInfo();
//         // // GetX.Get.put(SettingController()).userLogout();
//         // GetX.Get.offAndToNamed("/F01");
//         _showTokenExpDialog();
//       }

//       return result;
//     } on DioError catch (exception) {
//       if (exception.response?.statusCode == 401) {
//         // GetX.Get.put(SettingController()).clearLoginInfo();
//         // // GetX.Get.put(SettingController()).userLogout();
//         // GetX.Get.offAndToNamed("/F01");
//         _showTokenExpDialog();
//       }
//       rethrow;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );

//       bool netCheck = await NetWorkCheck.checkNet();
//       if (!netCheck) {
//         Get.to(() => NoNetwork(onRefresh: () {
//               Get.back();
//               //Get.toNamed('/${settingController.currentPage}');
//             }));
//       }
//       rethrow;
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }

//   _showTokenExpDialog() {
//     AwesomeDialog(
//       // dismissOnTouchOutside: true,
//       headerAnimationLoop: false,
//       context: Get.context!,
//       animType: AnimType.scale,
//       dialogType: DialogType.noHeader,
//       btnOkText: "ok".tr,
//       btnOkColor: Colors.blue,
//       showCloseIcon: true,
//       btnOkOnPress: () async {
//         Get.put(SettingController()).userLogout(needRequest: false);
//         Get.offAndToNamed("/F01");
//       },
//       btnCancel: null,
//       btnCancelText: "cancel".tr,
//       btnCancelColor: Colors.red,
//       btnCancelOnPress: () {
//         Get.put(SettingController()).userLogout(needRequest: false);
//         Get.offAndToNamed("/F01");

//         EasyLoading.dismiss();
//       },
//       title: 'expired_login'.tr,
//       titleTextStyle: Theme.of(Get.context!).textTheme.titleSmall,
//       desc: "token_expired".tr,
//       descTextStyle: Theme.of(Get.context!).textTheme.titleSmall,
//       dialogBackgroundColor: Theme.of(Get.context!).dialogBackgroundColor,
//     ).show();
//   }

//   Future<Response<T>> _call_bak<T>(
//     String path,
//     HttpType type, {
//     bool needAuth = true,
//     bool needSetBaseUrl = true,
//     Map<String, dynamic>? pathData,
//     Map<String, dynamic>? bodyData,
//     List<Map<String, dynamic>?> listBodyData = const [],
//     bool isHrotg = false,
//   }) async {
//     Response<T> result;

//     var settingController = GetX.Get.put(SettingController());

//     //default setting
//     _dio.options.headers['content-Type'] = 'application/json';

//     //set base url
//     if (needSetBaseUrl) {
//       _dio.options.baseUrl = '${settingController.userInfo4}/';
//     } else {
//       if (isHrotg) {
//         _dio.options.baseUrl = hrotgUrl;
//       } else {
//         _dio.options.baseUrl = baseUrl;
//       }
//     }
//     //check if need to auth
//     if (needAuth) {
//       var token = settingController.userInfo1.accessToken;
//       _dio.options.headers['authorization'] = "Bearer $token";
//     }

//     bool netCheck = await NetWorkCheck.checkNet();
//     if (!netCheck) {
//       debugPrint("無網路");
//       settingController.showNoNetScreen();
//     }

//     //replace params at path
//     if (pathData != null) {
//       for (var param in pathData.entries) {
//         path = path.replaceAll('{${param.key}}', param.value);
//       }
//     }

//     switch (type) {
//       case HttpType.GET:
//         result = await _dio.get(path);
//         break;
//       case HttpType.POST:
//         if (listBodyData.isNotEmpty) {
//           String bData = "[";
//           for (var i = 0; i < listBodyData.length; i++) {
//             if (i != listBodyData.length - 1) {
//               bData += "${listBodyData[i]},";
//             } else {
//               bData += "${listBodyData[i]}";
//             }
//           }
//           bData += "]";
//           result = await _dio.post(path, data: jsonEncode(listBodyData));
//         } else {
//           result = await _dio.post(path, data: bodyData);
//           print('result=>${result}');
//         }
//         break;
//       case HttpType.PUT:
//         result = await _dio.put(path, data: bodyData);
//         break;
//       case HttpType.DELETE:
//         result = await _dio.delete(path, data: bodyData);
//         break;
//       case HttpType.PATCH:
//         result = await _dio.patch(path, data: bodyData);
//         break;
//     }
// // token login is expire
//     if (result.statusCode == 401) {
//       // GetX.Get.put(SettingController()).userLogout();
//       GetX.Get.put(SettingController()).clearLoginInfo();

//       GetX.Get.offAndToNamed("/F01");
//     }
//     return result;
//   }

//   /// Get data of Sub Ordinate
//   Future<List<SubOrdinateData>?> getDataOfSubOrdainate(
//       String empId, String language) async {
//     try {
//       var response = await _call(getListOfSubOrdinate, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'empId': empId,
//             'language': language,
//           });

//       if (response.statusCode == 200) {
//         List<SubOrdinateData> dataList = List.empty(growable: true);
//         for (var element in response.data) {
//           dataList.add(SubOrdinateData.fromMap(element));
//         }

//         return dataList;
//       } else {
//         return [];
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return null;
//     }
//   }

//   /// Get leave balance data
//   Future<LeaveBalance?> getLeaveBalanceData(
//       String empId, String leaveType, String year) async {
//     try {
//       LeaveBalance returnObject = LeaveBalance.makeEmptyOne();
//       double? leaveOpening;
//       double? leaveEntitlement;
//       double? taken;
//       int countForCheck = 0;

//       var responseOfInfo1 = await _call(getLeaveBalanceInfo1, HttpType.GET,
//           pathData: {'empId': empId});

//       // sample of result
//       // {
//       //   "empId": 12,
//       //   "leaveTypeId": 1,
//       //   "leavePeriod": 2022,
//       //   "leaveOpening": 0.0,
//       //   "leaveEntitlement": 14.0,
//       //   "leaveEarned": 0.0,
//       //   "leaveBalance": 0.0,
//       //   "empCode": "TK0119",
//       //   "uid": 2955,
//       //   "createdBy": null,
//       //   "createdDate": "2022-03-16T15:08:08.06",
//       //   "modifiedBy": null,
//       //   "modifiedDate": "2022-03-16T15:08:08.06"
//       // }

//       if (responseOfInfo1.statusCode == 200) {
//         returnObject.staffCode = responseOfInfo1.data['empCode'];
//         leaveOpening = responseOfInfo1.data['leaveOpening'];
//         leaveEntitlement = responseOfInfo1.data['leaveEntitlement'];
//       }

//       var responseOfInfo2 =
//           await _call(getLeaveBalanceInfo2, HttpType.GET, pathData: {
//         'empId': empId,
//         'leaveType': leaveType,
//         'year': year,
//       });

//       // sample of result
//       // {
//       //   "empID": 12,
//       //   "taken": 10.0,
//       //   "leaveType": "AL",
//       //   "year": 2022
//       // }

//       if (responseOfInfo2.statusCode == 200) {
//         taken = responseOfInfo2.data['taken'];
//       }

//       // cal & set value to return object
//       if (leaveOpening != null) {
//         returnObject.openingBalance = leaveOpening.toStringAsFixed(2);
//         countForCheck++;
//       }
//       if (leaveEntitlement != null) {
//         returnObject.entitled = leaveEntitlement.toStringAsFixed(2);
//         countForCheck++;
//       }
//       if (taken != null) {
//         returnObject.taken = taken.toStringAsFixed(2);
//         countForCheck++;
//       }

//       if (countForCheck == 3) {
//         returnObject.closingBalance =
//             (leaveOpening! + leaveEntitlement! - taken!).toStringAsFixed(2);
//       }

//       return returnObject;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return null;
//     }
//   }

//   /// get ot balance data
//   Future<OTBalance?> getOtBalanceData(
//       String empId, String startDate, String endDate) async {
//     try {
//       OTBalance returnObject = OTBalance.makeEmptyOne();

//       //url sample: Overtime/Employee/{empId}/{startDate}/{endDate}
//       var response = await _call(getOtBalanceInfo, HttpType.GET, pathData: {
//         'empId': empId,
//         'startDate': startDate,
//         'endDate': endDate
//       });

//       if (response.statusCode == 200) {
//         returnObject.opening =
//             (response.data['opening'] as double).toStringAsFixed(1);
//         returnObject.actualOt =
//             (response.data['actualOT'] as double).toStringAsFixed(1);
//       }

//       return returnObject;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return null;
//     }
//   }

//   ///Set Notification  2022-12-20  deprecate
//   Future<bool> doSetNotification(int accountID, bool isOn, String token) async {
//     //  debugPrint("執行Set Notification: ${_dio.options.baseUrl + updateUserSetting + accountID.toString()}");
//     try {
//       Dio dio = Dio();
//       dio.options.headers['content-Type'] = 'application/json';
//       dio.options.headers["authorization"] = "Bearer $token";
//       var response = await dio.post(
//           _dio.options.baseUrl + updateUserSetting + accountID.toString(),
//           data: {
//             "userid": accountID,
//             "seT_TYPE": "NOTIFICATION",
//             "seT_TYPEVALUE": isOn ? "1" : "0",
//             "uid": 0,
//             "createdBy": null,
//             "createdDate": null,
//             "modifiedBy": null,
//             "modifiedDate": null
//           });
//       debugPrint("執行Set Notification Success with response: ${response.data}");
//       return true;
//     } on DioError catch (exception) {
//       if (exception.response?.statusCode == 401) {
//         // GetX.Get.put(SettingController()).userLogout();
//         GetX.Get.put(SettingController()).clearLoginInfo();

//         GetX.Get.offAndToNamed("/F01");
//       } else {
//         rethrow;
//       }
//       return false;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return false;
//     }
//   }

//   ///Change Password
//   Future<ApiResult> doChangePassword(String accountID, String currentPassword,
//       String newPassword, String token) async {
//     String apiUrl = changePassword;
//     debugPrint("執行Change Password: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.POST, needAuth: true, bodyData: {
//         "username": accountID.toString(),
//         "password": currentPassword,
//         "newPassword": newPassword,
//         "action": "login",
//         "device": "",
//         "forgotToken": "",
//         "faceImage": ""
//       });

//       /*
//       Dio dio = Dio();
//       dio.options.headers['content-Type'] = 'application/json';
//       dio.options.headers["authorization"] = "Bearer $token";
//       var response =
//           await dio.post(_dio.options.baseUrl + changePassword, data: {
//         "Username": accountID,
//         "Password": currentPassword,
//         "NewPassword": newPassword,
//         "Action": "forgot",
//         "Device": "Mobile",
//         "ForgotToken": "",
//         "FaceImage": ""
//       });*/
//       if (response.statusCode == 200) {
//         logger.d("執行doChangePassword Success with response: ${response.data}");
//         ApiResult apiResult = ApiResult();
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d("執行doChangePassword Success with response: ${response.data}");
//         return ApiResult();
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Logout36
//   Future<bool> doLogout(int accountID, String accessToken) async {
//     String apiUrl = logOut;
//     debugPrint("執行Logout: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.POST, needAuth: true, bodyData: {
//         "username": accountID.toString(),
//         "password": "",
//         "newPassword": "",
//         "action": "login",
//         "device": "",
//         "forgotToken": "",
//         "faceImage": ""
//       });

//       /*
//       Dio dio = Dio();
//       dio.options.headers['content-Type'] = 'application/json';
//       dio.options.headers["authorization"] = "Bearer $accessToken";
//       var response = await dio.post(apiUrl, data: {
//         "username": accountID.toString(),
//         "password": "",
//         "newPassword": "",
//         "action": "login",
//         "device": "",
//         "forgotToken": "",
//         "faceImage": ""
//       });*/
//       debugPrint("執行Logout Success with response: ${response.data}");
//       return true;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return false;
//     }
//   }

//   ///DeviceTokenSignOut
//   Future<bool> doDeviceTokenSignOut(int empID, String? deviceToken,
//       String accessToken, int uid, String deviceInfo) async {
//     String apiUrl = deviceTokenSignOut;
//     debugPrint(
//         "執行DeviceTokenSignOut: $apiUrl deviceToken: $deviceToken  時間為:${ParseTool.dateToApiDate((DateTime.now()))}");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.DELETE, needAuth: true, bodyData: {
//         "emP_ID": empID.toString(),
//         "devicetype":
//             deviceInfo.length > 20 ? deviceInfo.substring(0, 20) : deviceInfo,
//         "devicetoken": deviceToken,
//         "uid": 0,
//         "createdBy": 0,
//         "createdDate": ParseTool.dateToApiDate(DateTime.now()),
//         "modifiedBy": 0,
//         "modifiedDate": ParseTool.dateToApiDate(DateTime.now()),
//       });

//       /*
//       Dio dio = Dio();
//       dio.options.headers['content-Type'] = 'application/json';
//       dio.options.headers["authorization"] = "Bearer $accessToken";
//       var response = await dio.delete(apiUrl, data: {
//         "emP_ID": empID,
//         "devicetype":
//             deviceInfo.length > 20 ? deviceInfo.substring(0, 20) : deviceInfo,
//         "devicetoken": deviceToken,
//         "uid": empID,
//         "createdBy": 0,
//         "createdDate": ParseTool.dateToApiDate((DateTime.now())),
//         "modifiedBy": 0,
//         "modifiedDate": ParseTool.dateToApiDate((DateTime.now())),
//       });*/
//       debugPrint(
//           "執行DeviceTokenSignOut Success with response: ${response.data}");
//       return true;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return false;
//     }
//   }

//   ///Employee/LatestProfile/{emp_id}/{language}
//   Future<LatestProfile> getLatestProfile(int empId, String language) async {
//     String apiUrl = latestProfile;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'emp_id': empId.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getLatestProfile Success with response: ${response.data}");
//         return LatestProfile.fromJson(response.data);
//       } else {
//         return LatestProfile();
//       }
//     } catch (exception) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return LatestProfile();
//     }
//   }

//   ///Employee/DisplayOrgLevel/{emp_id}/{language}
//   Future<List<DisplayOrgLevel>> getDisplayOrgLevel(
//       int empId, String language) async {
//     String apiUrl = displayOrgLevel;
//     List<DisplayOrgLevel> resultList = [];
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'emp_id': empId.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger
//             .d("執行getDisplayOrgLevel Success with response: ${response.data}");
//         // item1 = DisplayOrgLevel.fromJson(response.data[0]);
//         // item2 = DisplayOrgLevel.fromJson(response.data[1]);
//         // item3 = DisplayOrgLevel.fromJson(response.data[2]);
//         // resultList.add(item1);
//         // resultList.add(item2);
//         // resultList.add(item3);
//         for (int x = 0; x < response.data.length; x++) {
//           resultList.add(DisplayOrgLevel.fromJson(response.data[x]));
//         }
//         return resultList;
//       } else {
//         return [];
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return [];
//     }
//   }

//   ///UpdateEmployeeProfile
//   Future<bool> doUpdateEmployeeProfile(LatestProfile empProfile) async {
//     String apiUrl = updateProfile;
//     logger.d("Call Api: $apiUrl");
//     try {
//       //  debugPrint(empProfile.toJson2().toString());
//       var response = await _call(apiUrl, HttpType.POST,
//           needAuth: true, bodyData: empProfile.toJson2());

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行UpdateEmployeeProfile Success with response: ${response.data}");
//       } else {
//         logger.d(
//             "執行UpdateEmployeeProfile Success with response: ${response.data}");
//       }
//       return true;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return false;
//     }
//   }

//   ///Attachment/AddOrUpdate
//   Future<bool> doAttachmentAddOrUpdate(
//       int empId, String fileName, String fileSource) async {
//     String apiUrl = updateAttachment;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(apiUrl, HttpType.POST,
//           needAuth: true,
//           bodyData: {
//             "empId": empId,
//             "fileName": fileName,
//             "fileSource": fileSource
//           });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行doAttachmentAddOrUpdate Success with response: ${response.data}");
//       } else {
//         logger.d(
//             "執行doAttachmentAddOrUpdate Success with response: ${response.data}");
//       }
//       return true;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return false;
//     }
//   }

//   ///Employee/RestDay
//   Future<List<RestDay>> doEmployeeRestDay(
//       int empID, DateTime fromDate, DateTime toDate) async {
//     String apiUrl = employeeRestDay;
//     List<RestDay> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empID.toString(),
//         'fromDate': ParseTool.dateToApiDate((fromDate)),
//         'toDate': ParseTool.dateToApiDate((toDate)),
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行doEmployeeRestDay Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(RestDay.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return [];
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   ///Employee/Create/RestDay/{language}
//   Future<ApiResult> doEmployeeCreateRestDay(
//       RestDay restDay, String language) async {
//     String apiUrl = employeeCreateRestDay;
//     logger.d("Call Api: $apiUrl");
//     logger.d(restDay.toJson());
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         pathData: {'language': language},
//         bodyData: restDay.toJson(),
//         /* bodyData: {
//             "empId": empId,
//             "fileName": fileName,
//             "fileSource": fileSource
//           }*/
//       );

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行doEmployeeCreateRestDay Success with response: ${response.data}");
//         ApiResult apiResult = ApiResult();
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行doEmployeeCreateRestDay Success with response: ${response.data}");
//         return ApiResult();
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///System/Payrule/{EmpID}/{effectiveDate}
//   Future<PayRule> getPayRule(int empId, DateTime effectDate) async {
//     String apiUrl = payRule;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'emp_id': empId.toString(),
//         'effectiveDate': DateFormat("yyyy-MM-dd").format(effectDate),
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getPayRule Success with response: ${response.data}");
//         return PayRule.fromJson(response.data);
//       } else {
//         return PayRule();
//       }
//     } catch (exception) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return PayRule();
//     }
//   }

//   ///System/PayruleRD/{PayruleId}/{empID}
//   Future<PayRuleRD> getPayRuleRD(int empId, int? payRuleId) async {
//     String apiUrl = payRuleRD;
//     //  logger.d("empId: $empId , payRuleId: $payRuleId");
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'PayruleId': payRuleId.toString(),
//         'emp_id': empId.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getPayRuleRD Success with response: ${response.data}");
//         return PayRuleRD.fromJson(response.data);
//       } else {
//         return PayRuleRD();
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return PayRuleRD();
//     }
//   }

//   ///Employee/Delete/RestDay/{EmpRestDayUID}
//   Future<bool> doEmployeeDeleteRestDay(int? empRestDayUID) async {
//     String apiUrl = employeeDeleteRestDay;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.DELETE, needAuth: true, pathData: {
//         'EmpRestDayUID': empRestDayUID.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行doEmployeeDeleteRestDay Success with response: ${response.data}");
//         return true;
//       } else {
//         return false;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return false;
//     }
//   }

//   ///Availability/GetByEmpID/{empId}/{fromDate}/{toDate}
//   Future<List<Availability>> getAvailabilityGetByEmpID(
//       int empId, String fromDate, String toDate) async {
//     String apiUrl = availabilityGetByEmpID;
//     List<Availability> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//         'fromDate': fromDate,
//         'toDate': toDate,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getAvailabilityGetByEmpID Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(Availability.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return [];
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return [];
//     }
//   }

//   /// Get personal leave summary data
//   Future<List<PersonalLeaveSummary>?> getPersonalLeaveData(
//       {required String empId,
//       required String startDate,
//       required String endDate,
//       required String language}) async {
//     try {
//       var returnList = <PersonalLeaveSummary>[];

//       //url sample: Leave/Employee/Basic/{empId}/{startDate}/{endDate}/{language}
//       var response = await _call(getLeaveBasicUrl, HttpType.GET, pathData: {
//         'empId': empId,
//         'startDate': startDate,
//         'endDate': endDate,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         for (var element in response.data) {
//           returnList.add(PersonalLeaveSummary(
//             uid: ParseTool.checkNullToString(element['uid']),
//             //  empId: -1,
//             empId: int.parse(ParseTool.checkNullToString(element['emP_ID'])),
//             referNo: ParseTool.checkNullToString(element['refeR_NO']),
//             action: ParseTool.checkNullToString(element['action']),
//             leaveType: ParseTool.checkNullToString(element['lV_TYPE']),
//             status: ParseTool.checkNullToString(element['status']),
//             appliedDate:
//                 ParseTool.tryForamtDateToyyyyMMdd(element['createdDate']),
//             appliedBy: ParseTool.checkNullToString(element['nicK_NAME']),
//             startDate: ParseTool.tryForamtDateToyyyyMMdd(element['starT_DATE']),
//             endDate: ParseTool.tryForamtDateToyyyyMMdd(element['enD_DATE']),
//             duration: ParseTool.checkNullToString(element['nO_DAYS']),
//             leaveReason: ParseTool.checkNullToString(element['lV_REASON']),
//             remark: ParseTool.checkNullToString(element['lV_REMARK']),
//             attachment: '',
//             actionCode: ParseTool.checkNullToString(element['actioN_CODE']),
//             statusCode: ParseTool.checkNullToString(element['statuS_CODE']),
//             approvalBy:
//                 ParseTool.checkNullToString(element['approveD_BY_NICKNAME']),
//             approvalDate:
//                 ParseTool.tryForamtDateToyyyyMMdd(element['approveD_DATE']),
//             cancelAppliedBy: '',
//             cancelAppliedDate: ParseTool.tryForamtDateToyyyyMMdd(
//                 element['canceL_APPLIED_DATE']),
//             cancelApprovalBy:
//                 ParseTool.checkNullToString(element['canceL_APPROVED_BY_NAME']),
//             cancelApprovalDate: ParseTool.tryForamtDateToyyyyMMdd(
//                 element['canceL_APPROVED_DATE']),
//             startSession: ParseTool.checkNullToString(element['starT_SESSION']),
//             endSession: ParseTool.checkNullToString(element['enD_SESSION']),
//             hasAttachment: element['haS_ATTACHMENT'],
//           ));
//         }
//       }

//       return returnList;
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return null;
//     }
//   }

//   /// Get SubOrdinate Pending Leave data
//   Future<List<PersonalLeaveSummary>?> getSubOrdinatePendingLeaveData(
//       {required String empId, required String language}) async {
//     try {
//       var returnList = <PersonalLeaveSummary>[];

//       //url sample: Leave/MSS/Pending/{empId}/{language}
//       var response =
//           await _call(getSubOrdinatePendingLeaveUrl, HttpType.GET, pathData: {
//         'empId': empId,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         for (var element in response.data) {
//           returnList.add(PersonalLeaveSummary(
//             uid: ParseTool.checkNullToString(element['uid']),
//             empId: element['emP_ID'] ?? -1,
//             referNo: ParseTool.checkNullToString(element['refeR_NO']),
//             action: ParseTool.checkNullToString(element['action']),
//             leaveType: ParseTool.checkNullToString(element['lV_TYPE']),
//             status: ParseTool.checkNullToString(element['status']),
//             appliedDate:
//                 ParseTool.tryForamtDateToyyyyMMdd(element['createdDate']),
//             appliedBy: ParseTool.checkNullToString(element['nicK_NAME']),
//             startDate: ParseTool.tryForamtDateToyyyyMMdd(element['starT_DATE']),
//             endDate: ParseTool.tryForamtDateToyyyyMMdd(element['enD_DATE']),
//             duration: ParseTool.checkNullToString(element['nO_DAYS']),
//             leaveReason: ParseTool.checkNullToString(element['lV_REASON']),
//             remark: ParseTool.checkNullToString(element['lV_REMARK']),
//             attachment: '',
//             actionCode: ParseTool.checkNullToString(element['actioN_CODE']),
//             statusCode: ParseTool.checkNullToString(element['statuS_CODE']),
//             approvalBy:
//                 ParseTool.checkNullToString(element['approveD_BY_NICKNAME']),
//             approvalDate:
//                 ParseTool.tryForamtDateToyyyyMMdd(element['approveD_DATE']),
//             cancelAppliedBy: '',
//             cancelAppliedDate: ParseTool.tryForamtDateToyyyyMMdd(
//                 element['canceL_APPLIED_DATE']),
//             cancelApprovalBy:
//                 ParseTool.checkNullToString(element['canceL_APPROVED_BY_NAME']),
//             cancelApprovalDate: ParseTool.tryForamtDateToyyyyMMdd(
//                 element['canceL_APPROVED_DATE']),
//             startSession: ParseTool.checkNullToString(element['starT_SESSION']),
//             endSession: ParseTool.checkNullToString(element['enD_SESSION']),
//             hasAttachment: element['haS_ATTACHMENT'],
//           ));
//         }
//       }

//       return returnList;
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return null;
//     }
//   }

//   ///System/Payrule/Avail/{payruleId}/{effectiveDate}
//   Future<PayRuleAvail> getPayruleAvail(
//       int empId, int? payRuleId, String effectiveDate) async {
//     String apiUrl = systemPayruleAvail;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'payruleId': payRuleId.toString(),
//         'emp_id': empId.toString(),
//         'effectiveDate': effectiveDate,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getPayruleAvail Success with response: ${response.data}");
//         return PayRuleAvail.fromJson(response.data);
//       } else {
//         return PayRuleAvail();
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return PayRuleAvail();
//     }
//   }

//   ///System/Code/{categories}/{language}
//   Future<List<SystemCode>> getSystemCode(
//       String categories, String language) async {
//     String apiUrl = systemCode;
//     List<SystemCode> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'categories': categories,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getSystemCode Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SystemCode.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   ///Availability/Create/{language}
//   Future<ApiResult> doAvailabilityCreate(
//       Availability availability, String language) async {
//     String apiUrl = _dio.options.baseUrl + availabilityCreate;
//     logger.d("Call Api: $apiUrl");
//     logger.d(
//         "Availability Json Form: ${availability.emPID}, ${availability.avaiLREMARK}");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         pathData: {
//           'language': language,
//         },
//         bodyData: availability.toJson(),
//       );

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行doAvailabilityCreate Success with response: ${response.data}");
//         ApiResult apiResult = ApiResult();
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Availability/Delete/{EmpAvailUID}/{language}
//   Future<bool> doAvailabilityDelete(int? uid) async {
//     String apiUrl = availabilityDelete;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.DELETE, needAuth: true, pathData: {
//         'EmpAvailUID': uid.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行doAvailabilityDelete Success with response: ${response.data}");
//         return true;
//       } else {
//         return false;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return false;
//     }
//   }

//   ///OpenShift/GetShiftBiddings/{empID}/{DateFrom}/{DateTo}/{language}
//   Future<List<ShiftBidding>> getShiftBiddings(
//       int empId, String dateFrom, String dateTo, String language) async {
//     String apiUrl = openShiftGetShiftBiddings;
//     List<ShiftBidding> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empID': empId.toString(),
//         'DateFrom': dateFrom,
//         'DateTo': dateTo,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getShiftBiddings Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(ShiftBidding.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///OpenShift/GetEmpOpenShiftByMonth/{empID}/{Period}/{language}
//   Future<List<OpenShift>> getEmpOpenShiftByMonth(
//       int empId, String period, String language) async {
//     String apiUrl = openShiftGetEmpOpenShiftByMonth;
//     List<OpenShift> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empID': empId.toString(),
//         'Period': period,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getEmpOpenShiftByMonth Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(OpenShift.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///OpenShift/GetEmpOpenShiftCalendar/{empID}/{Period}/{language}
//   Future<List<ShiftDateWeek>> getEmpOpenShiftCalendar(
//       int empId, String period, String language) async {
//     String apiUrl = openShiftGetEmpOpenShiftCalendar;
//     List<ShiftDateWeek> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empID': empId.toString(),
//         'Period': period,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行GetEmpOpenShiftCalendar Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(ShiftDateWeek.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   ///SwapShift/Request/Personal/{SwapType}/{empID}/{DateFrom}/{DateTo}/{language}
//   Future<List<SwapShift>> getSwapShiftRequest(String swapType, int empId,
//       String dateFrom, String dateTo, String language) async {
//     String apiUrl = swapShiftRequest;
//     List<SwapShift> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'SwapType': swapType,
//         'empID': empId.toString(),
//         'DateFrom': dateFrom,
//         'DateTo': dateTo,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.w("執行getSwapShiftRequest Success with response: ${(response)}");
//         for (var element in response.data) {
//           dataList.add(SwapShift.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///OpenShift/GetEmpOpenShiftByDate/{empID}/{Date}/{language}
//   Future<List<OpenShiftByDate>> getEmpOpenShiftByDate(
//       int empId, String date, String language) async {
//     String apiUrl = openShiftByDate;
//     List<OpenShiftByDate> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empID': empId.toString(),
//         'Date': date,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getEmpOpenShiftByDate Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(OpenShiftByDate.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   ///OpenShift/Employee/Bid/{empID}/{openShiftID}/{language}
//   Future<ApiResult> doTakeShift(
//       int empId, int openShiftID, String language) async {
//     String apiUrl = openShiftEmployeeBid;
//     logger.d(
//         "Call Api: $apiUrl empID:$empId, openShiftID:$openShiftID, language:$language");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.POST, needAuth: true, pathData: {
//         'empID': empId.toString(),
//         'openShiftID': openShiftID.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行doTakeShift Success with response: ${response.data}");
//         ApiResult apiResult = ApiResult();
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult();
//     }
//   }

//   ///SwapShift/GetEmpSch/Calendar/{empID}/{StartDate}/{EndDate}/{language}
//   Future<List<SwapShiftCalendarWeek>> getSwapShiftCalendarWeekList(
//       int empId, String dateFrom, String dateTo, String language) async {
//     String apiUrl = swapShiftGetEmpSchCalendar;
//     List<SwapShiftCalendarWeek> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     logger.d("Value: $empId  $dateFrom  $dateTo  $language");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empID': empId.toString(),
//         'StartDate': dateFrom,
//         'EndDate': dateTo,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getSwapShiftCalendarWeekList Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SwapShiftCalendarWeek.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///SwapShift/GetSiteSch/{SwapType}/{schID}/0/{language}
//   Future<List<SiteSch>> getSiteSch(
//       String swapType, int schID, String language) async {
//     String apiUrl = swapShiftGetSiteSch;
//     List<SiteSch> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'SwapType': swapType,
//         'schID': schID.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getSiteSch Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SiteSch.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   ///SwapShift/GetSiteSch/{SwapType}/{schID}/{RestDayID}/{language}
//   Future<List<SiteSch>> getSiteSchNew(
//       String swapType, int toSchID, int fromSchID, String language) async {
//     String apiUrl = swapShiftGetSiteSchNew;
//     List<SiteSch> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'SwapType': swapType,
//         'schID': toSchID.toString(),
//         'RestDayID': fromSchID.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getSiteSchNew Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SiteSch.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Availability/Create/{language}
//   Future<ApiResult> doSwapShiftRequestCreate(
//       RequestCreate requestCreate, String language) async {
//     String apiUrl = swapShiftRequestCreate;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     logger.d("RequestCreate: ${requestCreate.toJson()}");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         pathData: {
//           'language': language,
//         },
//         bodyData: requestCreate.toJson(),
//       );

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行doSwapShiftRequestCreate Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行doSwapShiftRequestCreate Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///CheckCompliances/{checkStartTime}/{checkEndTime}/{language}
//   Future<CheckCompliances> doCheckCompliances(
//       ShiftItem api1ShiftItem,
//       ShiftItem api2ShiftItem,
//       String checkStartTime,
//       String checkEndTime,
//       String language) async {
//     String apiUrl = checkCompliances;
//     List<Map<String, dynamic>> bodyJson = [];
//     if (api1ShiftItem.empid != 0) {
//       logger.d("ShiftItem1: ${api1ShiftItem.toJson()}");
//       bodyJson.add(api1ShiftItem.toJson());
//     }
//     if (api2ShiftItem.empid != 0) {
//       logger.d("ShiftItem2: ${api2ShiftItem.toJson()}");
//       bodyJson.add(api2ShiftItem.toJson());
//     }
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         pathData: {
//           'checkStartTime': checkStartTime,
//           'checkEndTime': checkEndTime,
//           'language': language,
//         },
//         listBodyData: bodyJson,
//       );

//       return CheckCompliances.fromJson(response.data);
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return CheckCompliances();
//     }
//   }

//   ///SwapShift/Request/Pending/{empID}/{StartDate}/{EndDate}/{language}
//   Future<List<SwapShift>> getSwapShiftRequestPending(
//       int empId, String startDate, String sndDate, String language) async {
//     String apiUrl = swapShiftRequestPending;
//     List<SwapShift> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empID': empId.toString(),
//         'StartDate': startDate,
//         'EndDate': sndDate,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.w(response.data);
//         logger.d(
//             "執行getSwapShiftRequestPending Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SwapShift.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Employee/GetEmpNotification/{EmpID}/{language}
//   Future<List<NotificationModel>> getNotificationList(
//       int empId, String language) async {
//     String apiUrl = notificationList;
//     List<NotificationModel> dataList = [];
//     // logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         // logger.d(
//         //     "執行getSwapShiftRequestPending Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(NotificationModel.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   // * new flow using repository and retrofit dio
//   ///Employee/GetEmpNotification/{EmpID}/{language}
//   Future<List<NotificationModel>> getNotificationListNew(
//       int empId, String language) async {
//     List<NotificationModel> dataList = [];
//     try {
//       var response = await notificationRepository.getNotificationList(
//           empId: empId, lang: language);

//       for (var element in response) {
//         dataList.add(NotificationModel.fromJson(element.toJson()));
//       }
//       return dataList;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   /// /System/Code/HROTG_APP/{language}
//   Future<ContactInfoModel> getContactMe({required String language}) async {
//     try {
//       var response =
//           await notificationRepository.getMeContactInfo(lang: language);
//       return response;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ContactInfoModel();
//     }
//   }

//   ///SwapShift/Approve/{ActionID}/{requestID}/{empID}/{language}
//   Future<ApiResult> doSwapShiftApprove(
//       int actionID, int requestID, int empId, String language) async {
//     String apiUrl = swapShiftApprove;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         pathData: {
//           'ActionID': actionID.toString(),
//           'requestID': requestID.toString(),
//           'empID': empId.toString(),
//           'language': language,
//         },
//       );

//       if (response.statusCode == 200) {
//         logger
//             .d("執行doSwapShiftApprove Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行doSwapShiftRequestCreate Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   /// Get Attachment via LeaveID
//   Future<String?> getAttachment(String leaveId) async {
//     try {
//       String base64String = '';
//       //url sample: Leave/Attachment/{leaveId}
//       var response = await _call(getAttchmentUrl, HttpType.GET,
//           pathData: {'leaveId': leaveId});

//       if (response.statusCode == 200) {
//         base64String = ParseTool.checkNullToString(response.data['attachment']);
//       }

//       return base64String;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return null;
//     }
//   }

//   /// Get Attachment via LeaveID
//   Future<bool?> cancelLeave(String leaveId, String language) async {
//     try {
//       bool actionResult = false;
//       //url sample: Leave/Employee/Cancel/{leaveId}
//       var response = await _call(cancelLeaveUrl, HttpType.DELETE,
//           pathData: {'leaveId': leaveId, 'language': language});

//       if (response.statusCode == 200) {
//         actionResult = true;
//       }

//       Logger().i('cancel leave: $response');
//       return actionResult;
//     } on DioError catch (exception) {
//       Logger().i('Dio exception2 : ${exception.response?.data['message']}');
//       rethrow;
//     } catch (exception, stackTrace) {
//       Logger().i('cancel exception: $exception');

//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       rethrow;
//       // return null;
//     }
//   }

//   /// Post Attachment via LeaveID
//   Future<ApiResult> updateAttachmentForLeave(
//       {required String leaveId,
//       required String attachment,
//       required String language}) async {
//     try {
//       ApiResult apiResult = ApiResult();
//       //url sample: Leave/Employee/UpdateAttachment/{language}
//       var response =
//           await _call(updateAttchmentForLeaveUrl, HttpType.POST, pathData: {
//         'language': language
//       }, bodyData: {
//         'uid': leaveId,
//         'attachment': attachment,
//       });

//       if (response.statusCode == 200) {
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行updateAttachmentForLeave Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   /// approve/reject leave
//   Future<bool> approveOrRejctLeave(
//       {required int leaveId,
//       required int supvEmpID,
//       required bool approveOrNot}) async {
//     bool actionResult = false;
//     try {
//       String statusCode = approveOrNot ? 'APPROVE' : 'REJECT';
//       //url sample: Leave/MSS/Approval
//       debugPrint(
//           "leaveUID: $leaveId, supvEmpID: $supvEmpID, status_code: $statusCode");
//       var response = await _call(approveLeaveUrl, HttpType.POST, bodyData: {
//         'leaveUID': leaveId,
//         'supvEmpID': supvEmpID,
//         'status_code': statusCode,
//       });

//       if (response.statusCode == 200) {
//         actionResult = true;
//       }

//       return actionResult;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return actionResult;
//     }
//   }

//   /// Get approved history leave Data within days
//   Future<List<PersonalLeaveSummary>?> getApprovedHistoryData(
//       {required String empId,
//       required String days,
//       required String language}) async {
//     try {
//       var returnList = <PersonalLeaveSummary>[];
//       //url sample: Leave/MSS/Approved/{empId}/{NOD}/{language}
//       var response =
//           await _call(getApprovedHistoryDataUrl, HttpType.GET, pathData: {
//         'empId': empId,
//         'NOD': days,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         for (var element in response.data) {
//           returnList.add(PersonalLeaveSummary(
//             uid: ParseTool.checkNullToString(element['uid']),
//             empId: element['emP_ID'] ?? -1,
//             referNo: ParseTool.checkNullToString(element['refeR_NO']),
//             action: ParseTool.checkNullToString(element['action']),
//             leaveType: ParseTool.checkNullToString(element['lV_TYPE']),
//             status: ParseTool.checkNullToString(element['status']),
//             appliedDate:
//                 ParseTool.tryForamtDateToyyyyMMdd(element['createdDate']),
//             appliedBy: ParseTool.checkNullToString(element['nicK_NAME']),
//             startDate: ParseTool.tryForamtDateToyyyyMMdd(element['starT_DATE']),
//             endDate: ParseTool.tryForamtDateToyyyyMMdd(element['enD_DATE']),
//             duration: ParseTool.checkNullToString(element['nO_DAYS']),
//             leaveReason: ParseTool.checkNullToString(element['lV_REASON']),
//             remark: ParseTool.checkNullToString(element['lV_REMARK']),
//             attachment: '',
//             actionCode: ParseTool.checkNullToString(element['actioN_CODE']),
//             statusCode: ParseTool.checkNullToString(element['statuS_CODE']),
//             approvalBy:
//                 ParseTool.checkNullToString(element['approveD_BY_NICKNAME']),
//             approvalDate:
//                 ParseTool.tryForamtDateToyyyyMMdd(element['approveD_DATE']),
//             cancelAppliedBy: '',
//             cancelAppliedDate: ParseTool.tryForamtDateToyyyyMMdd(
//                 element['canceL_APPLIED_DATE']),
//             cancelApprovalBy:
//                 ParseTool.checkNullToString(element['canceL_APPROVED_BY_NAME']),
//             cancelApprovalDate: ParseTool.tryForamtDateToyyyyMMdd(
//                 element['canceL_APPROVED_DATE']),
//             startSession: ParseTool.checkNullToString(element['starT_SESSION']),
//             endSession: ParseTool.checkNullToString(element['enD_SESSION']),
//             hasAttachment: element['haS_ATTACHMENT'],
//           ));
//         }
//       }

//       return returnList;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return null;
//     }
//   }

//   /// Get rejected history leave Data within days
//   Future<List<PersonalLeaveSummary>?> getRejectedHistoryData(
//       {required String empId,
//       required String days,
//       required String language}) async {
//     try {
//       var returnList = <PersonalLeaveSummary>[];
//       //url sample: Leave/MSS/Rejected/{empId}/{NOD}/{language}
//       var response =
//           await _call(getRejectedHistoryDataUrl, HttpType.GET, pathData: {
//         'empId': empId,
//         'NOD': days,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         for (var element in response.data) {
//           returnList.add(PersonalLeaveSummary(
//             uid: ParseTool.checkNullToString(element['uid']),
//             empId: element['emP_ID'] ?? -1,
//             referNo: ParseTool.checkNullToString(element['refeR_NO']),
//             action: ParseTool.checkNullToString(element['action']),
//             leaveType: ParseTool.checkNullToString(element['lV_TYPE']),
//             status: ParseTool.checkNullToString(element['status']),
//             appliedDate:
//                 ParseTool.tryForamtDateToyyyyMMdd(element['createdDate']),
//             appliedBy: ParseTool.checkNullToString(element['nicK_NAME']),
//             startDate: ParseTool.tryForamtDateToyyyyMMdd(element['starT_DATE']),
//             endDate: ParseTool.tryForamtDateToyyyyMMdd(element['enD_DATE']),
//             duration: ParseTool.checkNullToString(element['nO_DAYS']),
//             leaveReason: ParseTool.checkNullToString(element['lV_REASON']),
//             remark: ParseTool.checkNullToString(element['lV_REMARK']),
//             attachment: '',
//             actionCode: ParseTool.checkNullToString(element['actioN_CODE']),
//             statusCode: ParseTool.checkNullToString(element['statuS_CODE']),
//             approvalBy:
//                 ParseTool.checkNullToString(element['approveD_BY_NICKNAME']),
//             approvalDate:
//                 ParseTool.tryForamtDateToyyyyMMdd(element['approveD_DATE']),
//             cancelAppliedBy: '',
//             cancelAppliedDate: ParseTool.tryForamtDateToyyyyMMdd(
//                 element['canceL_APPLIED_DATE']),
//             cancelApprovalBy:
//                 ParseTool.checkNullToString(element['canceL_APPROVED_BY_NAME']),
//             cancelApprovalDate: ParseTool.tryForamtDateToyyyyMMdd(
//                 element['canceL_APPROVED_DATE']),
//             startSession: ParseTool.checkNullToString(element['starT_SESSION']),
//             endSession: ParseTool.checkNullToString(element['enD_SESSION']),
//             hasAttachment: element['haS_ATTACHMENT'],
//           ));
//         }
//       }

//       return returnList;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return null;
//     }
//   }

//   /// Get leave type
//   Future<List<LeaveType>?> getLeaveTypeList(
//       {required String empId,
//       required String date,
//       required String language}) async {
//     try {
//       var returnList = <LeaveType>[];
//       //url sample: Employee/GetleaveList/{empId}/{Date}/{language}
//       var response = await _call(getleaveTypeListUrl, HttpType.GET, pathData: {
//         'empId': empId,
//         'Date': date,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         for (var element in response.data) {
//           returnList.add(LeaveType.fromJson(element));
//         }
//       }

//       return returnList;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return null;
//     }
//   }

//   /// Get leave type
//   Future<String?> calNoOfDaysForLeave(
//       {required String empId,
//       required String lvTypeUid,
//       required String satrtDate,
//       required String satrtDateSession,
//       required String endDate,
//       required String endDateSession}) async {
//     try {
//       var returnDays = '';
//       //url sample: Leave/Employee/calNoOfDays
//       var response =
//           await _call(calNoOfDaysForLeaveUrl, HttpType.POST, bodyData: {
//         'emP_ID': empId,
//         'lV_TYPE_ID': lvTypeUid,
//         'starT_DATE': satrtDate,
//         'starT_SESSION': satrtDateSession,
//         'enD_DATE': endDate,
//         'enD_SESSION': endDateSession,
//       });

//       if (response.statusCode == 200) {
//         returnDays = ParseTool.checkNullToString(response.data['days']);
//       }

//       return returnDays;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return null;
//     }
//   }

//   /// Get leave reason
//   Future<List<LeaveReason>?> getLeaveReasonList(
//       {required String leaveType, required String language}) async {
//     try {
//       var returnList = <LeaveReason>[];
//       //url sample: System/LeaveReasons/{leaveType}/{language}
//       var response =
//           await _call(getLeaveReasonListUrl, HttpType.GET, pathData: {
//         'leaveType': leaveType,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         for (var element in response.data) {
//           returnList.add(LeaveReason.fromJson(element));
//         }
//       }

//       return returnList;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return null;
//     }
//   }

//   /// Submit a new leave
//   Future<String?> submitNewLeave(
//       {required AddLeaveModel newLeave, required String language}) async {
//     try {
//       String? actionResult = '';
//       //url sample: Leave/Employee/Create
//       var response = await _call(
//         submitNewLeaveUrl,
//         HttpType.POST,
//         bodyData: newLeave.toJson(),
//         pathData: {
//           'language': language,
//         },
//       );
//       Logger().i(' leave apiservice ${response.data}');

//       if (response.statusCode == 200) {}

//       return actionResult;
//     } catch (exception, stackTrace) {
//       if (exception is DioError) {
//         Logger().i(
//             'exception leave apiservice ${exception.response?.data['message']}');

//         // Catch 404 error when no message attached in the response
//         // if(exception.response?.data?.contains('404')){
//         //   return exception.response?.data;
//         // }

//         String test =
//             ParseTool.checkNullToString(exception.response?.data['message']);
//         Logger().i('show response error ${test}');
//         return test;
//       }

//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return null;
//     }
//   }

//   ///SwapShift/Request/Cancel/{RequestUID}/{language}
//   Future<ApiResult> doWithdrawRequest(int requestID, String language) async {
//     String apiUrl = withdrawRequest;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.DELETE,
//         needAuth: true,
//         pathData: {
//           'RequestUID': requestID.toString(),
//           'language': language,
//         },
//       );

//       if (response.statusCode == 200) {
//         logger.d("執行doWithdrawRequest Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d("執行doWithdrawRequest Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Claim/Employee/Basic/{EmpID}/{StartDate}/{EndDate}/{language}
//   Future<List<ClaimEmployeeBasic>> getClaimEmployeeBasic(
//       int empId, String startDate, String endDate, String language) async {
//     String apiUrl = claimEmployeeBasic;
//     List<ClaimEmployeeBasic> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//         'StartDate': startDate,
//         'EndDate': endDate,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getClaimEmployeeBasic Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(ClaimEmployeeBasic.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///OpenShift/Employee/Withdraw/{biddingID}/{language}
//   Future<ApiResult> doWithdrawBidding(int? biddingID, String language) async {
//     String apiUrl = openShiftEmployeeWithdraw;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         pathData: {
//           'biddingID': biddingID.toString(),
//           'language': language,
//         },
//       );

//       if (response.statusCode == 200) {
//         logger.d("執行doWithdrawBidding Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d("執行doWithdrawBidding Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///System/WorkTypes/{language}
//   Future<List<SystemWorkType>> getSystemWorkTypes(String language) async {
//     String apiUrl = systemWorkTypes;
//     List<SystemWorkType> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger
//             .d("執行getSystemWorkTypes Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SystemWorkType.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   /////
//   ///
//   /////System/WorkTypes/{language}
//   Future<List<SystemAllowances>> getSystemAllowances(String language) async {
//     String apiUrl = systemAllowances;
//     List<SystemAllowances> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger
//             .d("執行getSystemAllowances Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SystemAllowances.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Employee/GetPayCycle/{empId}
//   Future<EmployeePayCycle> getEmployeePayCycle(int empId) async {
//     String apiUrl = employeePayCycle;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger
//             .d("執行getEmployeePayCycle Success with response: ${response.data}");
//         return EmployeePayCycle.fromJson(response.data);
//       } else {
//         return EmployeePayCycle();
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return EmployeePayCycle();
//     }
//   }

//   ///System/Contracts/Number/{Contract_num}/{language}
//   Future<List<SystemContracts>> doSearchSystemContracts(
//       String contract, String language) async {
//     String apiUrl = systemContracts;
//     List<SystemContracts> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'Contract_num': contract,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行doSearchSystemContracts Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SystemContracts.fromJson(element));
//         }
//         return dataList;
//       } else {
//         Logger().i(dataList);
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//        Logger().i('${dataList.isEmpty} + $stackTrace');
//        return dataList;
      
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Claim/Employee/Create/{language}
//   Future<ApiResult> doClaimCreate(
//       ClaimEmployeeBasic createClaimItem, String language) async {
//     String apiUrl = claimEmployeeCreate;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         pathData: {'language': language},
//         bodyData: {
//           'adJ_NOH': createClaimItem.adJNOH,
//           'adJ_NOH_TIME': createClaimItem.adJNOHTIME,
//           'attachment': createClaimItem.attachment,
//           'conT_CODE': createClaimItem.conTCODE,
//           'conT_ID': createClaimItem.conTID,
//           'conT_NAME': createClaimItem.conTNAME,
//           'emP_ID': createClaimItem.emPID,
//           'endtime': createClaimItem.endtime,
//           'haS_ATTACHMENT': createClaimItem.haSATTACHMENT,
//           'locatioN_DESC': createClaimItem.locatioNDESC,
//           'modulE_ID': createClaimItem.modulEID,
//           'noH_TIME': createClaimItem.noHTIME,
//           'noh': createClaimItem.noh,
//           'starttime': createClaimItem.starttime,
//           'tA_CODE': createClaimItem.tACODE,
//           'tS_REMARK': createClaimItem.tSREMARK,
//           'unit': createClaimItem.unit,
//           'wT_ID': createClaimItem.wTID
//         },
//       );
//       Logger().i('F75 submit ${response.data}');
//       Logger().i('F75 submit status ${response.statusCode}');
//       if (response.statusCode == 200) {
//         logger.d("執行doClaimCreate Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d("執行doClaimCreate Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       Logger().i('F75 submit ${exception.response?.data}');
//       Logger().i('F75 submit status ${exception.response?.statusCode}');
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Claim/Employee/Update
//   Future<ApiResult> doClaimUpdate(
//       ClaimEmployeeBasic createClaimItem, String language) async {
//     String apiUrl = claimEmployeeUpdate;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         pathData: {'language': language},
//         bodyData: {
//           'adJ_NOH': createClaimItem.adJNOH,
//           'conT_CODE': createClaimItem.conTCODE,
//           'conT_ID': createClaimItem.conTID,
//           'conT_NAME': createClaimItem.conTNAME,
//           'endtime': createClaimItem.endtime,
//           'locatioN_DESC': createClaimItem.locatioNDESC,
//           'modulE_ID': createClaimItem.modulEID,
//           'noh': createClaimItem.noh,
//           'starttime': createClaimItem.starttime,
//           'tA_CODE': createClaimItem.tACODE,
//           'tS_REMARK': createClaimItem.tSREMARK,
//           'unit': createClaimItem.unit,
//           'wT_ID': createClaimItem.wTID,
//           'uid': createClaimItem.uid
//         },
//       );

//       if (response.statusCode == 200) {
//         logger.d("執行doClaimUpdate Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d("執行doClaimUpdate Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Claim/Attachment/{LateTSID}
//   Future<String> getClaimAttachment(int attachmentID) async {
//     String apiUrl = claimAttachment;
//     logger.d("Call Api: $apiUrl");
//     CompLogo tempCompLogo = CompLogo(attachment: '');
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'LateTSID': attachmentID.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger
//             .d("執行getClaimAttachment Success with response: ${response.data}");
//         tempCompLogo = CompLogo.fromJson(response.data);
//         return tempCompLogo.attachment;
//       } else {
//         return "";
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return "";
//     }
//   }

//   ///Claim/Employee/Basic/{EmpID}/{StartDate}/{EndDate}/{language}
//   Future<List<ClaimEmployeeBasic>> getAppliedEmployeeBasic(
//       int empId, String language) async {
//     String apiUrl = appliedEmployeeBasic;
//     List<ClaimEmployeeBasic> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行appliedEmployeeBasic Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(ClaimEmployeeBasic.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Claim/MSS/Approval
//   Future<ApiResult> doSendDecision(
//       int lateTSID, String decision, int empId) async {
//     String apiUrl = claimMssApproval;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         bodyData: {
//           'lateTSID': lateTSID.toString(),
//           'status_code': decision,
//           'supvEmpID': empId.toString(),
//         },
//       );

//       if (response.statusCode == 200) {
//         logger.d("執行doSendDecision Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d("執行doSendDecision Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Claim/MSS/Approved/{EmpID}/{NOD}/{language}
//   Future<List<ClaimEmployeeBasic>> getHistoryApprovedLateTimesheetForm(
//       int empId, String nod, String language) async {
//     String apiUrl = claimMssApprovedHistory;
//     List<ClaimEmployeeBasic> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//         'NOD': nod,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getHistoryApprovedLateTimesheetForm Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(ClaimEmployeeBasic.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Claim/MSS/Rejected/{EmpID}/{NOD}/{language}
//   Future<List<ClaimEmployeeBasic>> getHistoryRejectedLateTimesheetForm(
//       int empId, String nod, String language) async {
//     String apiUrl = claimMssRejectedHistory;
//     List<ClaimEmployeeBasic> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//         'NOD': nod,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getHistoryRejectedLateTimesheetForm Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(ClaimEmployeeBasic.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Clocking/GetByEmpID/{empId}/{fromDate}/{toDate}/{language}
//   Future<List<EmployeeClocking>> getEmployeeClockingList(
//       int empId, String startDate, String endDate, String language) async {
//     String apiUrl = clockingGetByEmpID;
//     List<EmployeeClocking> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//         'fromDate': startDate,
//         'toDate': endDate,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getEmployeeClockingList Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(EmployeeClocking.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   ///Clocking/GetLastAction/{empId}/{dDate}
//   Future<LastClockingAction> getLastClockingAction(
//       int empId, String dDate) async {
//     String apiUrl = clockingGetLastAction;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//         'dDate': dDate,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getLastClockingAction Success with response: ${response.data}");
//         return LastClockingAction.fromJson(response.data);
//       } else {
//         return LastClockingAction();
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return LastClockingAction();
//     }
//   }

//   ///Clocking/GetNextAction/{ActionCode}/{language}
//   Future<List<ClockingAction>> getNextClockingAction(
//       String actionCode, String language) async {
//     String apiUrl = clockingGetNextAction;
//     List<ClockingAction> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'ActionCode': actionCode,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getNextClockingAction Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(ClockingAction.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   ///Timesheet/Clocking/Validate/{GenClocking}/{language}
//   Future<ApiResult> doGenerateClocking(
//       EmployeeClocking empClocking, bool genClocking, String language) async {
//     String apiUrl = generateClocking;
//     logger.d("Call Api: $apiUrl");
//     logger.d(empClocking.toJson());
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         pathData: {"GenClocking": genClocking.toString(), "language": language},
//         bodyData: empClocking.toJson(),
//         /* bodyData: {
//             "empId": empId,
//             "fileName": fileName,
//             "fileSource": fileSource
//           }*/
//       );

//       if (response.statusCode == 200) {
//         logger
//             .d("執行doGenerateClocking Success with response: ${response.data}");
//         ApiResult apiResult = ApiResult();
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger
//             .d("執行doGenerateClocking Success with response: ${response.data}");
//         return ApiResult();
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Claim/Employee/Cancel/{LateTSID}
//   Future<ApiResult> doCancelLateTimesheet(int lateTSID, String language) async {
//     String apiUrl = claimEmployeeCancel;
//     logger.d("Call Api: $apiUrl");
//     logger.d("Cancel Late Timesheet id : $lateTSID");
//     try {
//       var response = await _call(apiUrl, HttpType.DELETE,
//           needAuth: true,
//           pathData: {'LateTSID': lateTSID.toString(), 'language': language});

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行doCancelLateTimesheet Success with response: ${response.data}");
//         ApiResult apiResult = ApiResult();
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行doCancelLateTimesheet Success with response: ${response.data}");
//         return ApiResult();
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       if (exception.response?.statusCode == 400) {
//         ApiResult apiResult = ApiResult.fromJson(exception.response?.data);
//         apiResult.statusCode = exception.response!.statusCode!;
//         return apiResult;
//       } else {
//         return ApiResult.fromJson(exception.response?.data);
//       }
//     }
//   }

//   ///Employee/GetPayCycle/{empId}
//   Future<EmployeePayCycleHr> getEmployeePayCycleHr(int empId) async {
//     String apiUrl = employeePayCycleHr;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getEmployeePayCycleHr Success with response: ${response.data}");
//         return EmployeePayCycleHr.fromJson(response.data);
//       } else {
//         return EmployeePayCycleHr();
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return EmployeePayCycleHr();
//     }
//   }

//   ///System/PayCycle/Detail/{pID}/{Year}
//   Future<List<PayCycle>> getSystemPayCycle(int pID, int year) async {
//     String apiUrl = systemPayCycle;
//     List<PayCycle> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'pID': pID.toString(),
//         'Year': year.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getSystemPayCycle Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(PayCycle.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Timesheet/Employee/{empID}/{startDate}/{endDate}/{language}
//   Future<List<PersonalTimesheetEmployee>> getEmployeeDetails(
//       int empId, String startDate, String endDate, String language) async {
//     String apiUrl = timesheetEmployee;
//     List<PersonalTimesheetEmployee> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empID': empId.toString(),
//         'startDate': startDate,
//         'endDate': endDate,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger
//             .d("執行getEmployeeDetails Success with response: ${response.data}");
//         for (var element in response.data) {
//           /* List summaryJsonList = jsonDecode(element.summary);
//           List<Summary> summaryList = [];
//           for (var summaryElement in summaryJsonList) {
//             Summary tmpSummary = Summary.fromJson(summaryElement);
//             summaryList.add(tmpSummary);
//           }*/

//           dataList.add(PersonalTimesheetEmployee.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///MEUser/UpdateUserSetting/{empID}
//   Future<ApiResult> doUpdateUserSetting(
//       int empId, String updateType, String updateValue) async {
//     String apiUrl = meUserUpdateUserSetting;
//     logger.w("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.POST, needAuth: true, pathData: {
//         "empID": empId.toString()
//       }, bodyData: {
//         "userid": empId.toString(),
//         "seT_TYPE": updateType,
//         "seT_TYPEVALUE": updateValue,
//         "uid": 0,
//         "createdBy": null,
//         "createdDate": null,
//         "modifiedBy": null,
//         "modifiedDate": null
//       });

//       if (response.statusCode == 200) {
//         logger
//             .d("執行doUpdateUserSetting Success with response: ${response.data}");
//         ApiResult apiResult = ApiResult();
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger
//             .d("執行doUpdateUserSetting Success with response: ${response.data}");
//         return ApiResult();
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Timesheet/GetByID/{TS_ID}/{language}
//   Future<PersonalTimesheetEmployee> getTimesheetByID(
//       int tsID, String language) async {
//     String apiUrl = timesheetGetByID;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'TS_ID': tsID.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getTimesheetByID Success with response: ${response.data}");
//         return PersonalTimesheetEmployee.fromJson(response.data[0]);
//       } else {
//         return PersonalTimesheetEmployee();
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return PersonalTimesheetEmployee();
//     }
//   }

//   ///System/Shifts/{language}
//   Future<List<ShiftType>> getShiftTypeList(String language) async {
//     String apiUrl = systemShifts;
//     List<ShiftType> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getShiftTypeList Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(ShiftType.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Timesheet/Update
//   Future<ApiResult> updateTimesheet(
//       PersonalTimesheetEmployee sourceTimesheet) async {
//     String apiUrl = timesheetUpdate;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     logger.d("PersonalTimesheetEmployee: ${sourceTimesheet.toJson()}");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         bodyData: {
//           "empid": sourceTimesheet.empID,
//           "date": ParseTool.dateToApiDate(DateTime.parse(
//               ParseTool.apiDateToCustomDate(sourceTimesheet.date, "yyyy-MM-dd",
//                   needTime: false))),
//           "shifT_TYPE_ID": sourceTimesheet.shiftTypeID,
//           "scH_ID": sourceTimesheet.scHID,
//           "unplanneD_ID": sourceTimesheet.unplannedID,
//           "clockstart": sourceTimesheet.clockStart,
//           "clockend": sourceTimesheet.clockEnd,
//           "approvestart": sourceTimesheet.approveStart,
//           "approveend": sourceTimesheet.approveEnd,
//           "status": sourceTimesheet.status,
//           "lock": sourceTimesheet.lock,
//           "tS_REMARK": sourceTimesheet.tsRemark,
//           "suP_STATUS": sourceTimesheet.supStatus,
//           "suP_STATUS_DESC": sourceTimesheet.supStatusDesc,
//           "shifT_TYPE_DESC": sourceTimesheet.shiftTypeDesc,
//           "firsT_NAME": sourceTimesheet.firsTNAME,
//           "familY_NAME": sourceTimesheet.familyName,
//           "chinesE_NAME": sourceTimesheet.chinesENAME,
//           "nicK_NAME": sourceTimesheet.nickName,
//           "fullName": sourceTimesheet.fullName,
//           "hrmS_CODE": sourceTimesheet.hrmsCode,
//           "emP_CODE": sourceTimesheet.empCode,
//           "scH_START": ParseTool.dateToApiDate(DateTime.parse(
//               ParseTool.apiDateToCustomDate(
//                   sourceTimesheet.schStart, "yyyy-MM-dd",
//                   needTime: false))),
//           "scH_END": ParseTool.dateToApiDate(DateTime.parse(
//               ParseTool.apiDateToCustomDate(
//                   sourceTimesheet.schEnd, "yyyy-MM-dd",
//                   needTime: false))),
//           "uid": sourceTimesheet.uid,
//           "createdBy": null,
//           "createdDate": null,
//           "modifiedBy": null,
//           "modifiedDate": null
//         },
//       );

//       if (response.statusCode == 200) {
//         logger.d("執行updateTimesheet Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d("執行updateTimesheet Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

// // TimesheetSummary: {uid: 1706250, code: 24W, desc: 24 hour work, normal: 0.0, amended: 23.3, unit: 時數, auto: false, manual: false, event: false, alloW_EDIT: false}
//   ///Timesheet/Summary/Update
//   Future<ApiResult> updateTimesheetSummary(
//       PersonalTimesheetEmployee sourceTimesheet,
//       TimesheetSummary sourceSummary) async {
//     String apiUrl = timesheetSummaryUpdate;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     logger.d("TimesheetSummary: ${sourceSummary.toJson()}");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         bodyData: {
//           "tS_ID": sourceTimesheet.uid,
//           "tA_CODE": sourceSummary.code,
//           "noh": sourceSummary.normal,
//           "adJ_NOH": sourceSummary.amended,
//           "noH_TIME": null,
//           "adJ_NOH_TIME": null,
//           "unit": sourceSummary.unit,
//           "desc": null,
//           "allow_edit": false,
//           "uid": sourceSummary.uid,
//           "createdBy": null,
//           "createdDate": null,
//           "modifiedBy": null,
//           "modifiedDate": null
//         },
//       );

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行updateTimesheetSummary Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行updateTimesheetSummary Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Timesheet/Summary/Create
//   Future<ApiResult> createTimesheetSummary(
//       PersonalTimesheetEmployee sourceTimesheet,
//       TimesheetSummary sourceSummary) async {
//     String apiUrl = timesheetSummaryCreate;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     logger.d("TimesheetSummary: ${sourceSummary.toJson()}");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         bodyData: {
//           "tS_ID": sourceTimesheet.uid,
//           "tA_CODE": sourceSummary.code,
//           "noh": sourceSummary.normal,
//           "adJ_NOH": sourceSummary.amended,
//           "noH_TIME": null,
//           "adJ_NOH_TIME": null,
//           "unit": sourceSummary.unit,
//           "desc": null,
//           "alloW_EDIT": true,
//           "uid": 0,
//           "createdBy": null,
//           "createdDate": null,
//           "modifiedBy": null,
//           "modifiedDate": null
//         },
//       );

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行updateTimesheetSummary Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行updateTimesheetSummary Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Timesheet/MSS/Approve
//   Future<ApiResult> doApproveTimesheet(
//       int empId, PersonalTimesheetEmployee sourceTimesheet) async {
//     String apiUrl = timesheetMSSApprove;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     logger.d("PersonalTimesheetEmployee: ${sourceTimesheet.toJson()}");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         bodyData: {
//           "supvEmpID": empId.toString(),
//           "tS_ID": sourceTimesheet.uid.toString(),
//           "clockstart": sourceTimesheet.clockStart,
//           "clockend": sourceTimesheet.clockEnd,
//           "approvestart": sourceTimesheet.approveStart,
//           "approveend": sourceTimesheet.approveEnd,
//           "tS_REMARK": sourceTimesheet.tsRemark,
//           "suP_STATUS": 1,
//           "suP_STATUS_DESC": sourceTimesheet.supStatusDesc,
//           "shifT_TYPE_ID": sourceTimesheet.shiftTypeID
//         },
//       );

//       if (response.statusCode == 200) {
//         logger
//             .d("執行doApproveTimesheet Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行updateTimesheetSummary Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Timesheet/MSS/Approve
//   Future<ApiResult> doApproveTimesheetF89(int empId,
//       PersonalTimesheetEmployee sourceTimesheet, int approveLevel) async {
//     String apiUrl = timesheetMSSApprove;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     logger.d("PersonalTimesheetEmployee: ${sourceTimesheet.toJson()}");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         bodyData: {
//           "supvEmpID": empId.toString(),
//           "tS_ID": sourceTimesheet.uid.toString(),
//           "clockstart": sourceTimesheet.clockStart,
//           "clockend": sourceTimesheet.clockEnd,
//           "approvestart": sourceTimesheet.approveStart,
//           "approveend": sourceTimesheet.approveEnd,
//           "tS_REMARK": sourceTimesheet.tsRemark,
//           "suP_STATUS": approveLevel,
//           "suP_STATUS_DESC": sourceTimesheet.supStatusDesc,
//           "shifT_TYPE_ID": sourceTimesheet.shiftTypeID
//         },
//       );

//       if (response.statusCode == 200) {
//         logger
//             .d("執行doApproveTimesheet Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行updateTimesheetSummary Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Employee/Schedule/GetCurrentPeriod/{empId}
//   Future<EmployeeSchedule> getEmployeeSchedule(int empId) async {
//     String apiUrl = employeeScheduleGetCurrentPeriod;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger
//             .d("執行getEmployeeSchedule Success with response: ${response.data}");
//         return EmployeeSchedule.fromJson(response.data);
//       } else {
//         return EmployeeSchedule();
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return EmployeeSchedule();
//     }
//   }

//   ///Employee/GetAssignedAssistant/{empId}/{TS_ID}
//   Future<List<AssignedAssistant>> getAssignedAssistantList(
//       int empId, int uid) async {
//     String apiUrl = employeeGetAssignedAssistant;
//     List<AssignedAssistant> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//         'TS_ID': uid.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getAssignedAssistantList Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(AssignedAssistant.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Timesheet/Details/{TS_ID}/{language}
//   Future<List<TimesheetDetail>> getTimesheetDetails(
//       int tsID, String language) async {
//     String apiUrl = timesheetDetails;
//     List<TimesheetDetail> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     logger.w('ts id $tsID'); 
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'TS_ID': tsID.toString(),
//         'language': language,
//       });
      
//       List<TimesheetDetail> notYetSort = List.empty(growable: true);
//       if (response.statusCode == 200) {
//         logger
//             .w("執行getTimesheetDetails Success with response: ${response.data}");
//         for (var element in response.data) {
//           notYetSort.add(TimesheetDetail.fromJson(element));
//           //dataList.add(TimesheetDetail.fromJson(element));
//         }
//         DateTime checkTime = DateTime.now();
//         List<int> alreadyUseIndex = [];
//         while (dataList.length != notYetSort.length) {
//           if (dataList.length == notYetSort.length - 1) {
//             for (var i = 0; i < notYetSort.length; i++) {
//               if (!alreadyUseIndex.contains(i)) {
//                 dataList.add(notYetSort[i]);
//                 break;
//               }
//             }
//             break;
//           }
//           for (var i = 0; i < notYetSort.length; i++) {
//             if (!alreadyUseIndex.contains(i)) {
//               checkTime = DateTime.parse(
//                   "${ParseTool.dateToYyyyMMdd(DateTime.now())} ${notYetSort[i].startTime}");
//               alreadyUseIndex.add(i);
//               break;
//             }
//           }
//           for (var i = 0; i < notYetSort.length; i++) {
//             if (!alreadyUseIndex.contains(i)) {
//               DateTime thisItemTime = DateTime.parse(
//                   "${ParseTool.dateToYyyyMMdd(DateTime.now())} ${notYetSort[i].startTime}");
//               if (checkTime.isAfter(thisItemTime)) {
//                 alreadyUseIndex.removeLast();
//                 alreadyUseIndex.add(i);
//                 checkTime = thisItemTime;
//               }
//             }
//           }
//           dataList.add(notYetSort[alreadyUseIndex.last]);
//         }

//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       Logger().w('Error message $stackTrace');
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Timesheet/DetailRecord/{TS_DetailID}/{language}
//   Future<TimesheetDetail> getAssistantWorkDetail(
//       int tsID, String language) async {
//     String apiUrl = timesheetDetailRecord;
//     Logger().i('tsID ${tsID} language ${language}');
//     logger.d("Call Api: $apiUrl");

//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'TS_DetailID': tsID.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.i(
//             "執行getAssistantWorkDetail Success with response: ${response.data}");
//         return TimesheetDetail.fromJson(response.data);
//       } else {
//         return TimesheetDetail();
//       }
//     } catch (exception, stackTrace) {
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return TimesheetDetail();
//       rethrow;
//     }
//   }

//   ///System/Transports/{language}
//   Future<List<SystemTransports>> getSystemTransports(String language) async {
//     String apiUrl = systemTransports;
//     List<SystemTransports> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger
//             .d("執行getSystemTransports Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SystemTransports.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Timesheet/Detail/Update
//   Future<ApiResult> updateTimesheetDetail(
//       TimesheetDetail sourceTimesheet) async {
//     String apiUrl = timesheetDetailUpdate;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     logger.d("Timesheet update payload:${sourceTimesheet.toJson()}");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         bodyData: sourceTimesheet.toJson(),
//       );
//       logger.d('update1 : ${response.toString()}');

//       if (response.statusCode == 200) {
//         // logger.d('update response/payload data: ${sourceTimesheet.toJson()}');

//         logger.d(
//             "執行updateTimesheetDetail Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行updateTimesheetDetail Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint("Error1 response data:${exception.response?.data}");
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Timesheet/DetailSummary/Update/:TS_DetailID
//   // Future<ApiResult> updateTimesheetDetailNew(
//   //     TimesheetDetail sourceTimesheet, TimesheetDetail oldTimesheet,
//   //     {double? updatedTravelAmount}) async {
//   //   String apiUrl =
//   //       'https://schindlerdev.hrotg.com/api/$timeSheetDetailSummaryUpdate';
//   //   int loginUserId = GetX.Get.put(SettingController()).userInfo2.userID;
//   //   ApiResult apiResult = ApiResult();
//   //   logger.d("Call Api: $apiUrl");
//   //   logger.d(
//   //       'update time new sourceTimesheet.amount:${sourceTimesheet.amount}= currentTimesheet.amount:${oldTimesheet.amount}');
//   //   try {
//   //     Map<String, dynamic> payload = {
//   //       "tS_D_ID": sourceTimesheet.uid,
//   //       "tA_CODE": 'TRA', //'sourceTimesheet.traCode',
//   //       "unit": sourceTimesheet.unit,
//   //       "noh": oldTimesheet.amount,
//   //       "adJ_NOH": updatedTravelAmount ?? sourceTimesheet.amount,
//   //       "uid": sourceTimesheet.traUid,
//   //       "createdBy": sourceTimesheet.createdBy,
//   //       "createdDate": sourceTimesheet.createdDate.toString(),
//   //       "modifiedBy": loginUserId,
//   //       "modifiedDate": DateTime.now().toString()
//   //     };
//   //     var response = await _call(apiUrl, HttpType.POST,
//   //         needAuth: true,
//   //         needSetBaseUrl: false,
//   //         pathData: {
//   //           "TS_DetailID": sourceTimesheet.uid.toString(),
//   //         },
//   //         bodyData: payload);
//   //     logger.d('update2.. ${response}');

//   //     if (response.statusCode == 200) {
//   //       logger.d(
//   //           "執行updateTimesheetDetail Success with response: ${response.data}");
//   //       apiResult.message = Constants.apiOK;
//   //       return apiResult;
//   //     } else {
//   //       logger.d(
//   //           "執行updateTimesheetDetail Success with response: ${response.data}");
//   //       return ApiResult.fromJson(response.data);
//   //     }
//   //   } on DioError catch (exception, stackTrace) {
//   //     await Sentry.captureException(
//   //       exception,
//   //       stackTrace: stackTrace,
//   //     );
//   //     print('Error2 ${exception.response?.statusCode}');
//   //     debugPrint(exception.response?.data);
//   //     return ApiResult.fromJson(exception.response?.data);
//   //   }
//   // }

//   ///Timesheet/Detail/Delete/{TSDetailID}
//   Future<ApiResult> deleteTimesheetDetail(int tsID) async {
//     String apiUrl = timesheetDetailDelete;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.DELETE,
//         needAuth: true,
//         pathData: {
//           "TSDetailID": tsID.toString(),
//         },
//       );

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行deleteTimesheetDetail Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行deleteTimesheetDetail Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       rethrow;
//       // return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Timesheet/Delete/{TS_ID}
//   Future<ApiResult> deleteTimesheet(int tsID) async {
//     String apiUrl = timesheetDelete;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.DELETE,
//         needAuth: true,
//         pathData: {
//           "TS_ID": tsID.toString(),
//         },
//       );

//       if (response.statusCode == 200) {
//         logger.d("執行deleteTimesheet Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d("執行deleteTimesheet Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApiResult.fromJson(exception.response?.data);
//     }
//   }

//   ///Timesheet/Detail/Create
//   Future<ApiResult> createTimesheetDetail(
//       TimesheetDetail sourceTimesheet) async {
//     String apiUrl = timesheetDetailCreate;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     logger.d("TimesheetDetail : ${sourceTimesheet.toJson()}");
//     //return apiResult;
//     try {
//       var response = await _call(
//         apiUrl,
//         HttpType.POST,
//         needAuth: true,
//         bodyData: sourceTimesheet.toJson(),
//       );

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行createTimesheetDetail Success with response: ${response.data}");
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         logger.d(
//             "執行updateTimesheetDetail Success with response: ${response.data}");
//         return ApiResult.fromJson(response.data);
//       }
//     } on DioError catch (e) {
//       debugPrint("Error: $e");
//       return ApiResult.fromJson(e.response?.data);
//     }
//   }

//   ///Employee/GetAssistant/{empId}/{TS_ID}
//   Future<List<AssignedAssistant>> getAssistantList(int empId, int uid) async {
//     String apiUrl = employeeGetAssistant;
//     List<AssignedAssistant> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//         'TS_ID': uid.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getAssistantList Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(AssignedAssistant.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Timesheet/CopyTimeSheetToAssistant/{TS_ID}/{AsstEmpID}
//   Future<List<TimesheetDetail>> copyTimesheetToAssistant(
//       int tsID, int asstEmpID) async {
//     String apiUrl = timesheetCopyToAssistant;
//     List<TimesheetDetail> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'TS_ID': tsID.toString(),
//         'AsstEmpID': asstEmpID.toString(),
//       });

//       List<TimesheetDetail> notYetSort = List.empty(growable: true);
//       if (response.statusCode == 200) {
//         logger.d(
//             "執行copyTimesheetToAssistant Success with response: ${response.data}");
//         for (var element in response.data) {
//           notYetSort.add(TimesheetDetail.fromJson(element));
//         }
//         DateTime checkTime = DateTime.now();
//         List<int> alreadyUseIndex = [];
//         while (dataList.length != notYetSort.length) {
//           if (dataList.length == notYetSort.length - 1) {
//             for (var i = 0; i < notYetSort.length; i++) {
//               if (!alreadyUseIndex.contains(i)) {
//                 dataList.add(notYetSort[i]);
//                 break;
//               }
//             }
//             break;
//           }
//           for (var i = 0; i < notYetSort.length; i++) {
//             if (!alreadyUseIndex.contains(i)) {
//               checkTime = DateTime.parse(
//                   "${ParseTool.dateToYyyyMMdd(DateTime.now())} ${notYetSort[i].startTime}");
//               alreadyUseIndex.add(i);
//               break;
//             }
//           }
//           for (var i = 0; i < notYetSort.length; i++) {
//             if (!alreadyUseIndex.contains(i)) {
//               DateTime thisItemTime = DateTime.parse(
//                   "${ParseTool.dateToYyyyMMdd(DateTime.now())} ${notYetSort[i].startTime}");
//               if (checkTime.isAfter(thisItemTime)) {
//                 alreadyUseIndex.removeLast();
//                 alreadyUseIndex.add(i);
//                 checkTime = thisItemTime;
//               }
//             }
//           }
//           dataList.add(notYetSort[alreadyUseIndex.last]);
//         }

//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Employee/MSS/SubOrdinate/Profile/{empId}
//   Future<List<SubOrdinateProfile>> getSubOrdinateProfiles(int empId) async {
//     String apiUrl = employeeMssSubOrdinateProfile;
//     List<SubOrdinateProfile> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getSubOrdinateProfiles Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(SubOrdinateProfile.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Timesheet/GetApprLevel/{EmpId}/{language}
//   Future<ApprovalLevel> getApprovalLevel(int empId, String language) async {
//     String apiUrl = timesheetGetApprovalLevel;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpId': empId.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getApprovalLevel Success with response: ${response.data}");
//         return ApprovalLevel.fromJson(response.data);
//       } else {
//         return ApprovalLevel();
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return ApprovalLevel();
//     }
//   }

//   ///Employee/GetLatestPayslip/{EmpID}/{language}
//   Future<List<EmployeePayCycleHr>> getLatestPayslip(
//       int empId, String language) async {
//     String apiUrl = employeeLatestPayslip;
//     List<EmployeePayCycleHr> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getLatestPayslip Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(EmployeePayCycleHr.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Employee/GetYearParameter/{EmpID}/{language}/{fileType}
//   Future<List<YearParameter>> getYearParameter(
//       int empId, String language, String fileType) async {
//     String apiUrl = employeeYearParameter;
//     List<YearParameter> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(apiUrl, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'EmpID': empId.toString(),
//             'language': language,
//             'fileType': fileType
//           });

//       if (response.statusCode == 200) {
//         logger.d("執行getYearParameter Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(YearParameter.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return dataList;
//     }
//   }

//   ///Employee/GetPayslipByYear/{EmpID}/{Year}/{language}
//   Future<List<EmployeePayCycleHr>> getPayslipByYear(
//       int empId, String year, String language) async {
//     String apiUrl = employeePayslipByYear;
//     List<EmployeePayCycleHr> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//         'Year': year,
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getPayslipByYear Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(EmployeePayCycleHr.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   ///Attachment/GetEmpPayslip/{empId}/{payCycleDetailID}/{language}
//   Future<ApiResult> getAttachmentOfEmpPayslip(
//       int empId, int payCycleDetailID, String language) async {
//     String apiUrl = attachmentEmpPayslip;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId.toString(),
//         'payCycleDetailID': payCycleDetailID.toString(),
//         'language': language
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getAttachmentOfEmpPayslip Success with response: ${response.data}");
//         apiResult.message = Attachment.fromJson(response.data).attachment;
//         return apiResult;
//       } else {
//         apiResult.statusCode = response.statusCode!;
//         return apiResult;
//       }
//     } on DioError catch (e) {
//       debugPrint("Error: $e");
//       apiResult = ApiResult.fromJson(e.response?.data);
//       apiResult.statusCode = e.response!.statusCode!;
//       return apiResult;
//     }
//   }

//   ///Attachment/GetEmpIRD/{empId}/{Year}/{language}
//   Future<ApiResult> getAttachmentOfEmpIRD(
//       int empId, int year, String language) async {
//     String apiUrl = attachmentEmpIRD;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(apiUrl, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'empId': empId.toString(),
//             'Year': year.toString(),
//             'language': language
//           });

//       if (response.statusCode == 200) {
//         logger.d(
//             "執行getAttachmentOfEmpIRD Success with response: ${response.data}");
//         apiResult.message = Attachment.fromJson(response.data).attachment;
//         return apiResult;
//       } else {
//         apiResult.statusCode = response.statusCode!;
//         return apiResult;
//       }
//     } on DioError catch (e) {
//       debugPrint("Error: $e");
//       apiResult = ApiResult.fromJson(e.response?.data);
//       apiResult.statusCode = e.response!.statusCode!;
//       return apiResult;
//     }
//   }

//   ///Employee/GetIRDByYear/{EmpID}/{Year}/{language}
//   Future<YearParameter> getIRDByYear(
//       int empId, int year, String language) async {
//     String apiUrl = irdByYear;
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(apiUrl, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'EmpID': empId.toString(),
//             'Year': year.toString(),
//             'language': language
//           });

//       if (response.statusCode == 200) {
//         logger.d("執行getIRDByYear Success with response: ${response.data}");
//         return YearParameter.fromJson(response.data);
//       } else {
//         return YearParameter();
//       }
//     } on DioError catch (e) {
//       debugPrint("Error: $e");
//       return YearParameter();
//     }
//   }

//   ///MEUser/Disable/{EmpID}/{language}
//   Future<ApiResult> doDeleteAccount(int empId, String language) async {
//     String apiUrl = deleteAccount;
//     ApiResult apiResult = ApiResult();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response = await _call(apiUrl, HttpType.POST,
//           needAuth: true,
//           pathData: {'EmpID': empId.toString(), 'language': language});

//       if (response.statusCode == 200) {
//         logger.d("執行doDeleteAccount Success with response: ${response.data}");
//         ApiResult apiResult = ApiResult();
//         apiResult.message = Constants.apiOK;
//         return apiResult;
//       } else {
//         apiResult.statusCode = response.statusCode!;
//         return apiResult;
//       }
//     } on DioError catch (e) {
//       debugPrint("Error: $e");
//       apiResult = ApiResult.fromJson(e.response?.data);
//       apiResult.statusCode = e.response!.statusCode!;
//       return apiResult;
//     }
//   }

//   ///Home/NewDashboard/{EmpID}/{FuncId}/{isMobile}/{language}
//   Future<List<NewDashboard>> getNewDashboard(
//       int empId, int funcId, bool isMobile, String language) async {
//     String apiUrl = homeNewDashboard;
//     List<NewDashboard> dataList = List.empty(growable: true);
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//         'FuncId': funcId.toString(),
//         'isMobile': isMobile.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("執行getNewDashboard Success with response: ${response.data}");
//         for (var element in response.data) {
//           dataList.add(NewDashboard.fromJson(element));
//         }
//         return dataList;
//       } else {
//         return dataList;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   // * new flow using repository and retrofit dio
//   ///Home/NewDashboard/{EmpID}/{FuncId}/{isMobile}/{language}
//   Future<List<NewDashboard>> getNewDashboardNew(
//       int empId, int funcId, bool isMobile, String language) async {
//     List<NewDashboard> dataList = [];
//     try {
//       bool netResult = await _checkNetWork();
//       if (!netResult) {
//         return dataList;
//       }
//       var response = await dashboardRepository.getDashboardList(
//           empId: empId, funcId: funcId, isMobile: isMobile, language: language);

//       for (var element in response) {
//         dataList.add(NewDashboard.fromJson(element.toJson()));
//       }
//       return dataList;
//     } on DioError catch (exception) {
//       if (exception.response?.statusCode == 401) {
//         GetX.Get.put(SettingController()).clearLoginInfo();
//         GetX.Get.offAndToNamed("/F01");
//       }
//       return dataList;
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   Future<NotificationCount> getNotificationCount(
//       {required int empId, required String language}) async {
//     String apiUrl = notificaitonCount;
//     NotificationCount dataNotification = NotificationCount();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//         'language': language,
//       });

//       if (response.statusCode == 200) {
//         logger.d("getNewNotification Success with response: ${response.data}");

//         dataNotification = NotificationCount.fromJson(response.data);
//         return dataNotification;
//       } else {
//         return dataNotification;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint("Error get notification count: $exception");
//       return dataNotification;
//     }
//   }

//   Future<NotificationCount> readAllNotification({required int empId}) async {
//     String apiUrl = reaAllNotification;
//     NotificationCount dataNotification = NotificationCount();
//     logger.d("Call Api: $apiUrl");
//     try {
//       var response =
//           await _call(apiUrl, HttpType.GET, needAuth: true, pathData: {
//         'EmpID': empId.toString(),
//       });

//       if (response.statusCode == 200) {
//         logger.d(
//             "getReadAllNotification Success with response: ${response.data}");
//         dataNotification = NotificationCount(isSuccessful: true);
//         return dataNotification;
//       } else {
//         return dataNotification;
//       }
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       debugPrint("Error get notification count: $exception");
//       return dataNotification;
//     }
//   }

//   //{{base_url}}/MEUser/GetUserSetting/{empID}
//   Future<List<UserSetting>> getUserSettings(int empId) async {
//     List<UserSetting> dataList = [];
//     try {
//       bool netResult = await _checkNetWork();
//       if (!netResult) {
//         return dataList;
//       }
//       return await settingsRepository.getUserSetting(userId: empId.toString());
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   //Balance/Employee/{empId}/{language}
//   Future<List<Balance>> getBalanceEmployee(
//       String empId, String language) async {
//     List<Balance> dataList = [];
//     try {
//       Logger().i("Balance/Employee/{empId}/{language}==${empId}");
//       bool netResult = await _checkNetWork();
//       if (!netResult) {
//         return dataList;
//       }
//       return await leaveRepository.getBalance(
//           userId: empId, language: language);
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return dataList;
//     }
//   }

//   //Leave/Taken/{EmpId}/{LeaveType}/{Year}
//   Future<LeaveTakenNew> getLeaveTaken(
//       String empId, String leaveType, String year) async {
//     try {
//       bool netResult = await _checkNetWork();
//       if (!netResult) {
//         return LeaveTakenNew();
//       }
//       return await leaveRepository.getLeaveTaken(
//           userId: empId, leaveType: leaveType, year: year);
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return LeaveTakenNew();
//     }
//   }

//   //{{url_base}}/items/push_notification_test
//   Future<DerpDeviceToken> registrationDeviceTokenToDerp(
//       String deviceToken, String appType) async {
//     try {
//       bool netResult = await _checkNetWork();
//       if (!netResult) {
//         return DerpDeviceToken();
//       }
//       DerpDeviceToken result =
//           await settingsRepository.registrationDeviceTokenToDerp(
//               deviceToken: deviceToken, appType: appType);
//       return result;
//     } on DioError catch (e) {
//       debugPrint("Error: $e");
//       return DerpDeviceToken();
//     } catch (e) {
//       return DerpDeviceToken();
//     }
//   }

//   // For Timesheet service
//   // /Employee/PayCycle/{empId}
//   Future<List<PayCycle>> getPayCycleData(String empId) async {
//     try {
//       _checkNetWork();
//       var response = await _call(EMPLOYEE_PAY_CYCLE, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'empId': empId,
//           });
//       String parsedjson = json.encode(response.data);
//       final List<dynamic> parsedData = jsonDecode(parsedjson);
//       final payCycleList =
//           parsedData.map((it) => PayCycle.fromJson(it)).toList();
//       return payCycleList;
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(exception, stackTrace: stackTrace);
//       return [];
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(exception, stackTrace: stackTrace);

//       return [];
//     }
//   }

// // /Employee/Schedule/GetCurrentPeriod/{empId}
//   Future<List<TimesheetEmployee>> getTimesheetEmployeeData(String empId) async {
//     try {
//       _checkNetWork();
//       List<TimesheetEmployee> resultList = [];
//       List<Map<String, dynamic>> map = [];
//       var response = await _call(EMPLOYEE_SCHEDULE, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'empId': empId,
//           });

//       map = List<Map<String, dynamic>>.from(response.data);
//       for (var element in map) {
//         resultList.add(TimesheetEmployee.fromJson(element));
//       }
//       return resultList;
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(exception, stackTrace: stackTrace);
//       return [];
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(exception, stackTrace: stackTrace);
//       return [];
//     }
//   }

// // Schedule/Data/{empId}/{schStart}/{schEnd}/{language}
//   Future<List<EmployeeDetails>> getScheduleData(
//       String empId, String schStart, String schEnd, String language) async {
//     try {
//       _checkNetWork();
//       var response = await _call(SCHEDULE_DATA_URL, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'empId': empId,
//             'schStart': schStart,
//             'schEnd': schEnd,
//             'language': language
//           });

//       // debugPrint("RESPONSE ${response.data}");

//       String parsedjson = json.encode(response.data);
//       final List<dynamic> parsedData = jsonDecode(parsedjson);

//       final employeeDetails =
//           parsedData.map((it) => EmployeeDetails.fromJson(it)).toList();

//       final filteredEmployees =
//           employeeDetails.where((it) => it.shiftType != null).toList();

//       return filteredEmployees;
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(exception, stackTrace: stackTrace);

//       return [];
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(exception, stackTrace: stackTrace);

//       return [];
//     }
//   }

//   //Calendar service
//   // System/Code/PERSONAL_CALENDAR/EN
//   Future<List<SystemColourCode>> retrieveSystemColour() async {
//     try {
//       _checkNetWork();

//       var response = await _call(
//         SYS_COLOR_CODE_URL,
//         HttpType.GET,
//         needAuth: true,
//       );

//       List<SystemColourCode> resultList = [];
//       List<Map<String, dynamic>> map = [];
//       map = List<Map<String, dynamic>>.from(response.data);

//       for (var element in map) {
//         resultList.add(SystemColourCode.fromJson(element));
//       }

//       return resultList;
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(exception, stackTrace: stackTrace);
//       return [];
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(exception, stackTrace: stackTrace);
//       return [];
//     }
//   }

// // Schedule/Data/{empId}/{schStart}/{schEnd}/{language}
//   Future<List<Event>> retrieveLeaveStatus(
//       String empId, String schStart, String schEnd, String language) async {
//     _checkNetWork();

//     try {
//       var response = await _call(CALENDAR_SCHEDULE_DATA_URL, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'empId': empId,
//             'schStart': schStart,
//             'schEnd': schEnd,
//             'language': language
//           });

//       String parsedjson = json.encode(response.data);
//       final List<dynamic> parsedData = jsonDecode(parsedjson);
//       final employeeDetails =
//           parsedData.map((it) => EmployeeDetails.fromJson(it)).toList();

//       final filteredEmployees =
//           employeeDetails.where((it) => it.startTime != null);
//       //  .where((it) => it.leaveTypeID != null && it.startTime != null);

//       return filteredEmployees
//           .map((e) => Event(
//                 date: e.startTime!,
//                 leaveTypeID: e.leaveTypeID ?? 0,
//                 shiftTypeDesc: e.shiftTypeDesc ?? '',
//                 shiftTypeColorCode: e.shiftType!.color,
//                 leaveTypeColorCode:
//                     e.leaveType == null ? "" : e.leaveType!.color,
//               ))
//           .toList();
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return [];
//     }
//   }

// //DEAD CODE
//   Future<List<String>> retrieveLeaveBalance(String empId) async {
//     _checkNetWork();
//     try {
//       var response = await _call(CALENDAR_SCHEDULE_DATA_URL, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'empId': empId,
//           });

//       cs.LeaveBalance leaveBalance = cs.LeaveBalance.fromJson(response.data);
//       final prefs = await SharedPreferences.getInstance();
//       final String? empID = prefs.getString("empID");
//       String? taken = await retrieveLeaveTakenInfo(
//           empID!, "AL", DateTime.now().year.toString());
//       List<String> listLeave = [];
//       // listLeave.add(empID.toString());
//       final leaveOpening = leaveBalance.leaveOpening;
//       if (leaveOpening != null) {
//         listLeave.add(leaveOpening.toStringAsFixed(2));
//       }
//       final leaveEntitlement = leaveBalance.leaveEntitlement;
//       if (leaveEntitlement != null) {
//         listLeave.add(leaveEntitlement.toStringAsFixed(2));
//       }

//       listLeave.add(taken!);
//       double closingBalance = leaveBalance.leaveOpening! +
//           leaveBalance.leaveEntitlement! -
//           double.parse(taken);
//       listLeave.add(closingBalance.toStringAsFixed(2));

//       return listLeave;
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return [];
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return [];
//     }
//   }

//   Future<String?> retrieveLeaveTakenInfo(
//       String empId, String leaveType, String currentYear) async {
//     _checkNetWork();
//     try {
//       var response = await _call(LEAVE_TAKEN_URL, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'empId': empId,
//             'leaveType': leaveType,
//             'currentYear': currentYear
//           });

//       LeaveTaken leaveTaken = LeaveTaken.fromJson(response.data);

//       debugPrint(leaveTaken.taken.toString());
//       return leaveTaken.taken?.toStringAsFixed(2);
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//     }
//   }

//   Future<List<String>> getOvertimeList(String empId) async {
//     _checkNetWork();

//     try {
//       var response =
//           await _call(OVERTIME_URL, HttpType.GET, needAuth: true, pathData: {
//         'empId': empId,
//       });

//       Overtime o = Overtime.fromJson(response.data);
//       List<String> overtimeList = [];

//       // overtimeList.add(o.empID.toString());
//       overtimeList.add(o.opening.toString());
//       overtimeList.add(o.actualOT.toString());

//       return overtimeList;
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return [];
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return [];
//     }
//   }

//   Future<List<String>> retrieveSubordinateSummary(
//       String empId, String schDate) async {
//     _checkNetWork();
//     try {
//       var response = await _call(SCHEDULE_SUBORDINATE_SUMMARY, HttpType.GET,
//           needAuth: true, pathData: {'empId': empId, 'schDate': schDate});

//       SubordinateSummary o = SubordinateSummary.fromJson(response.data);
//       List<String> subordinateSummaryList = [];

//       List<String> overtimeList = [];
//       // API TAKEN
//       // debugPrint(o.empID);

//       debugPrint(o.item1!.numOfWorkShift.toString());
//       debugPrint(o.item1!.numOfOnLeave.toString());
//       debugPrint(o.item1!.numOfHalfDay.toString());
//       overtimeList.add(o.item1!.numOfOnLeave.toString());
//       overtimeList.add(o.item1!.numOfWorkShift.toString());
//       overtimeList.add(o.item1!.numOfHalfDay.toString());

//       return overtimeList;
//     } on DioError catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return [];
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//       return [];
//     }
//   }

//   Future<List<SubordinateDetail>> retrieveSubordinateDetail(
//       String empId, String schDate, int num, String language) async {
//     try {
//       // debugPrint(
//       //     "$url${env.SCHEDULE_SUBORDINATE_DETAIL}/$empId/$schDate/$num/$language");

//       //_checkNetWork();
//       var response = await _call(SCHEDULE_SUBORDINATE_DETAIL, HttpType.GET,
//           needAuth: true,
//           pathData: {
//             'empId': empId,
//             'num': num.toString(),
//             'language': language,
//             'schDate': schDate
//           });

//       debugPrint("RESPONSE ${response.data}");

//       String parsedjson = json.encode(response.data);
//       final List<dynamic> parsedData = jsonDecode(parsedjson);

//       final subordinateDetail =
//           parsedData.map((it) => SubordinateDetail.fromJson(it)).toList();

//       return subordinateDetail;
//     } catch (exception, stackTrace) {
//       rethrow;
//       // await Sentry.captureException(
//       //   exception,
//       //   stackTrace: stackTrace,
//       // );
//       // return [];
//     }
//   }
// }
