import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chess/providers/game_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:squares/squares.dart';

Widget buildGameType({
  required String lable,
  String? gameTime,
  IconData? icon,
  required Function() onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      child: Column(
          
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Divider(
          height: 40,
          color:  Color.fromARGB(0, 76, 175, 79),
          ),
        icon != null
            ? Icon(icon)
            : gameTime! == '60+0'
                ? const SizedBox.shrink()
                : Text(gameTime),
        const SizedBox(
          height: 10,
        ),
        Text(
          lable,
          textAlign: TextAlign.center,
          style:  const TextStyle(
            fontWeight: FontWeight.bold, 
            ),
        ),
        const Divider(height: 40),
      ]),
    ),
  );
}

String getTimerToDisplay({
  required GameProvider gameProvider,
  required bool isUser,
}) {
  String timer = '';
  // check if is user
  if (isUser) {
    if (gameProvider.player == Squares.white) {
      timer = gameProvider.whitesTime.toString().substring(2, 7);
    }
    if (gameProvider.player == Squares.black) {
      timer = gameProvider.blacksTime.toString().substring(2, 7);
    }
  } else {
    // if its not user do the opposite
    if (gameProvider.player == Squares.white) {
      timer = gameProvider.blacksTime.toString().substring(2, 7);
    }
    if (gameProvider.player == Squares.black) {
      timer = gameProvider.whitesTime.toString().substring(2, 7);
    }
  }

  return timer;
}

// method to display the correct time below the board, if user is white then display white time
// if user is black then display black time

final List<String> gameneeds = [
  'Bullet 1+0 1000000 chips',
  'Bullet 2+1 750000 chips',
  'Bullet 3+0 500000 chips',
  'Bullet 3+2 250000 chips',
  'Bullet 5+0 125000 chips',
  'Bullet 5+3 100000 chips',
  'Rapid 10+0 50000 chips',
  'Rapid 10+5 25000 chips',
  'Rapid 15+10 10000 chips',
  'Classical 30+0 5000 chips',
  'Classical 30+20 5000 chips',
  'Custom 60+0 1000 chips',
];

final List<String> gameTimes = gameneeds.map((game) => game.split(' ')[0] + ' ' + game.split(' ')[1]).toList();
final List<int> chipsAmounts = gameneeds.map((game) => int.parse(game.split(' ')[2])).toList();


var textFormDecoration = InputDecoration(
  labelText: 'enter your password',
  hintText: 'enter your password',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.lightBlue, width: 1),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.orangeAccent, width: 1),
    borderRadius: BorderRadius.circular(8),
  ),
);

// pick an image
Future<File?> pickImage({
  required bool fromCamera,
  required Function(String) onFail,
}) async {
  File? fileImage;
  if (fromCamera) {
    try {
      final takenPhoto =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (takenPhoto != null) {
        fileImage = File(takenPhoto.path);
      }
    } catch (e) {
      onFail(e.toString());
    }
  } else {
    try {
      final choosenImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (choosenImage != null) {
        fileImage = File(choosenImage.path);
      }
    } catch (e) {
      onFail(e.toString());
    }
  }

  return fileImage;
}

// validate email method
bool validateEmail(String email) {
  // Regular expression for email validation
  final RegExp emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  // Check if the email matches the regular expression
  return emailRegex.hasMatch(email);
}

