import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Fungsi ini akan dipanggil saat tombol "REGISTER" ditekan
  void _register() {
    // Ambil input dari user
    String username = _usernameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Lakukan validasi sederhana
    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi')),
      );
      return; // Hentikan fungsi jika ada field yang kosong
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password dan Konfirmasi Password tidak cocok')),
      );
      return; // Hentikan fungsi jika password tidak cocok
    }

    // --- LOGIKA PENYIMPANAN DATA ---
    // Di dunia nyata, di sinilah Anda akan mengirim data (username, password)
    // ke server atau menyimpannya di database lokal.
    //
    // Untuk simulasi ini, kita anggap registrasi berhasil.
    // ---------------------------------

    // Tampilkan pesan sukses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registrasi berhasil! Silakan login.')),
    );

    // Kembali ke halaman Login setelah jeda singkat agar user bisa membaca pesan
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    // Bersihkan controller saat widget tidak lagi digunakan untuk mencegah kebocoran memori
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Oranye Melengkung yang sama
            ClipPath(
              clipper: WaveClipper(), // Menggunakan clipper yang sama dari login
              child: Container(
                height: 220, // Sedikit lebih pendek agar pas
                width: double.infinity,
                color: Colors.deepOrange,
                child: const Center(
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            // Form Registrasi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Label Username
                  const Text("USERNAME", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  // TextField Username
                  TextField(
                    controller: _usernameController,
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 20),
                  // Label Password
                  const Text("PASSWORD", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  // TextField Password
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 20),
                  // Label Konfirmasi Password
                  const Text("CONFIRM PASSWORD", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  // TextField Konfirmasi Password
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 30),
                  // Tombol Register
                  ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      elevation: 0,
                    ),
                    child: const Text("REGISTER", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 40),
                  // Teks untuk kembali ke Halaman Login
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Cukup kembali ke layar sebelumnya (Login)
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Sudah punya akun? ",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method untuk menghindari duplikasi kode styling
  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
    );
  }
}

// Anda bisa meletakkan clipper ini di file terpisah agar bisa diimpor,
// tapi untuk kemudahan, kita salin saja di sini.
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}