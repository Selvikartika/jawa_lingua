import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Bagian Avatar Profil
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Sza",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "szavamela@gmail.com",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          
          // Tombol Edit Profile yang pindah ke kiri
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Edit Profil
              },
              child: const Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna tombol
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Ukuran tombol
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Tombol Ganti Password yang pindah ke kiri
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Ganti Password
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
                );
              },
              child: const Text("Ganti Password"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna tombol
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Ukuran tombol
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Daftar Opsi Menu
          _buildOption(Icons.help, "Tentang Aplikasi"),
          _buildOption(Icons.contact_mail, "Hubungi Kami"),
        ],
      ),
    );
  }

  // Widget untuk membuat opsi menu
  Widget _buildOption(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Ganti Password
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ganti Password"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Input Password Lama
            TextField(
              controller: _oldPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password Lama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Input Password Baru
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password Baru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Input Konfirmasi Password Baru
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Konfirmasi Password Baru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Simpan Perubahan Password
            ElevatedButton(
              onPressed: () {
                // Validasi jika password baru dan konfirmasi password baru cocok
                if (_newPasswordController.text == _confirmPasswordController.text) {
                  // Simpan perubahan password dan kembali ke halaman sebelumnya
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password berhasil diubah")),
                  );
                  Navigator.pop(context);
                } else {
                  // Jika password tidak cocok
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password baru dan konfirmasi tidak cocok")),
                  );
                }
              },
              child: const Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }
}
