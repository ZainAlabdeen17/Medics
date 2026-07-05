import 'package:dio/dio.dart';
import 'package:medics/core/error/failure.dart';

class ServerExeption implements Exception {
  final Failure failure;
  ServerExeption({required this.failure});
}

Exception handleDioException(DioException e) {
  final responseData = e.response?.data;
  if (responseData != null) {
    if (responseData is String) {
      return ServerExeption(failure: Failure(message: responseData));
    }
    return ServerExeption(failure: Failure.fromJson(responseData));
  }

  return ServerExeption(
    failure: Failure(message: e.message ?? 'Unexpected error'),
  );
}



// final responseData = e.response?.data;

//   if (responseData != null) {
//     if (responseData is String) {
//       return ServerExeption(failure: Failure(message: responseData));
//     }
//     return ServerExeption(failure: Failure.fromJson(responseData));
//   }

//   return ServerExeption(
//     failure: Failure(message: e.message ?? 'Unexpected error'),
//   );





// final responseData = e.response?.data;
//   if (responseData != null) {
//     if (responseData is String) {
//       return ServerExeption(failure: Failure(message: responseData));
//     }
//     return ServerExeption(failure: Failure.fromJson(responseData));
//   }
//   switch (e.type) {
//     case DioExceptionType.connectionTimeout:
//       return ServerExeption(
//         failure: Failure(message: 'Connection timeout with server'),
//       );
//     case DioExceptionType.receiveTimeout:
//       return ServerExeption(
//         failure: Failure(message: 'Server took too long to respond'),
//       );
//     case DioExceptionType.connectionError:
//       return ServerExeption(
//         failure: Failure(
//           message:
//               'The server closed the connection unexpectedly. Please check backend logs.',
//         ),
//       );
//     case DioExceptionType.unknown:
//       if (e.message != null && e.message!.contains('HttpException')) {
//         return ServerExeption(
//           failure: Failure(
//             message:
//                 'Local server crashed or closed connection unexpectedly. Check backend logs.',
//           ),
//         );
//       }
//       return ServerExeption(
//         failure: Failure(message: e.message ?? 'Unknown network error'),
//       );
//     default:
//       return ServerExeption(
//         failure: Failure(message: e.message ?? 'Unexpected network error'),
//       );
//   }