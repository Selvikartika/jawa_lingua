import 'package:flutter/material.dart';

class TerjemahPage extends StatefulWidget {
  @override
  _TerjemahPageState createState() => _TerjemahPageState();
}

class _TerjemahPageState extends State<TerjemahPage> {
  // List kalimat Bahasa Jawa, terjemahannya, dan aksara Jawa
  final List<Map<String, String>> kalimatList = [
    {
      'bahasa_jawa': 'Apa kabarmu?',
      'terjemahan': 'Bagaimana kabarmu?',
      'aksara_jawa': 'ꦄꦥꦲ ꦏꦧꦫꦩꦸ?'
    },
    {
      'bahasa_jawa': 'Sugeng rawuh',
      'terjemahan': 'Selamat datang',
      'aksara_jawa': 'ꦱꦸꦒꦼꦁ ꦫꦮꦸꦃ'
    },
    {
      'bahasa_jawa': 'Aku arep lunga',
      'terjemahan': 'Saya akan pergi',
      'aksara_jawa': 'ꦄꦏꦸ ꦄꦫꦺꦥ ꦭꦸꦁꦒ'
    },
    {
      'bahasa_jawa': 'Mangan apa?',
      'terjemahan': 'Makan apa?',
      'aksara_jawa': 'ꦩꦁꦔꦤ꧀ ꦄꦥꦲ?'
    },
    // Tambahkan data lainnya sesuai kebutuhan
  ];

  List<Map<String, String>> filteredList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredList = kalimatList; // Awalnya, semua data ditampilkan
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredList = kalimatList;
      });
      return;
    }

    List<Map<String, String>> tempList = kalimatList.where((item) {
      return item['bahasa_jawa']!.toLowerCase().contains(query.toLowerCase()) ||
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
        title: Text('Terjemah', style: TextStyle(color: Colors.white)),
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
                        hintText: 'Masukkan kalimat yang ingin dicari...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.grey),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
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
                          Text(
                            "Kalimat Bahasa Jawa:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          Text(
                            filteredList[index]['bahasa_jawa']!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.red),
                          ),
                          SizedBox(height: 8.0),
                          // Menampilkan Aksara Jawa
                          Text(
                            "Aksara Jawa:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          Text(
                            filteredList[index]['aksara_jawa']!,
                            style: TextStyle(
                              fontFamily: 'AksaraJawa', // Sesuaikan dengan font Aksara Jawa
                              fontSize: 20.0,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Terjemahan Bahasa Indonesia:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          Text(
                            filteredList[index]['terjemahan']!,
                            style: TextStyle(fontSize: 14.0),
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
