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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Data yang akan ditampilkan di profil
  String _name = "Sza";
  String _email = "szavamela@gmail.com";
  String _phone = "+62 057-5823-9600";

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
                Text(
                  _name, // Menampilkan nama yang diperbarui
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  _email,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          
          // Tombol Edit Profile yang terlihat seperti teks biasa dan dengan emoji
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () async {
                // Navigasi ke halaman Edit Profil dan tunggu hasil perubahan
                final updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen(
                    name: _name, 
                    email: _email, 
                    phone: _phone,
                  )),
                );

                // Jika data yang dikembalikan tidak null, perbarui profil
                if (updatedProfile != null) {
                  setState(() {
                    _name = updatedProfile['name'];
                    _email = updatedProfile['email'];
                    _phone = updatedProfile['phone'];
                  });
                }
              },
              child: Row(
                children: const [
                  Icon(Icons.edit, color: Colors.black, size: 20), // Ubah warna ikon menjadi hitam
                  SizedBox(width: 8),
                  Text("Edit Profile", style: TextStyle(color: Colors.black, fontSize: 16)), // Ubah warna teks menjadi hitam
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Tombol Ganti Password yang terlihat seperti teks biasa dan dengan emoji
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () {
                // Navigasi ke halaman Ganti Password
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangePasswordScreen() ),
                );
              },
              child: Row(
                children: const [
                  Icon(Icons.lock, color: Colors.black, size: 20), // Ubah warna ikon menjadi hitam
                  SizedBox(width: 8),
                  Text("Ganti Password", style: TextStyle(color: Colors.black, fontSize: 16)), // Ubah warna teks menjadi hitam
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Daftar Opsi Menu
          _buildOption(Icons.help, "Tentang Aplikasi", () {
            // Navigasi ke halaman Tentang Aplikasi
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutAppScreen()),
            );
          }),
          
          // Tombol Hubungi Kami
          _buildOption(Icons.contact_mail, "Hubungi Kami", () {
            // Navigasi ke halaman Hubungi Kami
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactUsScreen()),
            );
          }),
        ],
      ),
    );
  }

  // Widget untuk membuat opsi menu
  Widget _buildOption(IconData icon, String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.black), // Ubah warna ikon menjadi hitam
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black), // Ubah warna teks menjadi hitam
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Tentang Aplikasi
class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Aplikasi"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
            "Kamus Jawa Lingua adalah sebuah aplikasi kamus sederhana namun efektif yang dirancang untuk memudahkan pengguna dalam mempelajari dan memahami Bahasa Jawa. Dengan antarmuka yang intuitif dan mudah digunakan, aplikasi ini cocok bagi siapa saja yang ingin memperkaya kosa kata Bahasa Jawa, baik itu pemula ataupun pelajar."
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Hubungi Kami
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hubungi Kami"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Jika Anda memiliki pertanyaan atau ada kesalahan Mohon Hubungi kami, Anda dapat mengirim email atau menghubungi nomor berikut:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "Email:ayasa@gmail.com",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              "Telepon: +62 057-5823-9600",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Edit Profil
class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _phoneController = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profil"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Mengembalikan data yang sudah diperbarui ke halaman sebelumnya
                final updatedProfile = {
                  'name': _nameController.text,
                  'email': _emailController.text,
                  'phone': _phoneController.text,
                };

                // Menutup halaman Edit dan mengirim data kembali
                Navigator.pop(context, updatedProfile);
              },
              child: const Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Ganti Password dengan ikon mata untuk menampilkan/sembunyikan password
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
              obscureText: !_isOldPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password Lama',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isOldPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isOldPasswordVisible = !_isOldPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),


            // Input Password Baru
            TextField(
              controller: _newPasswordController,
              obscureText: !_isNewPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password Baru',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isNewPasswordVisible = !_isNewPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Input Konfirmasi Password Baru
            TextField(
              controller: _confirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password Baru',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Simpan Perubahan Password
            ElevatedButton(
              onPressed: () {
                // Validasi jika password baru dan konfirmasi password baru cocok
                if (_newPasswordController.text == _confirmPasswordController.text) {
                  // Logika untuk mengganti password
                  // Kamu bisa menambahkan pengolahan lebih lanjut di sini.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password berhasil diganti")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password baru dan konfirmasi tidak cocok")),
                  );
                }
              },
              child: const Text("Ganti Password"),
            ),
          ],
        ),
      ),
    );
  }
}
