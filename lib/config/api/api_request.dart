import 'dart:async';
import 'package:dio/dio.dart';

const methodTypes = <String>[
  "get",
  "post",
  "put",
  "delete",
];

class ApiRequest {
  final String methodType;
  final String endpoint;
  final dynamic data;
  final Dio _dio = Dio();
  final _loadingController = StreamController<bool>();

  Stream<bool> get loading => _loadingController.stream;

  ApiRequest(
      {required this.methodType, required this.endpoint, required this.data})
      : assert(
            methodTypes.contains(methodType), "Metodo invalido: $methodType ");

  Future<Response> request() async {
    _loadingController.add(true);
    final methods = {
      'get': _dio.get,
      'post': _dio.post,
      'put': _dio.put,
      'delete': _dio.delete
    };

    try {
      Response response = await methods[methodType]!(
          'https://cuptapapi.onrender.com/v1$endpoint',
          data: data);
      _loadingController.add(false);
      return response;
    } catch (e) {
      _loadingController.add(false);
      rethrow;
    }
  }
}
