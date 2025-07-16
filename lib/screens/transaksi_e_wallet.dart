import 'package:flutter/material.dart';
import 'package:sushi_app/screens/transaksi_sukses_e_wallet.dart';


class TransaksiEWallet extends StatelessWidget {
  const TransaksiEWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pembayaran E-Wallet")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selesaikan pembayaran di meja kasir",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // ShopeePay
            _buildWalletButton(
              context,
              label: "ShopeePay",
              imagePath: 'assets/img/shoppe.png',
            ),

            // Dana
            _buildWalletButton(
              context,
              label: "Dana",
              imagePath: 'assets/img/dana.png',
            ),

            // GoPay
            _buildWalletButton(
              context,
              label: "GoPay",
              icon: Icons.account_balance_wallet_outlined,
            ),

            // OVO
            _buildWalletButton(
              context,
              label: "OVO",
              icon: Icons.account_balance_wallet_outlined,
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text("Kembali"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletButton(
      BuildContext context, {
        required String label,
        String? imagePath,
        IconData? icon,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PembayaranSukses(metode: label),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          minimumSize: const Size.fromHeight(50),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        icon: imagePath != null
            ? Image.asset(imagePath, width: 24, height: 24)
            : Icon(icon ?? Icons.account_balance_wallet),
        label: Text(label),
      ),
    );
  }
}
