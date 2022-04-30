class ApiResponseModel {
  ApiResponseModel({
    required this.status,
    required this.payload,
  });

  bool status;
  dynamic payload;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      ApiResponseModel(
        status: json["status"],
        payload: json["payload"],
      );
}
