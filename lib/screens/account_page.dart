import 'package:flutter/material.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          children: [
            FlutterLogo(size: 150, style: FlutterLogoStyle.horizontal),
            SizedBox(
              height: 10,
            ),
            Text(
              "Mayank Pratyush",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "mayank.pratyush@100gmail.com",
              style: TextStyle(
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "+91 6203029131",
              style: TextStyle(
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
