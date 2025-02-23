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
  String _name = "Sza";
  String _email = "szavamela@gmail.com";
  String _phone = "+62 057-5823-9600";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
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
                  _name, 
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  _email,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () async {
                final updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen(
                    name: _name, 
                    email: _email, 
                    phone: _phone,
                  )),
                );
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
                  Icon(Icons.edit, color: Colors.blue, size: 20),
                  SizedBox(width: 8),
                  Text("Edit Profile", style: TextStyle(color: Colors.blue, fontSize: 16)),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Tombol "Hubungi Kami"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () {
                // Navigasi ke halaman Hubungi Kami
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUsScreen()),
                );
              },
              child: Row(
                children: const [
                  Icon(Icons.contact_mail, color: Colors.blue, size: 20),
                  SizedBox(width: 8),
                  Text("Hubungi Kami", style: TextStyle(color: Colors.blue, fontSize: 16)),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
        ],
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
              "Jika Anda memiliki pertanyaan atau masukan, Anda bisa menghubungi kami melalui:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Informasi kontak (email, telepon, dsb.)
            const Text(
              "Email: support@aplikasi.com",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              "Telepon: +62 080-123-4567",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            // Tombol kembali ke halaman sebelumnya
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
                final updatedProfile = {
                  'name': _nameController.text,
                  'email': _emailController.text,
                  'phone': _phoneController.text,
                };

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
