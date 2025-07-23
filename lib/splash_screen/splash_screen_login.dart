import 'package:flutter/material.dart';
import 'package:sushi_app/screens/home/pemilihan.dart';

class SplashScreenLogin extends StatefulWidget {
  const SplashScreenLogin({super.key});

  @override
  State<SplashScreenLogin> createState() => _SplashScreenLoginState();
}

class _SplashScreenLoginState extends State<SplashScreenLogin> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SelectionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text("Tunggu sebentar...", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
