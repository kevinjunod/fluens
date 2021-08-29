import 'package:http/http.dart' as http;
import 'package:influencrot_flutter/constants.dart';
import 'dart:convert';
import 'dart:async';

class Services {
  Future<String> register(
    String email,
    int acountType,
  ) async {
    final response = await http.post(
      baseurl + "auth/register",
      headers: {"Content-Type": "application/json"},
      body: json.encode(
        {"email": email, "login_type": acountType},
      ),
    );
    print(response.body);
  }

  Future<String> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      baseurl + "auth/login",
      headers: {"Content-Type": "application/json"},
      body: json.encode(
        {"username": email, "password": password, "login_type": 1},
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {}
  }
}
