import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  int id;
  int accountType;
  String firstName;
  String lastName;
  String username;
  String refreshToken;
  String accessToken;
  String phoneNumber;

  UserModel({
    this.firstName,
    this.lastName,
    this.username,
    this.accountType,
    this.refreshToken,
    this.accessToken,
    this.phoneNumber,
    this.id,
  });
}
