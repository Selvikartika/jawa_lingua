import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantunJawaPage(),
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}

class PantunJawaPage extends StatefulWidget {
  @override
  _PantunJawaPageState createState() => _PantunJawaPageState();
}

class _PantunJawaPageState extends State<PantunJawaPage> {
  List<String> parikanJenaka = [
    'Jumat kliwon udane gerimis\nEnake ngopi karo mendoan\nTak sawang sawang koe tambah manis\nSayange koe ra ngajak balikan.',
    'Esuk-esuk cuacane cerah\nGolek kerja sing barokah\nKancane wis pada nikah\nLhaa aku nglamar ae susah.',
  ];

  List<String> parikanNasihat = [
    'Mangan intip karo klopo\nMangan soto lalap tahu\nDadi wong urip kudu makaryo\nKanggo conto anak putu.',
    'Nang Jombang tuku tahu susu\nTahune dideleh wadah\nSinau ojo nganti nesu\nInsya Allah mesti oleh faedah.',
  ];

  List<String> parikanAgama = [
     'Sholat subuh ing sajadah\nNiat resik ati tentrem\nDzikir lan doa ojo gampang ngalah\nBerkah urip bakal nyetem.',
    'Ngaji Quran saben sore\nOjo lali sholat lima\nGusti Allah welas asih gede\nNyuwun pangapura sak lawase.',
  ];
  List<String> parikanPribahasa = [
     'Layang-layang mabur dhuwur\nTaline putus tiba neng kali\nAja dumeh rumangsa luhur\nGolek konco ojo milih-mili.',
    'Tuku wolu oleh sanga\nDuwit sitik ojo ngeluh\nGusti allah mbales karma\nSing sabar mesti kepanggih luluh.',

  ];
  List<String> parikanTekateki = [
    'Wajik kletik\ngulane jowo,\nwulune sitik\nbarange dowo\n[Jawaban: sikat botol]',
    'Sego gurih\nlawuhe sate usus\npertamane perih\nmaringono bludhas-bludhus\n[Jawaban: tindik kuping]',
  ];

  final TextEditingController pantunController = TextEditingController();
  String selectedCategory = 'Semua Kategori';

  void addPantun() {
    setState(() {
      String pantunText = pantunController.text;
      if (pantunText.isNotEmpty) {
        switch (selectedCategory) {
          case 'Parikan Jenaka':
            parikanJenaka.add(pantunText);
            break;
          case 'Parikan Nasihat':
            parikanNasihat.add(pantunText);
            break;
          case 'Parikan Agama':
            parikanAgama.add(pantunText);
            break;
          case 'Parikan Pribahasa':
            parikanPribahasa.add(pantunText);
            break;
          case 'Parikan Teka-teki':
            parikanTekateki.add(pantunText);
            break;
        }
        pantunController.clear();
      }
    });
  }

  void deletePantun(String category, int index) {
    setState(() {
      switch (category) {
        case 'Parikan Jenaka':
          parikanJenaka.removeAt(index);
          break;
        case 'Parikan Nasihat':
          parikanNasihat.removeAt(index);
          break;
        case 'Parikan Agama':
          parikanAgama.removeAt(index);
          break;
        case 'Parikan Pribahasa':
          parikanPribahasa.removeAt(index);
          break;
        case 'Parikan Teka-teki':
          parikanTekateki.removeAt(index);
          break;
      }
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
        title: Text('Pantun', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                value: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: <String>[
                  'Semua Kategori',
                  'Parikan Jenaka',
                  'Parikan Nasihat',
                  'Parikan Agama',
                  'Parikan Pribahasa',
                  'Parikan Teka-teki'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              TextField(
                controller: pantunController,
                maxLines: null, // Membolehkan banyak baris
                keyboardType:
                    TextInputType.multiline, // Memungkinkan tombol Enter
                decoration: InputDecoration(
                  hintText: 'Masukkan pantun baru...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: addPantun,
                child: Text('Tambahkan Pantun'),
              ),
              SizedBox(height: 16),
              if (selectedCategory == 'Semua Kategori') ...[
                buildPantunList('Parikan Jenaka', parikanJenaka),
                buildPantunList('Parikan Nasihat', parikanNasihat),
                buildPantunList('Parikan Agama', parikanAgama),
                buildPantunList('Parikan Pribahasa', parikanPribahasa),
                buildPantunList('Parikan Teka-teki', parikanTekateki),
              ] else ...[
                buildPantunList(
                    selectedCategory, getPantunList(selectedCategory)),
              ]
            ],
          ),
        ),
      ),
    );
  }

  List<String> getPantunList(String category) {
    switch (category) {
      case 'Parikan Jenaka':
        return parikanJenaka;
      case 'Parikan Nasihat':
        return parikanNasihat;
      case 'Parikan Agama':
        return parikanAgama;
      case 'Parikan Pribahasa':
        return parikanPribahasa;
      case 'Parikan Teka-teki':
        return parikanTekateki;
      default:
        return [];
    }
  }

  Widget buildPantunList(String category, List<String> pantunList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (pantunList.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ),
        if (pantunList.isEmpty) Text('Belum ada pantun untuk kategori ini.'),
        ...pantunList.asMap().entries.map((entry) {
          int index = entry.key;
          String pantun = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(pantun),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => deletePantun(category, index),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
