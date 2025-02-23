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
          // Removed the container behind the avatar
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
          const SizedBox(height: 20),
          _buildOption(
            Icons.edit,
            "Edit profile",
            onTap: () {
              // Navigasi ke halaman Edit Profil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfileScreen()),
              );
            },
          ),
          _buildOption(Icons.password, "Ganti Password"),
          _buildOption(Icons.help, "Tentang Aplikasi"),
          _buildOption(Icons.contact_mail, "Hubungi Kami"),
        ],
      ),
    );
  }

  // Widget untuk membuat opsi dengan fungsionalitas onTap
  Widget _buildOption(IconData icon, String title, {String? trailing, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: onTap, // Fungsi yang dijalankan saat di-klik
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
            if (trailing != null)
              Text(
                trailing,
                style: const TextStyle(fontSize: 16, color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController(text: "Sza");
  final _emailController = TextEditingController(text: "szavamela@gmail.com");
  final _phoneController = TextEditingController(text: "+62 057-5823-9600");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Field untuk nama
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            
            // Field untuk email
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Field untuk nomor telepon
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol simpan perubahan
            ElevatedButton(
              onPressed: () {
                // Simpan data yang sudah diubah (bisa disimpan ke server atau lokal)
                String updatedName = _nameController.text;
                String updatedEmail = _emailController.text;
                String updatedPhone = _phoneController.text;

                // Tampilkan pesan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Profil berhasil diperbarui!")),
                );

                // Kembali ke layar sebelumnya
                Navigator.pop(context);
              },
              child: const Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }
}
