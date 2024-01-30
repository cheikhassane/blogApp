import 'dart:async';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:blogapp/service/app_exception.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  static final client = http.Client();
  static const storage = FlutterSecureStorage();

  static Future<String> post(var body, String endpoint) async {
    try {
      var response = await client.post(buildUrl(endpoint),
          body: body,
          headers: {
            "content-type": "application/json"
          }).timeout(const Duration(seconds: timeoutduration));
      return response.body;
    } on SocketException {
      throw FetchDataException(
          'Pas de connexion internet', buildUrl(endpoint).toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "L'API n'a pas répondu à temps", buildUrl(endpoint).toString());
    }
  }

  static Future<String> posttoken(
      var body, String endpoint, String? token) async {
    try {
      var response = await client.post(buildUrl(endpoint),
          body: body,
          headers: {
            "content-type": "application/json",
            "Authorization": "Bearer $token"
          }).timeout(const Duration(seconds: timeoutduration));
      return response.body;
    } on SocketException {
      throw FetchDataException(
          'Pas de connexion internet', buildUrl(endpoint).toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "L'API n'a pas répondu à temps", buildUrl(endpoint).toString());
    }
  }

  static Future<String> put(var body, String endpoint) async {
    try {
      var response = await client.put(buildUrl(endpoint), body: body, headers: {
        "content-type": "application/json"
      }).timeout(const Duration(seconds: timeoutduration));
      return response.body;
    } on SocketException {
      throw FetchDataException(
          'Pas de connexion internet', buildUrl(endpoint).toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "L'API n'a pas répondu à temps", buildUrl(endpoint).toString());
    }
  }

  static Future<String> puttoken(
      var body, String endpoint, String? token) async {
    try {
      var response = await client.put(buildUrl(endpoint), body: body, headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(const Duration(seconds: timeoutduration));
      return response.body;
    } on SocketException {
      throw FetchDataException(
          'Pas de connexion internet', buildUrl(endpoint).toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "L'API n'a pas répondu à temps", buildUrl(endpoint).toString());
    }
  }

  static const int timeoutduration = 30;

  static Uri buildUrl(String endpoint) {
    String host = "https://jsonplaceholder.typicode.com/";
    final apiPath = host + endpoint;
    // print(apiPath);
    return Uri.parse(apiPath);
  }

  static Future<dynamic> get(String endpoint, String? token) async {
    try {
      var response = await client.get(buildUrl(endpoint), headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(const Duration(seconds: timeoutduration));
      return response.body;
    } on SocketException {
      throw FetchDataException(
          'Pas de connexion internet', buildUrl(endpoint).toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "L'API n'a pas répondu à temps", buildUrl(endpoint).toString());
    }
  }

  static Future<dynamic> getpost(String endpoint, String? token) async {
    try {
      var response = await client.get(buildUrl(endpoint), headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(const Duration(seconds: timeoutduration));
      return response.body;
    } on SocketException {
      throw FetchDataException(
          'Pas de connexion internet', buildUrl(endpoint).toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "L'API n'a pas répondu à temps", buildUrl(endpoint).toString());
    }
  }

  static Future<dynamic> getuser(String endpoint, String? token) async {
    try {
      var response = await client.get(buildUrl(endpoint), headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(const Duration(seconds: timeoutduration));
      return response.body;
    } on SocketException {
      throw FetchDataException(
          'Pas de connexion internet', buildUrl(endpoint).toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "L'API n'a pas répondu à temps", buildUrl(endpoint).toString());
    }
  }

  static Future<dynamic> getcomment(String endpoint, String? token) async {
    try {
      var response = await client.get(buildUrl(endpoint), headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(const Duration(seconds: timeoutduration));
      return response.body;
    } on SocketException {
      throw FetchDataException(
          'Pas de connexion internet', buildUrl(endpoint).toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "L'API n'a pas répondu à temps", buildUrl(endpoint).toString());
    }
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  static Future<void> storeIduser(String iduser) async {
    await storage.write(key: 'iduser', value: iduser);
  }

  static Future<String?> getIduser() async {
    return await storage.read(key: "iduser");
  }

  static Future<void> storeId(String id) async {
    await storage.write(key: 'id', value: id);
  }

  static Future<String?> getId() async {
    return await storage.read(key: "id");
  }
}
