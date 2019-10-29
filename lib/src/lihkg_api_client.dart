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

  logout() {
    this.logined = false;
    this.loginResponse = null;
  }

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
      Map dummy = json.decode(await new File('assets/json/property.json').readAsString());
      return BaseResponse<PropertyResponse>.fromJson(dummy);
      // throw HttpException(
      //     'Unexpected status code ${response.statusCode}:'
      //     ' ${response.reasonPhrase}',
      //     uri: Uri.parse(propertyURL));
    }
  }

  Future<BaseResponse<LoginResponse>> postLogin(
      Map<String, dynamic> body) async {
    final String loginURL = "https://lihkg.com/api_v2/auth/login";
    final response = await this.post(loginURL, body: body);
    if (response.statusCode == 200) {
      this.loginResponse =
          BaseResponse<LoginResponse>.fromJson(json.decode(response.body));
      this.logined = true;
      return this.loginResponse;
    } else {
      Map dummy = json.decode(await new File('assets/json/login_success.json').readAsString());
      return BaseResponse<LoginResponse>.fromJson(dummy);
      // throw HttpException(
      //     'Unexpected status code ${response.statusCode}:'
      //     ' ${response.reasonPhrase}',
      //     uri: Uri.parse(loginURL));
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
      Map dummy = json.decode(await new File('assets/json/category.json').readAsString());
      return BaseResponse<CategoryResponse>.fromJson(dummy);
      // throw HttpException(
      //     'Unexpected status code ${response.statusCode}:'
      //     ' ${response.reasonPhrase}',
      //     uri: uri);
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

  Future<BaseResponse<SearchResponse>> getSearch(
      String q, //sort can be 'score','desc_create_time','desc_reply_time'
      {String sort = 'score',
      int page = 1}) async {
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

  Future<BaseResponse<LikeResponse>> vote(ItemData post,
      {bool isLike = true}) async {
    String url = "https://lihkg.com/api_v2/thread/${post.threadID}";
    url += post.msgNum != "1" ? "/${post.postID}" : "";
    url += isLike ? "/like" : "/dislike";
    final Uri uri = Uri.parse(url);
    final response = post.msgNum != "1"
        ? await this.get(uri.toString(), headers: this.headers)
        : await this.post(uri.toString(), headers: this.headers);
    if (response.statusCode == 200) {
      return BaseResponse<LikeResponse>.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: uri);
    }
  }

  Future<BaseResponse<ReplyResponse>> postReply(String threadID, String content) async {
    String url = "https://lihkg.com/api_v2/thread/reply";
    Map<String,String> body = {
      "thread_id": threadID,
      "content": content,
    };
    final response = await this.post(url, headers: this.headers, body: body);
    if (response.statusCode == 200) {
      return BaseResponse<ReplyResponse>.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(url));
    }
  }

  Future<BaseResponse<CreateResponse>> postCreate(String catID, String subCatID, String title, String content) async {
    String url = "https://lihkg.com/api_v2/thread/create";
    Map<String,String> body = {
      "cat_id": catID,
      "title": title,
      "content": content,
      "sub_cat_id": subCatID,
    };
    final response = await this.post(url, headers: this.headers, body: body);
    if (response.statusCode == 200) {
      return BaseResponse<CreateResponse>.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(url));
    }
  }
}

String _body2query(Map<String, dynamic> body) {
  if (body == null) {
    return "";
  } else {
    List<String> result = new List<String>();
    body.forEach((k, v) {
      result.add("${Uri.encodeComponent(k)}=${Uri.encodeComponent(v)}");
    });
    return result.join("&");
  }
}
