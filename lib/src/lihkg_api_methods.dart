import 'dart:convert';
import 'dart:io';
import 'lihkg_api_base.dart';
import 'package:http/http.dart' as http;

// get Category List
Future<BaseResponse<PropertyResponse>> getProperty() async {
  const propertyURL = 'https://lihkg.com/api_v2/system/property';

  final response = await http.get(propertyURL);
  if (response.statusCode == 200) {
    return BaseResponse<PropertyResponse>.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(propertyURL));
  }
}

Future<BaseResponse<CategoryResponse>> getCategory(
    String categoryURL, Map<String, String> query) async {
  final Uri uri = Uri.parse(categoryURL).replace(queryParameters: query);
  final response = await http.get(uri.toString());
  if (response.statusCode == 200) {
    return BaseResponse<CategoryResponse>.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: uri);
  }
}

Future<BaseResponse<PageResponse>> getPage(
    String threadID, {int page, Map<String, String> query,
    Map<String, String> headers}) async {
  String pageURL =
      "https://lihkg.com/api_v2/thread/$threadID/page/$page";
  final Uri uri = Uri.parse(pageURL).replace(queryParameters: query);
  dynamic response;
  if (headers == null) {
    response = await http.get(uri.toString());
  } else {
    response = await http.get(uri.toString(), headers: headers);
  }
  if (response.statusCode == 200) {
    return BaseResponse<PageResponse>.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: uri);
  }
}

Future<BaseResponse<LoginResponse>> postLogin(Map<String, dynamic> body) async {
  final String loginURL = "https://lihkg.com/api_v2/auth/login";
  final response = await http.post(loginURL, body: body);
  if (response.statusCode == 200) {
    return BaseResponse<LoginResponse>.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(loginURL));
  }
}