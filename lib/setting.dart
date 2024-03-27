import 'package:flutter/material.dart';
import 'package:flutter_application_1/stopwatchmodel.dart';
import 'package:metaballs/metaballs.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
              // Add your onPressed functionality here
            },
          ),
        ),
        body: SafeArea(
            child: Metaballs(
          color: const Color.fromARGB(255, 66, 133, 244),
          effect: MetaballsEffect.follow(
            growthFactor: 1,
            smoothing: 1,
            radius: 0.5,
          ),
          gradient: const LinearGradient(colors: [
            Colors.greenAccent,
            Colors.blueAccent,
            Colors.pinkAccent,
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          metaballs: 30,
          animationDuration: const Duration(milliseconds: 200),
          speedMultiplier: 1,
          bounceStiffness: 3,
          minBallRadius: 15,
          maxBallRadius: 40,
          glowRadius: 0.7,
          glowIntensity: 0.6,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            children: [
              ListTile(
                title: const Text(
                  "Time Format",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Select the time format",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onTap: () {
                  // Add logic to navigate to time format settings page
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  "Notifications",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Manage notification settings",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onTap: () {
                  // Add logic to navigate to notification settings page
                },
              ),
            ],
          ),
        )));
  }
}
