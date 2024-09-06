import 'package:flutter_chess/constants.dart';

class UserModel {
  String uid;
  String name;
  String email;
  String image;
  String createdAt;
  int playerRating;
  int chips;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.image,
    required this.createdAt,
    required this.playerRating,
    required this.chips,
  });

  Map<String, dynamic> toMap() {
    return {
      Constants.uid: uid,
      Constants.name: name,
      Constants.email: email,
      Constants.image: image,
      Constants.createdAt: createdAt,
      Constants.playerRating: playerRating,
      Constants.chips.toString(): chips,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data[Constants.uid] ?? '',
      name: data[Constants.name] ?? '',
      email: data[Constants.email] ?? '',
      image: data[Constants.image] ?? '',
      createdAt: data[Constants.createdAt] ?? '',
      chips: data[Constants.chips] ?? 1000000,
      playerRating: data[Constants.playerRating] ?? 1200,
    );
  }
}
