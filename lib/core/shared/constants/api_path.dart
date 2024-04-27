class ApiPath {
  // NOTIFICATION
  static const String notificationList = "Employee/GetEmpNotification/{EmpID}/{language}";
  static const String getContactInfo = "System/Code/HROTG_APP/{language}";
  // DASHBOARD
  static const String dashboardList = "Home/NewDashboard/{EmpID}/{FuncId}/{isMobile}/{language}";
  // USER SETTING
  static const String userSetting = "MEUser/GetUserSetting/{empID}";
  // LEAVE BALANCE
  static const String leaveBalance = "Balance/Employee/{empId}/{language}";
  // LEAVE TAKEN
  static const String leaveTaken = "Leave/Taken/{EmpId}/{LeaveType}/{Year}";
  // REGISTRATION DEVICE TOKEN TO DERP
  static const String deviceTokenToDerp = "items/push_notification_test";
}
