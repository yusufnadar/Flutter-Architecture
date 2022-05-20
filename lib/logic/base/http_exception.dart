import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_project/logic/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HttpException implements Exception {
  final String? _message;
  final String? _prefix;

  HttpException([this._message, this._prefix]);

  @override
  toString() {
    return '$_prefix/$_message';
  }

  static handleException(request) async {
    http.Response response = await request;
    return responseHandle(response);
  }

  static responseHandle(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(json.decode(response.body)['message'].toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 500:
      default:
      throw BadRequestException(response.body.toString());
    }
  }
}

class FetchDataException extends HttpException {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request");
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised");
}

class InvalidInputException extends HttpException {
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}
