import 'dart:convert';

import 'package:flutter_clean_project/constants/api.dart';
import 'package:flutter_clean_project/logic/base/http_exception.dart';
import 'package:http/http.dart' as http;

class Method {
  String? _endPoint;
  Map<String, dynamic>? _body;
  final Map<String, Function> _methods = {
    'get': http.get,
    'post': http.post,
    'put': http.put,
    'delete': http.delete
  };

  Method setEndPoint(endPoint) {
    _endPoint = endPoint;
    return this;
  }

  Method setBody(body) {
    _body = body;
    return this;
  }

  Future method(methodName, {token}) async {
    Map<Symbol, dynamic> list = {};
    list = {const Symbol('headers'): {'Content-Type':'application/json','Authorization':'Bearer $token'}};
    if (_body != null) {
      list.addAll({const Symbol('body'): json.encode(_body)});
    }
    return HttpException.handleException(
      Function.apply(
          _methods[methodName]!, [Uri.parse(baseUrl + _endPoint!)], list),
    );
  }
}
