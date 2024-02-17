import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:itine/presentation/controllers/request/request_controller.dart';

class Logger extends Interceptor {
  final RequestController _requestController =
      getx.Get.find<RequestController>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('--------------------------------------------------');
    log('[DIO REQUEST]: ${options.method} ${options.baseUrl + options.path}');
    log('[REQUEST AUTHORIZATION]: ${options.headers['Authorization']}');
    log('--------------------------------------------------');

    _requestController.isLoading.value = true;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('--------------------------------------------------');
    log('[DIO RESPONSE] ${response.statusCode} => PATH: ${response.requestOptions.path}');
    log('--------------------------------------------------');

    _requestController.isLoading.value = false;

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('--------------------------------------------------');
    log('[DIO ERROR] ${err.response?.statusCode.toString()} => PATH: ${err.requestOptions.path}');
    log(err.response?.data['message'] ?? 'An unhandled error occured.');
    getx.Get.showSnackbar(
      getx.GetSnackBar(
        message: err.response?.data['message'] ?? 'Une erreur est survenue.',
        borderRadius: 50,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red.shade300,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      ),
    );

    _requestController.isLoading.value = false;

    log('--------------------------------------------------');

    super.onError(err, handler);
  }
}
