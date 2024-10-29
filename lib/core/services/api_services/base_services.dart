import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_package/flutter_package.dart';

class BaseServices {
  final Dio _dio = Dio();

  String path = "";
  String token = "";
  Map<String, String>? headers;

  initBaseServices() async {
    LogUtility.writeLog("Header : ${jsonEncode(headers)}");

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            return handler.resolve(Response(
              requestOptions: e.requestOptions,
              data: e.response?.data ??
                  {
                    "data": null,
                    "status": {
                      "code": 401,
                      "message": "Unauthorized access.",
                    },
                  },
              statusCode: 401,
            ));
          }
          if (e.response?.statusCode == 404) {
            return handler.resolve(Response(
              requestOptions: e.requestOptions,
              data: e.response?.data ??
                  {
                    "data": null,
                    "status": {
                      "code": 404,
                      "message": "not found",
                    },
                  },
              statusCode: 401,
            ));
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> postApi<T>(
      {required Map<String, dynamic> params, required String endpoint}) async {
    await initBaseServices();

    LogUtility.writeLog("$path$endpoint Request : ${jsonEncode(params)}");

    try {
      var response = await Dio().post(
        "$path$endpoint",
        data: params,
        options: Options(
          headers: headers,
        ),
      );

      LogUtility.writeLog(
          "$path$endpoint Response : ${jsonEncode(response.data)}");

      return response;
    } on DioException catch (e) {
      LogUtility.writeLog(
          "$path$endpoint Response : ${jsonEncode(e.response)}");

      LogUtility.writeLog("Dio Error : $e");
      return e.response!;
    } catch (e) {
      LogUtility.writeLog("$path$endpoint Response : $e");
      rethrow;
    }
  }
}
