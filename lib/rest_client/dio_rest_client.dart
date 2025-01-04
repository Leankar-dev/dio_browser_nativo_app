import 'package:dio/dio.dart';
// import 'package:dio_browser_nativo_app/rest_client/dio_nativ.dart';
import 'dio_nativ.dart' if (dart.library.html) 'dio_browser.dart';

class DioRestClient extends BaseDio {
  DioRestClient()
      : super(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
          ),
        ) {
    options.baseUrl = 'https://viacep.com.br/ws';
  }
}

