import 'package:dio/dio.dart';

import 'dio_service.dart';

class DioServiceImpl implements DioService {
  @override
  Dio getDio() {
    return Dio(BaseOptions(
      baseUrl: 'https://api.github.com/',
    ));
  }
}
