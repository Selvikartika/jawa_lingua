import 'package:flutter/material.dart';

class KamusPage extends StatefulWidget {
  final String kataJawa;
  final String terjemahan;

  KamusPage({required this.kataJawa, required this.terjemahan});

  @override
  _KamusPageState createState() => _KamusPageState();
}

class _KamusPageState extends State<KamusPage> {
  List<Map<String, String>> kamusList = [
  {'kata_jawa': 'Adem', 'terjemahan': 'Dingin', 'aksara_jawa': 'ꦄꦢꦼꦩ'},
  {'kata_jawa': 'Aja', 'terjemahan': 'Jangan', 'aksara_jawa': 'ꦄꦗ'},
  {'kata_jawa': 'Asem', 'terjemahan': 'Asam', 'aksara_jawa': 'ꦄꦱꦼꦩ'},
  {'kata_jawa': 'Ayo', 'terjemahan': 'Ayo', 'aksara_jawa': 'ꦄꦪ'},
  {'kata_jawa': 'Banyu', 'terjemahan': 'Air', 'aksara_jawa': 'ꦧꦚꦸ'},
  {'kata_jawa': 'Bebek', 'terjemahan': 'Bebek', 'aksara_jawa': 'ꦧꦼꦧꦺꦏ'},
  {'kata_jawa': 'Cilik', 'terjemahan': 'Kecil', 'aksara_jawa': 'ꦕꦶꦭꦺꦏ'},
  {'kata_jawa': 'Gedhe', 'terjemahan': 'Besar', 'aksara_jawa': 'ꦒꦼꦝꦺ'},
  {'kata_jawa': 'Golek', 'terjemahan': 'Mencari', 'aksara_jawa': 'ꦒꦺꦭꦼꦏ'},
  {'kata_jawa': 'Kabeh', 'terjemahan': 'Semua', 'aksara_jawa': 'ꦏꦧꦼꦃ'},
  {'kata_jawa': 'Kados', 'terjemahan': 'Seperti', 'aksara_jawa': 'ꦏꦧꦺꦴꦱ'},
  {'kata_jawa': 'Kanca', 'terjemahan': 'Teman', 'aksara_jawa': 'ꦏꦚꦏ'},
  {'kata_jawa': 'Kembang', 'terjemahan': 'Bunga', 'aksara_jawa': 'ꦏꦼꦩꦧꦁ'},
  {'kata_jawa': 'Kepenak', 'terjemahan': 'Nyaman', 'aksara_jawa': 'ꦏꦼꦥꦼꦤꦏ'},
  {'kata_jawa': 'Kowe', 'terjemahan': 'Kamu', 'aksara_jawa': 'ꦏꦺꦴꦮꦺ'},
  {'kata_jawa': 'Luwih', 'terjemahan': 'Lebih', 'aksara_jawa': 'ꦭꦸꦮꦶꦃ'},
  {'kata_jawa': 'Mangan', 'terjemahan': 'Makan', 'aksara_jawa': 'ꦩꦁꦔꦤ'},
  {'kata_jawa': 'Mboten', 'terjemahan': 'Tidak', 'aksara_jawa': 'ꦩ꧀ꦧꦺꦴꦠꦼꦤ'},
  {'kata_jawa': 'Merga', 'terjemahan': 'Karena', 'aksara_jawa': 'ꦩꦼꦫꦒ'},
  {'kata_jawa': 'Ngombe', 'terjemahan': 'Minum', 'aksara_jawa': 'ꦔꦺꦴꦩꦺ'},
  {'kata_jawa': 'Nggih', 'terjemahan': 'Ya', 'aksara_jawa': 'ꦔꦶꦃ'},
  {'kata_jawa': 'Ora', 'terjemahan': 'Tidak', 'aksara_jawa': 'ꦎꦫꦏ'},
  {'kata_jawa': 'Panganan', 'terjemahan': 'Makanan', 'aksara_jawa': 'ꦥꦁꦒꦤꦤ'},
  {'kata_jawa': 'Pawon', 'terjemahan': 'Dapur', 'aksara_jawa': 'ꦥꦺꦴꦮꦺꦴꦤ'},
  {'kata_jawa': 'Pinter', 'terjemahan': 'Pintar', 'aksara_jawa': 'ꦥꦶꦤꦼꦫ'},
  {'kata_jawa': 'Poso', 'terjemahan': 'Puasa', 'aksara_jawa': 'ꦥꦺꦴꦱꦺ'},
  {'kata_jawa': 'Punika', 'terjemahan': 'Ini', 'aksara_jawa': 'ꦥꦸꦤꦶꦏ'},
  {'kata_jawa': 'Rame', 'terjemahan': 'Ramai', 'aksara_jawa': 'ꦫꦩꦺ'},
  {'kata_jawa': 'Rejeki', 'terjemahan': 'Rezeki', 'aksara_jawa': 'ꦫꦼꦗꦺꦏꦶ'},
  {'kata_jawa': 'Rumiyin', 'terjemahan': 'Dulu', 'aksara_jawa': 'ꦫꦸꦩꦶꦶꦤ'},
  {'kata_jawa': 'Saget', 'terjemahan': 'Bisa', 'aksara_jawa': 'ꦱꦒꦺꦴꦠ'},
  {'kata_jawa': 'Sambat', 'terjemahan': 'Mengeluh', 'aksara_jawa': 'ꦱꦩ꧀ꦧꦠ'},
  {'kata_jawa': 'Sampun', 'terjemahan': 'Sudah', 'aksara_jawa': 'ꦱꦩ꧀ꦥꦸꦤ'},
  {'kata_jawa': 'Sawah', 'terjemahan': 'Sawah', 'aksara_jawa': 'ꦱꦮꦃ'},
  {'kata_jawa': 'Sedaya', 'terjemahan': 'Semua', 'aksara_jawa': 'ꦱꦼꦢꦪ'},
  {'kata_jawa': 'Seket', 'terjemahan': 'Lima puluh', 'aksara_jawa': 'ꦱꦼꦏꦺꦠ'},
  {'kata_jawa': 'Sepuh', 'terjemahan': 'Tua', 'aksara_jawa': 'ꦱꦼꦥꦸꦃ'},
  {'kata_jawa': 'Sugeng', 'terjemahan': 'Selamat', 'aksara_jawa': 'ꦱꦸꦒꦼꦁ'},
  {'kata_jawa': 'Tangan', 'terjemahan': 'Tangan', 'aksara_jawa': 'ꦠꦁꦤ'},
  {'kata_jawa': 'Tepa', 'terjemahan': 'Sesuai', 'aksara_jawa': 'ꦠꦼꦥ'},
  {'kata_jawa': 'Tresna', 'terjemahan': 'Cinta', 'aksara_jawa': 'ꦠꦿꦼꦱꦤ'},
  {'kata_jawa': 'Udan', 'terjemahan': 'Hujan', 'aksara_jawa': 'ꦈꦝꦤ'},
  {'kata_jawa': 'Ulam', 'terjemahan': 'Ikan', 'aksara_jawa': 'ꦈꦭꦩ'},
  {'kata_jawa': 'Wadon', 'terjemahan': 'Wanita', 'aksara_jawa': 'ꦮꦢꦺꦴꦤ'},
  {'kata_jawa': 'Wae', 'terjemahan': 'Saja', 'aksara_jawa': 'ꦮꦺ'},
  {'kata_jawa': 'Wiwitan', 'terjemahan': 'Awal', 'aksara_jawa': 'ꦮꦶꦮꦶꦠꦤ'},
  {'kata_jawa': 'Yen', 'terjemahan': 'Jika', 'aksara_jawa': 'ꦪꦼꦤ'},
  {'kata_jawa': 'Yogya', 'terjemahan': 'Jogja', 'aksara_jawa': 'ꦪꦺꦴꦒꦪ'},
  {'kata_jawa': 'Ziarah', 'terjemahan': 'Ziarah', 'aksara_jawa': 'ꦗꦶꦪꦃ'},
  {'kata_jawa': 'Asri', 'terjemahan': 'Indah', 'aksara_jawa': 'ꦄꦱꦿꦶ'},
  {'kata_jawa': 'Bahagia', 'terjemahan': 'Bahagia', 'aksara_jawa': 'ꦧꦃꦗꦶꦄ'},
  {'kata_jawa': 'Banget', 'terjemahan': 'Sangat', 'aksara_jawa': 'ꦧꦁꦺꦠ'},
  {'kata_jawa': 'Bareng', 'terjemahan': 'Bersama', 'aksara_jawa': 'ꦧꦫꦺꦁ'},
  {'kata_jawa': 'Cepet', 'terjemahan': 'Cepat', 'aksara_jawa': 'ꦕꦼꦥꦼꦠ'},
  {'kata_jawa': 'Dadi', 'terjemahan': 'Jadi', 'aksara_jawa': 'ꦝꦢꦶ'},

  ];

