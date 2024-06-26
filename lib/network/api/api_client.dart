import 'dart:convert';
import 'dart:io';
import 'package:chat_app/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import '../network.dart';

class ApiClient {
  final String baseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.baseUrl}) {
    _mainHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<http.Response> getRequest(String uri, {Map<String, String>? headers}) async {

    try {
      final response = await http.get(
        Uri.parse(baseUrl + uri),
        headers: headers ?? _mainHeaders,
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }
  }

  Future<http.Response> postRequest ({required String apiEndpoint, Map<String, String>? headers, Map<String, dynamic>? body}) async{

    try {
      final response = await http.post(
        Uri.parse(baseUrl + apiEndpoint),
        headers: headers ?? _mainHeaders,
        body: body
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }

  }

  Future<http.Response> putRequest ({required String apiEndpoint, Map<String, String>? headers, Map<String, dynamic>? body}) async{
    try {
      final response = await http.put(
          Uri.parse(baseUrl + apiEndpoint),
          headers: headers ?? _mainHeaders,
          body: body
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }
  }

  Future<http.Response> patchRequest ({required String apiEndpoint, Map<String, String>? headers, Map<String, dynamic>? body}) async{
    try {
      final response = await http.patch(
          Uri.parse(baseUrl + apiEndpoint),
          headers: headers ?? _mainHeaders,
          body: body
      ).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      return http.Response(json.encode({'statusText': e.toString()}), 500);
    }
  }

  static handleResponse(http.Response response) async {
    try {
      if (!await hasInternet) {
        throw Strings.noInternet;
      }

      if (response.statusCode >= 200 && response.statusCode <= 210) {

        if (response.body.isNotEmpty) {
          return json.decode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        String msg = Strings.error401;
        if (response.body.isNotEmpty) {
          if (json.decode(response.body)['message'] != null) {
            msg = json.decode(response.body)['message'];
          }
        }
        throw msg;
      } else if (response.statusCode == 404) {
        throw Strings.error404;
      } else if (response.statusCode == 500) {
        throw Strings.error500;
      } else {
        String msg = Strings.unknown;

        throw msg;
      }
    } on SocketException catch (_) {
      throw Strings.noInternet;
    } on FormatException catch (_) {
      throw Strings.badResponse;
    } catch (e) {
      throw e.toString();
    }
  }

}