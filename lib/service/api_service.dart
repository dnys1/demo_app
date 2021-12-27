import 'dart:convert';

import 'package:demo/env.dart';
import 'package:demo/model/exception.dart';
import 'package:demo/model/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  const ApiService();

  static final _client = http.Client();

  Future<String> login(String username, String password) async {
    final uri = kEnv.uri.resolve('/login');
    try {
      final resp = await _client.post(
        uri,
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
      if (resp.statusCode != 200) {
        throw ApiException(uri, resp.body, resp.statusCode);
      }
      return resp.body;
    } on Exception catch (e) {
      throw ApiException.unknown(uri, e.toString());
    }
  }

  Future<User> userInfo(String token) async {
    final uri = kEnv.uri.resolve('/userinfo');
    try {
      final resp = await _client.get(uri, headers: {
        'Authorization': token,
      });
      if (resp.statusCode != 200) {
        throw ApiException(uri, resp.body, resp.statusCode);
      }
      final json = jsonDecode(resp.body) as Map<String, Object?>;
      return User.fromJson(json);
    } on Exception catch (e) {
      throw ApiException.unknown(uri, e.toString());
    }
  }
}
