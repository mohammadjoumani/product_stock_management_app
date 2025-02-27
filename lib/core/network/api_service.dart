// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:sehaone/core/services/app_prefs.dart';
// import 'package:sehaone/core/app/constants.dart';
// import 'package:sehaone/core/services/network_info.dart';
// import 'package:sehaone/core/utils/resource/routes/routes_manager.dart';
// import 'package:sehaone/features/generic/presentation/main/view/sehaone_app.dart';
//
// import 'constants_api.dart';
// import 'error_handler.dart';
//
// const String authorization = "Authorization";
// const String defaultLanguage = "language";
//
// class ApiService {
//   final Dio _dio1;
//   final Dio _dio2;
//   final NetworkInfo _networkInfo;
//   final AppPreferences _appPref;
//
//   ApiService(
//     this._dio1,
//     this._dio2,
//     this._networkInfo,
//     this._appPref,
//   ) {
//     _dio1.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: _onRequest,
//         onError: _onError,
//       ),
//     );
//   }
//
//   //region Init function for interceptor
//
//   _onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     if (await _networkInfo.isConnected) {
//       String? token = _appPref.getToken();
//
//       options.headers['Authorization'] = 'Bearer $token';
//       options.headers['payername'] = Constants.payerName;
//       options.headers['language'] = _appPref.getAppLanguage();
//       if (_appPref.getCurrentUser() != null) {
//         if (_appPref.getOriginUser()?.id != _appPref.getCurrentUser()?.id) {
//           options.headers['beneficiary'] = _appPref.getCurrentUser()?.id;
//         }
//       }
//
//       return handler.next(options);
//     } else {
//       return handler.reject(
//         DioException(
//           requestOptions: options,
//           response: Response(
//             requestOptions: options,
//             statusCode: ResponseCode.noInternetConnection,
//             statusMessage: ResponseMessage.noInternetConnection,
//           ),
//           error: ResponseMessage.noInternetConnection,
//         ),
//       );
//     }
//   }
//
//   _onError(DioException e, ErrorInterceptorHandler handler) async {
//     if (e.response?.statusCode == 423 && _appPref.isUserLogged()) {
//       _logout();
//       handler.reject(e);
//     } else if (e.response?.statusCode == 401 && _appPref.isUserLogged()) {
//       _refreshToken(e, handler);
//     } else {
//       handler.next(e);
//     }
//   }
//
//   Future<void> _refreshToken(DioException e, ErrorInterceptorHandler handler) async {
//     try {
//       final refreshToken = _appPref.getRefreshToken();
//       final response = await _dio2.post(
//         ConstantsApi.refreshTokenUrl,
//         data: {'refreshToken': refreshToken},
//         options: Options(
//           headers: {
//             'payername': Constants.payerName,
//           },
//         ),
//       );
//       _appPref.setToken(response.data['accessToken']);
//       _appPref.setRefreshToken(response.data['refreshToken']);
//       handler.resolve(await _dio1.fetch(e.requestOptions));
//     } catch (error) {
//       if (error is DioException) {
//         if (error.response?.statusCode == 401) {
//           _logout();
//           handler.reject(e);
//         } else if (error.response?.statusCode == 423) {
//           _logout();
//           handler.reject(e);
//         } else {
//           handler.next(error);
//         }
//       } else {
//         handler.next(e);
//       }
//     }
//   }
//
//   void _logout() {
//     final context = navigatorKey?.currentState?.context;
//     if (context!.mounted) {
//       _appPref.logout();
//       Navigator.pushNamedAndRemoveUntil(context, Routes.splashRoute, (route) => false);
//     }
//   }
//
//   //endregion
//
//   Future<dynamic> get({
//     required String url,
//     dynamic data,
//     dynamic params,
//     Map<String, dynamic>? customHeaders,
//   }) async {
//     var response = await _dio1.get(
//       url,
//       data: data,
//       queryParameters: params,
//       options: Options(
//         headers: customHeaders ?? {},
//       ),
//     );
//     return response.data;
//   }
//
//   Future<dynamic> post({
//     required String url,
//     dynamic data,
//     dynamic params,
//     Map<String, dynamic>? customHeaders,
//   }) async {
//     var response = await _dio1.post(
//       url,
//       data: data,
//       queryParameters: params,
//       options: Options(
//         headers: customHeaders ?? {},
//       ),
//     );
//     return response.data;
//   }
//
//   Future<dynamic> put({
//     required String url,
//     dynamic data,
//     dynamic params,
//     Map<String, dynamic>? customHeaders,
//   }) async {
//     final response = await _dio1.put(
//       url,
//       data: data,
//       queryParameters: params,
//       options: Options(
//         headers: customHeaders ?? {},
//       ),
//     );
//     return response.data;
//   }
//
//   Future<dynamic> patch({
//     required String url,
//     dynamic data,
//     dynamic params,
//     Map<String, dynamic>? customHeaders,
//   }) async {
//     final response = await _dio1.patch(
//       url,
//       data: data,
//       queryParameters: params,
//       options: Options(
//         headers: customHeaders ?? {},
//       ),
//     );
//     return response.data;
//   }
//
//   Future<dynamic> delete({
//     required String url,
//     dynamic data,
//     dynamic params,
//     Map<String, dynamic>? customHeaders,
//   }) async {
//     final response = await _dio1.delete(
//       url,
//       data: data,
//       queryParameters: params,
//       options: Options(
//         headers: customHeaders ?? {},
//       ),
//     );
//     return response.data;
//   }
//
//   Future<dynamic> downloadFile({required String url, dynamic data, dynamic params}) async {
//     final response = await _dio1.get(
//       url,
//       queryParameters: params,
//       onReceiveProgress: (received, total) {
//         // print("Received: ${(received / total) * 100}");
//       },
//       options: Options(responseType: ResponseType.bytes),
//     );
//     return response.data;
//   }
//
//   Future<dynamic> uploadFile({required File file}) async {
//     String fileName = file.path.split('/').last;
//     String filetype = fileName.split('.').last;
//     final bytes = await file.readAsBytes();
//     FormData formData = FormData.fromMap(
//       {
//         "file": MultipartFile.fromBytes(
//           bytes,
//           filename: fileName,
//           contentType: MediaType('image', filetype),
//         ),
//       },
//     );
//     final response = await _dio1.post(
//       ConstantsApi.uploadFileUrl,
//       data: formData,
//     );
//     return response.data;
//   }
// }
