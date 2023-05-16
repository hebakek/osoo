import 'package:dio/dio.dart';
import 'package:osoo/response/pokemon_response.dart';
import 'package:osoo/utils/string/strings.dart';

class HomeApiProvider {
  Dio _dio = Dio();

  VoteApiProvider() {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      _dio.interceptors.requestLock.lock();

      _dio.interceptors.requestLock.unlock();
      //  options.headers["Content-Type"] = "application/json";
      return handler.next(options);
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response);
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e);
    }));
  }

  Future<PokemonResponse> getPokemonList() async {
    Response response;

    try {
      _dio.interceptors.clear();
      _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        // Do something before request is sent
        _dio.interceptors.requestLock.lock();

        _dio.interceptors.requestLock.unlock();
        //  options.headers["Content-Type"] = "application/json";
        return handler.next(options);
      }, onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response);
      }, onError: (DioError e, handler) {
        // Do something with response error
        return handler.next(e);
      }));

      String url = URL + 'pokemon';
      print(url);
      response = await _dio.get(url);
      print(response);
      return PokemonResponse.fromJson(response.data, response.statusCode!);
    } on DioError catch (e) {
      print("Exception occured: $e stackTrace");
      return PokemonResponse.withError(
          e.response!.data, e.response!.statusCode!);
    }
  }
}
