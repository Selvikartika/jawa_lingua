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
      home: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Daftar item yang akan dicari
  List<String> items = [
    'Kamus',
    'Terjemah',
    'Pantun',
    'Tabel aksara',
    'Konstribusi pengguna',
    'Kuis',
  ];

  // Daftar yang akan menampilkan hasil pencarian
  List<String> filteredItems = [];

  // Kontrol pencarian
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Menampilkan seluruh daftar item pada awalnya
    filteredItems = items;
  }

  // Fungsi untuk mencari item
  void _searchItem(String query) {
    final results = items.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Kolom pencarian
            TextField(
              controller: _searchController,
              onChanged: _searchItem, // Setiap kali teks berubah, cari item
              decoration: const InputDecoration(
                labelText: 'Cari Nama',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Daftar hasil pencarian
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredItems[index]),
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
