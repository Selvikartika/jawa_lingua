import 'package:flutter/material.dart';
import 'kamus.dart'; // Mengimpor KamusPage
import 'terjemah.dart'; // Pastikan ini mengimpor halaman TerjemahPage yang sudah ada
import 'pantun.dart'; // Impor file pantun.dart di sini
import 'tabel_aksara.dart';
import 'kuis.dart';
import 'konstribusi_pengguna.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Mengarahkan ke halaman kedua saat aplikasi dimulai
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _items = [
    {'title': 'Kamus', 'subtitle': 'Arti kata bahasa jawa', 'route': 'kamus'},
    {'title': 'Terjemah', 'subtitle': 'Terjemahan kalimat bahasa jawa', 'route': 'terjemah'},
    {'title': 'Pantun', 'subtitle': 'Kumpulan pantun bahasa jawa', 'route': 'pantun'},
    {'title': 'Tabel Aksara', 'subtitle': 'Aksara Jawa dan lebih banyak lagi', 'route': 'tabel_aksara'},
    {'title': 'Kuis', 'subtitle': 'Kuis bahasa Jawa untuk Anda', 'route': 'kuis'},
    {'title': 'Kontribusi Pengguna', 'subtitle': 'Menambah kosakata baru, Memberi masukan', 'route': 'kontribusi_pengguna'},
  ];

  late List<Map<String, String>> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = _items; // Inisialisasi dengan semua item
    _searchController.addListener(() {
      _filterItems();
    });
  }

  void _filterItems() {
    setState(() {
      _filteredItems = _items
          .where((item) =>
              item['title']!.toLowerCase().contains(_searchController.text.toLowerCase()) ||
              item['subtitle']!.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFA67C52),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hi, Sza!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Pencarian',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: NeverScrollableScrollPhysics(),
                children: _filteredItems.map((item) {
                  return buildCard(item['title']!, item['subtitle']!, context);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String subtitle, BuildContext context) {
    // Ikon yang digunakan
    Icon icon;
    if (title == 'Kamus') {
      icon = Icon(Icons.book, color: Color(0xFFA67C52), size: 40); // Ikon Kamus
    } else if (title == 'Terjemah') {
      icon = Icon(Icons.translate, color: Color(0xFFA67C52), size: 40); // Ikon Terjemah
    } else if (title == 'Pantun') {
      icon = Icon(Icons.auto_stories, color: Color(0xFFA67C52), size: 40); // Ikon Pantun
    } else if (title == 'Tabel Aksara') {
      icon = Icon(Icons.table_chart, color: Color(0xFFA67C52), size: 40); // Ikon Tabel Aksara (diganti ke table_chart)
    } else if (title == 'Kuis') {
      icon = Icon(Icons.quiz, color: Color(0xFFA67C52), size: 40); // Ikon Kuis
    } else if (title == 'Kontribusi Pengguna') {
      icon = Icon(Icons.group_add, color: Color(0xFFA67C52), size: 40); // Ikon Kontribusi Pengguna
    } else {
      icon = Icon(Icons.help, color: Color(0xFFA67C52), size: 40); // Ikon Default
    }

    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman yang sesuai
        if (title == 'Kamus') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KamusPage(
                kataJawa: '', // Kirimkan nilai kosong
                terjemahan: '', // Kirimkan nilai kosong
              ),
            ),
          );
        } else if (title == 'Terjemah') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TerjemahPage()),
          );
        } else if (title == 'Pantun') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PantunJawaPage()),
          );
        } else if (title == 'Tabel Aksara') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AksaraJawaPage()),
          );
        } else if (title == 'Kuis') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizPage()),
          );
        } else if (title == 'Kontribusi Pengguna') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KontribusiPenggunaPage()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
