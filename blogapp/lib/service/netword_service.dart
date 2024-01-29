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
    String host = "https://api.dakarcafeexpress.com/api/";
    final apiPath = host + endpoint;
    // print(apiPath);
    return Uri.parse(apiPath);
  }

  static Uri buildUrl2(String endpoint) {
    String host = "https://dakarcafeexpress.com/dcx/public/index.php/";
    final apiPath = host + endpoint;
    // print(apiPath);
    return Uri.parse(apiPath);
  }

  //post user
  static Future<String> postuser(var body, String endpoint) async {
    try {
      var response = await client.post(buildUrl2(endpoint),
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

  static Future<dynamic> getcmd(String endpoint, String? token) async {
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

  static Future<dynamic> getprodcat(String endpoint, String? token) async {
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

  static Future<dynamic> getproduct(String endpoint, String? token) async {
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

  static Future<dynamic> getentite(String endpoint, String? token) async {
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

  // static Future<String?> getEntite() async {
  //   return await storage.read(key: "entite");
  // }

  // static Future<void> storeEntite(String entite) async {
  //   await storage.write(key: 'entite', value: entite);
  // }

  static Future<void> storeIduser(String iduser) async {
    await storage.write(key: 'iduser', value: iduser);
  }

  static Future<String?> getIduser() async {
    return await storage.read(key: "iduser");
  }

  //Prenom
  static Future<void> storePrenom(String prenom) async {
    await storage.write(key: 'prenom', value: prenom);
  }

  static Future<String?> getPrenom() async {
    return await storage.read(key: "prenom");
  }

  //Nom
  static Future<void> storeNom(String nom) async {
    await storage.write(key: 'nom', value: nom);
  }

  static Future<String?> getNom() async {
    return await storage.read(key: "nom");
  }

  //Telephone
  static Future<void> storeTelephone(String telephone) async {
    await storage.write(key: 'telephone', value: telephone);
  }

  static Future<String?> getTelephone() async {
    return await storage.read(key: "telephone");
  }

  static Future<void> storeId(String id) async {
    await storage.write(key: 'id', value: id);
  }

  static Future<String?> getId() async {
    return await storage.read(key: "id");
  }
}
