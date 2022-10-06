import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/utils/commen.dart';

class Apiclient {
  static Dio? dio;

  Apiclient._();

  static Apiclient? _instance;

  static Apiclient? get instance {
    dio = Dio();

    _instance ??= Apiclient._();
    return _instance;
  }

  Future<dynamic> get(
      {required String url,
      required BuildContext context,
      Map<String, dynamic>? prams,
      required Map<String, dynamic> body}) async {
    dio!.options.headers["Content-Type"] = "application/json";
    dio!.options.headers["Accept"] = "application/json";
    dio!.options.connectTimeout = 30000;
    print("Api => $url");
    print("Api => $prams");

    try {
      Response response = await dio!.get(url, queryParameters: prams ?? {});
      log("Response1111111 => ${response.data}");
      return response.data;
    } on DioError catch (e) {
      log("Response222 => ${e.response}");
      switch (e.type) {
        case DioErrorType.connectTimeout:
          {
            //  ExceptionsSnackbar.somethingWent(message: e.message);

            toast(e.message);
            throw Exception();
          }
        case DioErrorType.sendTimeout:
          {
            // ExceptionsSnackbar.somethingWent(message: e.message);
            toast(e.message);
            throw Exception();
          }
        case DioErrorType.receiveTimeout:
          {
            //  ExceptionsSnackbar.somethingWent(message: e.message);
            toast(e.message);
            throw Exception();
          }
        case DioErrorType.response:
          {
            toast(e.response?.data['message']);
            // ExceptionsSnackbar.responseError(message: e.response!.data['message'], error: e.response!);
            throw Exception();
          }
        case DioErrorType.cancel:
          {
            toast(e.message);
            // ExceptionsSnackbar.somethingWent(message: e.message);
            throw Exception();
          }
        case DioErrorType.other:
          {
            toast("Internet Error");
            // ExceptionsSnackbar.noInternet();
            throw Exception();
          }
      }
    }
  }



  Future<dynamic> getSports(
      {required String url,
        required BuildContext context,
        Map<String, dynamic>? prams,
        required Map<String, dynamic> body}) async {
    dio!.options.headers["Content-Type"] = "application/json";
    dio!.options.headers["Accept"] = "application/json";
   // dio!.options.headers["X-RapidAPI-Key"] = "1bcfb7144amshd72b4d50e461425p12e6a6jsnfdb51d63eb88";
    //dio!.options.headers["X-RapidAPI-Key"] = "eae7178a8fmshe35eac387bfc7f8p14be32jsnf393c46ecc97"; //DK
    dio!.options.headers["X-RapidAPI-Key"] = "fef39838a0mshc76f220c77521bcp10d45ajsn681b861bcd95";
    dio!.options.headers["X-RapidAPI-Host"] = "allsportsapi2.p.rapidapi.com";
    dio!.options.connectTimeout = 30000;
    print("Api => $url");
    print("Api => $prams");

    try {
      Response response = await dio!.get(url, queryParameters: prams ?? {});
     // print("ResponseApi => ${response.data}");
      log("ResApiClient => ${response.data}");
      return response.data;
    } on DioError catch (e) {
      print("ResApiClient catch => ${e.response}");
      switch (e.type) {
        case DioErrorType.connectTimeout:
          {
            //  ExceptionsSnackbar.somethingWent(message: e.message);

            toast(e.message);
            throw Exception();
          }
        case DioErrorType.sendTimeout:
          {
            // ExceptionsSnackbar.somethingWent(message: e.message);
            toast(e.message);
            throw Exception();
          }
        case DioErrorType.receiveTimeout:
          {
            //  ExceptionsSnackbar.somethingWent(message: e.message);
            toast(e.message);
            throw Exception();
          }
        case DioErrorType.response:
          {
            toast(e.response?.data['message']);
            // ExceptionsSnackbar.responseError(message: e.response!.data['message'], error: e.response!);
            throw Exception();
          }
        case DioErrorType.cancel:
          {
            toast(e.message);
            // ExceptionsSnackbar.somethingWent(message: e.message);
            throw Exception();
          }
        case DioErrorType.other:
          {
            toast("Internet Error");
            // ExceptionsSnackbar.noInternet();
            throw Exception();
          }
      }
    }
  }

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      required BuildContext context}) async {
    Dio? _dio = Dio();

    var formData = FormData.fromMap(body);
    print("Api => $url");
    print("RequestBody => $body");
    print("RequestToken => ${MyApp.box.read("token")}");

    _dio.options.headers["x-access-token"] =
        MyApp.box.read("token") != null ? MyApp.box.read("token") : "";
    //  _dio.options.headers["x-access-token"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjJmMjY1MzM1NThhZDRhZDE0ODVkMjAyIn0sImlhdCI6MTY2MDA1MjgwMywiZXhwIjoxNjYwMDYyODAzfQ.naD68j9Hb3fMfXSQS6qJdliuzYVnbZ4qMUGDxJJzPEM";

    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.headers["Accept"] = "application/json";
    _dio.options.connectTimeout = 30000;

    try {
      Response response = await _dio.post(url, data: formData);
      log("Response1111 => ${response}");
      //  toast("${response}");
      return response.data;
    } on DioError catch (e) {
      log("error1 => ${e.response}");
      //toast("${e.response}");
      // toast("error2 => ${e.response}");

      switch (e.type) {
        case DioErrorType.connectTimeout:
          {
            //  ExceptionsSnackbar.somethingWent(message: e.message);

            toast(e.message);
            throw Exception();
          }
        case DioErrorType.sendTimeout:
          {
            // ExceptionsSnackbar.somethingWent(message: e.message);
            toast(e.message);
            throw Exception();
          }
        case DioErrorType.receiveTimeout:
          {
            //  ExceptionsSnackbar.somethingWent(message: e.message);
            toast(e.message);
            throw Exception();
          }
        case DioErrorType.response:
          {
            toast(e.response?.data['message']);
            // ExceptionsSnackbar.responseError(message: e.response!.data['message'], error: e.response!);
            throw Exception();
          }
        case DioErrorType.cancel:
          {
            toast(e.message);
            // ExceptionsSnackbar.somethingWent(message: e.message);
            throw Exception();
          }
        case DioErrorType.other:
          {
            toast("Internet Error");
            // ExceptionsSnackbar.noInternet();
            throw Exception();
          }
      }
    }
  }

  Future<dynamic> imageUpload({
    required String url,
    required Map<String, dynamic> body,
    required BuildContext context,
    required String fPath,
    required String fName,
  }) async {
    Dio? _dio = Dio();
    //var formData = FormData.fromMap(body);
    print("token");
    print(MyApp.box.read("token"));
    _dio.options.headers["x-access-token"] =
        MyApp.box.read("token") != null ? MyApp.box.read("token") : "";
    _dio.options.headers["Content-Type"] = "*/*";
    _dio.options.headers["Accept"] = "*/*";
    _dio.options.connectTimeout = 30000;

    FormData formData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(fPath, filename: fName),
    });
    try {
      dio?.post(url, data: formData);
    } catch (e) {
    } finally {}
  }
}
