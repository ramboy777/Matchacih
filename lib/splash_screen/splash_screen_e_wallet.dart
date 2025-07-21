import 'package:flutter/material.dart';
import 'package:sushi_app/screens/transaksi_sukses_e_wallet.dart';


class PembayaranSplash extends StatefulWidget {
  final String metode;

  const PembayaranSplash({super.key, required this.metode});

  @override
  State<PembayaranSplash> createState() => _PembayaranSplashState();
}

class _PembayaranSplashState extends State<PembayaranSplash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PembayaranSukses(metode: widget.metode),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sesuaikan warna tema
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(), // animasi loading
            const SizedBox(height: 20),
            Text(
              "Memproses pembayaran via ${widget.metode}...",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
