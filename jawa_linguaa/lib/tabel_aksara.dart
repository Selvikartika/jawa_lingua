import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AksaraJawaPage(),
    );
  }
}

class AksaraJawaPage extends StatelessWidget {
  final List<Map<String, String>> aksaraListAbjad = [
    {'aksara': 'ꦲ', 'title': 'HA', 'subtitle': 'dibaca ho'},
    {'aksara': 'ꦤ', 'title': 'NA', 'subtitle': 'dibaca no'},
    {'aksara': 'ꦕ', 'title': 'CA', 'subtitle': 'dibaca co'},
    {'aksara': 'ꦫ', 'title': 'RA', 'subtitle': 'dibaca ro'},
    {'aksara': 'ꦏ', 'title': 'KA', 'subtitle': 'dibaca ko'},
    {'aksara': 'ꦢ', 'title': 'DA', 'subtitle': 'dibaca do'},
    {'aksara': 'ꦠ', 'title': 'TA', 'subtitle': 'dibaca to'},
    {'aksara': 'ꦱ', 'title': 'SA', 'subtitle': 'dibaca so'},
    {'aksara': 'ꦮ', 'title': 'WA', 'subtitle': 'dibaca wo'},
    {'aksara': 'ꦭ', 'title': 'LA', 'subtitle': 'dibaca lo'},
    {'aksara': 'ꦥ', 'title': 'PA', 'subtitle': 'dibaca po'},
    {'aksara': 'ꦝ', 'title': 'DHA', 'subtitle': 'dibaca dho'},
    {'aksara': 'ꦗ', 'title': 'JA', 'subtitle': 'dibaca jo'},
    {'aksara': 'ꦪ', 'title': 'YA', 'subtitle': 'dibaca yo'},
    {'aksara': 'ꦚ', 'title': 'NYA', 'subtitle': 'dibaca nyo'},
    {'aksara': 'ꦩ', 'title': 'MA', 'subtitle': 'dibaca mo'},
    {'aksara': 'ꦕꦏ', 'title': 'GA', 'subtitle': 'dibaca go'},
    {'aksara': 'ꦧ', 'title': 'BA', 'subtitle': 'dibaca bo'},
    {'aksara': 'ꦢꦃ', 'title': 'THA', 'subtitle': 'dibaca tho'},
    {'aksara': 'ꦔ', 'title': 'NGA', 'subtitle': 'dibaca ngo'},
  ];

  final List<Map<String, String>> aksaraListAngka = [
    {'aksara': 'ꠀ', 'title': '0', 'subtitle': 'angka 0'},
    {'aksara': 'ꦁ', 'title': '1', 'subtitle': 'angka 1'},
    {'aksara': 'ꦂ', 'title': '2', 'subtitle': 'angka 2'},
    {'aksara': 'ꦃ', 'title': '3', 'subtitle': 'angka 3'},
    {'aksara': 'ꦄ', 'title': '4', 'subtitle': 'angka 4'},
    {'aksara': 'ꦅ', 'title': '5', 'subtitle': 'angka 5'},
    {'aksara': 'ꦆ', 'title': '6', 'subtitle': 'angka 6'},
    {'aksara': 'ꦇ', 'title': '7', 'subtitle': 'angka 7'},
    {'aksara': 'ꦈ', 'title': '8', 'subtitle': 'angka 8'},
    {'aksara': 'ꦉ', 'title': '9', 'subtitle': 'angka 9'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA67C52),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Tabel Aksara Jawa & Angka', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Header untuk bagian Aksara Huruf
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              child: Text(
                "Aksara Huruf Jawa",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            // Bagian untuk Aksara Abjad Jawa
            Expanded(
              flex: 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Menampilkan 4 item per baris
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: aksaraListAbjad.length, // Menampilkan jumlah data aksara abjad
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        aksaraListAbjad[index]['aksara']!,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        aksaraListAbjad[index]['title']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        aksaraListAbjad[index]['subtitle']!,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  );
                },
              ),
            ),
            Divider(),
            // Header untuk bagian Aksara Angka
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              child: Text(
                "Aksara Angka Jawa",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            // Bagian untuk Aksara Angka Jawa
            Expanded(
              flex: 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Menampilkan 4 item per baris
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: aksaraListAngka.length, // Menampilkan jumlah data aksara angka
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        aksaraListAngka[index]['aksara']!,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        aksaraListAngka[index]['title']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        aksaraListAngka[index]['subtitle']!,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
