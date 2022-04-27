import 'dart:convert';

// import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:tarjetas/app/core/core_data/models/api_response.dart';

abstract class IApiCliente {
  Future<ApiResponseModel> get({
    required String file,
  });
}

class HttpCliente implements IApiCliente {
  @override
  Future<ApiResponseModel> get({
    required String file,
  }) async {
    final response = await rootBundle.loadString('assets/jsons/$file');
    final decodedJson = jsonDecode(response);
    return ApiResponseModel.fromJson(decodedJson);
  }
}