  List<Map<String, String>> filteredList = [];
  TextEditingController searchController = TextEditingController();
  bool isTwoColumn = true; // Flag untuk menentukan tampilan 1 atau 2 kolom

  @override
  void initState() {
    super.initState();
    filteredList = kamusList; // Awalnya, semua data ditampilkan
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });

    // Tambahkan kata baru yang dikirim dari halaman pertama
    kamusList.add({
      'kata_jawa': widget.kataJawa,
      'terjemahan': widget.terjemahan,
      'aksara_jawa': 'ꦲꦏꦱꦭꦺ', // Contoh aksara Jawa baru
    });
    filteredList = kamusList; // Perbarui filteredList
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredList = kamusList;
      });
      return;
    }

    List<Map<String, String>> tempList = kamusList.where((item) {
      return item['kata_jawa']!.toLowerCase().contains(query.toLowerCase()) ||
          item['terjemahan']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredList = tempList;
    });
  }

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
        title: Text('Kamus', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan kata atau terjemahan...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.grey),
                ],
              ),
            ),
            // Gunakan SizedBox dengan jarak lebih pendek
            SizedBox(height: 8.0), // Jarak lebih pendek di bawah pencarian
            // Tombol untuk toggle tampilan satu atau dua kolom
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isTwoColumn = !isTwoColumn;
                });
              },
              child: Text(isTwoColumn ? 'Tampilkan Satu Kolom' : 'Tampilkan Dua Kolom'),
            ),
            // Gunakan SizedBox dengan jarak lebih pendek setelah tombol
            SizedBox(height: 4.0), // Jarak lebih pendek setelah tombol
            Expanded(
              child: isTwoColumn
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Menentukan jumlah kolom
                        crossAxisSpacing: 8.0, // Mengurangi spasi antar kolom
                        mainAxisSpacing: 8.0, // Mengurangi spasi antar baris
                        childAspectRatio: 2.5, // Menyesuaikan rasio ukuran kolom
                      ),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // Mengurangi padding
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Menampilkan kata Jawa dengan aksara Jawa di sampingnya
                                Row(
                                  children: [
                                    Text(
                                      filteredList[index]['kata_jawa']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      filteredList[index]['aksara_jawa']!,
                                      style: TextStyle(
                                        fontFamily: 'AksaraJawa', // Gunakan font aksara Jawa
                                        fontSize: 20, // Ukuran font aksara Jawa lebih kecil
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  filteredList[index]['terjemahan']!,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Menampilkan kata Jawa dengan aksara Jawa di sampingnya
                                Row(
                                  children: [
                                    Text(
                                      filteredList[index]['kata_jawa']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      filteredList[index]['aksara_jawa']!,
                                      style: TextStyle(
                                        fontFamily: 'AksaraJawa', // Gunakan font aksara Jawa
                                        fontSize: 24, // Ukuran font aksara Jawa
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  filteredList[index]['terjemahan']!,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
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
