import 'package:flutter/material.dart';
import 'login.dart'; // Impor LoginPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'), // Gambar latar
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/logo2.png', // Gambar logo lokal
                    width: 300,
                    height: 300,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke LoginPage (kode kedua)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA67C52),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
                  ),
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      color: Colors.white, // Teks putih
                      fontSize: 16, // Ukuran teks
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
