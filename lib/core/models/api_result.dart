class ApiResult {
  String message;
  int statusCode;

  ApiResult({
    this.message = "",
    this.statusCode = 200
  });

  static ApiResult fromJson(json) {
    if(json.toString() == "Internal Server Error"){
      return ApiResult(statusCode: 500);
    }
    return ApiResult(
      message: json['message'] ?? "",
    );
  }

  /*
  ApiResult.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }*/

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
