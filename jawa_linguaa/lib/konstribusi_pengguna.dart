import 'package:flutter/material.dart';
import 'kamus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KontribusiPenggunaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KontribusiPenggunaPage extends StatelessWidget {
  final TextEditingController _kataController = TextEditingController();
  final TextEditingController _terjemahanController = TextEditingController();
  final TextEditingController _saranController = TextEditingController();

  void _submitKata(BuildContext context) {
    String kata = _kataController.text.trim();
    String terjemahan = _terjemahanController.text.trim();

    if (kata.isEmpty || terjemahan.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mohon isi kedua kolom sebelum mengirim.')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KamusPage(
          kataJawa: kata,
          terjemahan: terjemahan,
        ),
      ),
    );

    // Reset input setelah submit
    _kataController.clear();
    _terjemahanController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Terima kasih atas kontribusi Anda!')),
    );
  }

  void _submitSaran(BuildContext context) {
    String saran = _saranController.text.trim();

    if (saran.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukan dan saran tidak boleh kosong.')),
      );
      return;
    }

    // Reset input setelah submit
    _saranController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Terima kasih atas masukan Anda!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA47C5C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Kontribusi Pengguna',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Kirimkan kosakata yang belum ada di kamus agar semakin lengkap. Atas partisipasi Anda, kami ucapkan terima kasih.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    controller: _kataController,
                    hintText: 'Masukkan Kata',
                    label: 'Bahasa Jawa',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildInputField(
                    controller: _terjemahanController,
                    hintText: 'Masukkan Terjemahan',
                    label: 'Bahasa Indonesia',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA47C5C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () => _submitKata(context),
              child: Text(
                'Kirim Kosakata Baru',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    controller: _saranController,
                    hintText: 'Masukan dan Saran Pengguna',
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFA47C5C),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () => _submitSaran(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    String? label,
  }) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
            textAlign: TextAlign.center,
          ),
          if (label != null) Text(label),
        ],
      ),
    );
  }
}
