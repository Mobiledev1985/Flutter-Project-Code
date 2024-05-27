import 'dart:convert';
import 'dart:io' show HttpHeaders;

import 'package:flutter_demo_project/api/base_url.dart';
import 'package:flutter_demo_project/api/bloc/api_event.dart';
import 'package:flutter_demo_project/api/bloc/api_state.dart';
import 'package:flutter_demo_project/api/bloc/base_state.dart';
import 'package:flutter_demo_project/api/check_internet_connection.dart';
import 'package:flutter_demo_project/api/error_handler.dart';
import 'package:flutter_demo_project/api/exception_hander.dart';
import 'package:http/http.dart' as http;

/// Sends an API request based on the given [apiEvent].
///
/// Returns a stream of [BaseState] objects representing the API request states.
///
base class ApiClient {
  static final ApiClient _singleton = ApiClient._();

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._();

  Stream<BaseState> apiRequest({
    required ApiEvent apiEvent,
  }) async* {
    final bool isInternet = await CheckConnection.connectionStatus();
    if (!isInternet) {
      yield const ApiConnectionError(connectionErrorMessage: '');
      return;
    }

    late final http.Response response;

    //time out of the API
    const Duration timeOut = Duration(seconds: 30);

    final Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'Authorization': apiEvent.needAuthorization ? 'Bearer token' : ''
    };

    headers.addEntries(apiEvent.extraHeader.entries);

    String url = '${BaseUrl.baseUrl}${apiEvent.apiEndPoint}';

    yield ApiLoading();

    try {
      switch (apiEvent) {
        case Get():
          if (apiEvent.queryParams.isNotEmpty) {
            url += apiEvent.queryParams;
          }
          response = await http
              .get(
                Uri.parse(url),
                headers: headers,
              )
              .timeout(timeOut);
          break;

        case Post():
          response = await http
              .post(Uri.parse(url),
                  headers: headers, body: json.encode(apiEvent.body))
              .timeout(timeOut);
          break;

        case Put():
          response = await http
              .put(Uri.parse(url),
                  headers: headers, body: json.encode(apiEvent.body))
              .timeout(timeOut);
          break;

        case Delete():
          response = await http
              .delete(
                Uri.parse(url),
                headers: headers,
              )
              .timeout(timeOut);
          break;
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedResponse = json.decode(response.body);
        yield ApiSuccess(data: decodedResponse);
      } else {
        final Exception exception =
            ExceptionHandler.throwExceptionForStatusCode(response.statusCode);
        yield ApiError(errorMessage: exception.toString());
      }
    } catch (e) {
      final Exception exception = ErrorHandler.throwExceptionForError(e);
      yield ApiError(errorMessage: exception.toString());
    }
  }
}
