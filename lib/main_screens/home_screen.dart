import 'package:flutter/material.dart';
import 'package:flutter_chess/constants.dart';
import 'package:flutter_chess/helper/helper_methods.dart';
import 'package:flutter_chess/main_screens/about_screen.dart';
import 'package:flutter_chess/main_screens/game_screen_offline.dart';
import 'package:flutter_chess/main_screens/game_time_screen.dart';
import 'package:flutter_chess/main_screens/settings_screen.dart';
import 'package:flutter_chess/providers/game_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Flutter Chess',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 38.00) ,
          children: [
             const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
              'Total Chips: ${Constants.chips}',
                  style:  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),


            buildGameType(
              lable: 'Play vs Computer',
              icon: Icons.computer,
              onTap: () {
                gameProvider.setVsComputer(value: true);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameTimeScreen(),
                  ),
                );
              },
            ),
            buildGameType(
              lable: 'Play vs Friend',
              icon: Icons.person,
              onTap: () {
                gameProvider.setVsComputer(value: false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameTimeScreen(),
                  ),
                );
              },
            ),
            buildGameType(
              lable: 'Settings',
              icon: Icons.settings,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
            buildGameType(
              lable: 'About',
              icon: Icons.info,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),

                  
                );
              },
            ),
            buildGameType(
              lable: 'offline',
              icon: Icons.offline_bolt_sharp,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameScreenOffline(),
                  ),
                  );
                  }
          
        )],
        ),
      ),
    );
  }
}
