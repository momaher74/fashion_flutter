import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handle(dynamic error) {

    print("ENTER THE HANDLER") ;
    if (error is DioException) {
      // السيرفر رد
      if (error.response != null) {

        print(error.response?.data?['message'] ??
            error.response?.statusMessage ??
            'Server error occurred');
        return error.response?.data?['message'] ??
            error.response?.statusMessage ??
            'Server error occurred';
      }

      // مشاكل الاتصال
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout';
        case DioExceptionType.sendTimeout:
          return 'Request timeout';
        case DioExceptionType.receiveTimeout:
          return 'Response timeout';
        case DioExceptionType.connectionError:
          return 'No internet connection';
        default:
          return 'Unexpected network error';
      }
    }

    // أي Error تاني
    return 'Unexpected error occurred';
  }
}



 errorValidator(error){
  left(ApiErrorHandler.handle(error)) ;
}
