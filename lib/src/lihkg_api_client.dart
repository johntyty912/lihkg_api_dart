import 'dart:convert';
import 'dart:io';
import 'lihkg_api_base.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class LihkgClient extends http.BaseClient {
  LihkgClient()
      : _inner = new http.Client(),
        headers = new Map<String, String>();

  http.Client _inner;
  Map<String, String> headers;
  bool logined = false;
  BaseResponse<LoginResponse> loginResponse;

  @override
  Future<http.Response> get(url, {Map<String, String> headers}) {
    Map<String, String> _headers =
        headers == null ? new Map<String, String>() : new Map.from(headers);
    final String requestTime =
        '${DateTime.now().millisecondsSinceEpoch}'.substring(0, 10);
    _headers['x-li-request-time'] = '$requestTime';
    if (this.logined) {
      _headers['x-li-user'] = loginResponse.response.me.userID;
      _headers['x-li-digest'] = sha1
          .convert(utf8.encode(
              'jeams\$get\$$url\$\$${loginResponse.response.token}\$$requestTime'))
          .toString();
    }
    return _inner.get(url, headers: _headers);
  }

  @override
  Future<http.Response> post(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    Map<String, String> _headers =
        headers == null ? new Map<String, String>() : new Map.from(headers);
    final String requestTime =
        '${DateTime.now().millisecondsSinceEpoch}'.substring(0, 10);
    _headers['x-li-request-time'] = '$requestTime';
    if (this.logined) {
      _headers['x-li-user'] = loginResponse.response.me.userID;
      _headers['x-li-digest'] = sha1
          .convert(utf8.encode(
              'jeams\$post\$$url\$${_body2query(body)}\$${loginResponse.response.token}\$$requestTime'))
          .toString();
    }
    return _inner.post(url, headers: _headers, body: body, encoding: encoding);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request);
  }

  Future<BaseResponse<PropertyResponse>> getProperty() async {
    const propertyURL = 'https://lihkg.com/api_v2/system/property';
    final response = await this.get(propertyURL, headers: this.headers);
    if (response.statusCode == 200) {
      return BaseResponse<PropertyResponse>.fromJson(
          json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(propertyURL));
    }
  }

  Future<BaseResponse<LoginResponse>> postLogin(
      Map<String, dynamic> body) async {
    final String loginURL = "https://lihkg.com/api_v2/auth/login";
    final response = await this.post(loginURL, body: body);
    if (response.statusCode == 200) {
      this.logined = true;
      this.loginResponse =
          BaseResponse<LoginResponse>.fromJson(json.decode(response.body));
      return this.loginResponse;
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(loginURL));
    }
  }

  Future<BaseResponse<CategoryResponse>> getCategory(
      SubCategory subCategory, int page) async {
    Map<String, String> query = new Map.from(subCategory.query);
    query['page'] = '$page';
    query['cat_id'] = query['cat_id'] ?? subCategory.catId;
    query['type'] = 'now';
    query['count'] = '60';
    final Uri uri = Uri.parse(subCategory.url).replace(queryParameters: query);
    print(uri.toString());
    final response = await this.get(uri.toString(), headers: this.headers);
    if (response.statusCode == 200) {
      return BaseResponse<CategoryResponse>.fromJson(
          json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: uri);
    }
  }

  Future<BaseResponse<PageResponse>> getPage(String threadID,
      {int page = 1, bool orderByScore = true}) async {
    String pageURL = "https://lihkg.com/api_v2/thread/$threadID/page/$page";
    Map<String, String> query = {
      'order': orderByScore ? 'score' : 'reply_time'
    };
    final Uri uri = Uri.parse(pageURL).replace(queryParameters: query);
    final response = await this.get(uri.toString(), headers: this.headers);
    if (response.statusCode == 200) {
      return BaseResponse<PageResponse>.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: uri);
    }
  }

  Future<BaseResponse<SearchResponse>> getSearch(String q,
      {String sort = 'score', int page = 1}) async {
    final String searchURL = 'https://lihkg.com/api_v2/thread/search';
    Map<String, String> query = {
      'q': q,
      'page': '$page',
      'count': '30',
      'sort': sort,
    };
    final Uri uri = Uri.parse(searchURL).replace(queryParameters: query);
    final response = await this.get(uri.toString(), headers: this.headers);
    if (response.statusCode == 200) {
      return BaseResponse<SearchResponse>.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: uri);
    }
  }
}

String _body2query(Map<String, dynamic> body) {
  if (body == null) {
    return "";
  } else {
    List<String> result = new List<String>();
    body.forEach((k, v) {
      result.add("$k=$v");
    });
    return result.join("&");
  }
}
