import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  int _score = 0;
  bool _answered = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Apa arti dari kata "Sugeng enjing" dalam bahasa Indonesia?',
      'answers': ['Selamat pagi', 'Terima kasih', 'Selamat malam', 'Apa kabar'],
      'correctAnswer': 'Selamat pagi',
    },
    {
      'question': 'Apa yang dimaksud dengan "Kulo" dalam bahasa Jawa?',
      'answers': ['Saya', 'Kamu', 'Dia', 'Mereka'],
      'correctAnswer': 'Saya',
    },
    {
      'question': 'Apa arti dari kata "Matur nuwun" dalam bahasa Indonesia?',
      'answers': [
        'Terima kasih',
        'Maaf',
        'Selamat jalan',
        'Terima kasih banyak'
      ],
      'correctAnswer': 'Terima kasih',
    },
    {
      'question':
          'Bagaimana cara mengatakan "Selamat tinggal" dalam bahasa Jawa?',
      'answers': ['Sugeng tindak', 'Matur nuwun', 'Sampun', 'Nuwun sewu'],
      'correctAnswer': 'Sugeng tindak',
    },
    {
      'question': 'Apa arti dari "Apa kabar?" dalam bahasa Jawa?',
      'answers': [
        'Piye kabarmu?',
        'Kulo nuwun',
        'Mboten saged',
        'Sugeng enjing'
      ],
      'correctAnswer': 'Piye kabarmu?',
    },
    {
      'question': 'Aksara Jawa untuk angka 1 adalah?',
      'answers': ['꧑', '꧒', '꧓', '꧔'],
      'correctAnswer': '꧑',
    },
    {
      'question': 'Aksara Jawa untuk angka 2 adalah?',
      'answers': ['꧑', '꧒', '꧓', '꧔'],
      'correctAnswer': '꧒',
    },
    {
      'question': 'Huruf aksara Jawa untuk "ka" adalah?',
      'answers': ['꧀', 'ꦏ', 'ꦒ', 'ꦗ'],
      'correctAnswer': 'ꦏ',
    },
    {
      'question': 'Huruf aksara Jawa untuk "sa" adalah?',
      'answers': ['ꦱ', 'ꦒ', 'ꦗ', 'ꦕ'],
      'correctAnswer': 'ꦱ',
    },
    {
      'question': 'Angka Jawa untuk 10 adalah?',
      'answers': ['꧑꧒', '꧑꧓', '꧑꧔', '꧑꧕'],
      'correctAnswer': '꧑꧒',
    },
  ];

  void _submitAnswer(String answer) {
    setState(() {
      _answered = true;
      _selectedAnswer = answer;
      if (answer == _questions[_currentQuestionIndex]['correctAnswer']) {
        _score++;
      }

      Future.delayed(Duration(seconds: 2), () {
        if (_currentQuestionIndex < _questions.length - 1) {
          setState(() {
            _currentQuestionIndex++;
            _selectedAnswer = null;
            _answered = false;
          });
        } else {
          _showScore();
        }
      });
    });
  }

  void _showScore() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil Kuis'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Skor Anda: $_score/${_questions.length}'),
              SizedBox(height: 10),
              Text('Terima kasih telah mengikuti kuis!'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _score = 0;
                  _currentQuestionIndex = 0;
                  _selectedAnswer = null;
                  _answered = true;
                });
              },
              child: Text('Mulai Lagi'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA67C52),
        title: Text(
          'Kuis Bahasa Jawa',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Pertanyaan ${_currentQuestionIndex + 1}/${_questions.length}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                question['question'],
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: question['answers'].map<Widget>((answer) {
                  Color buttonColor = Colors.grey[200]!;

                  // Cek jika sudah dijawab
                  if (_answered) {
                    if (answer == question['correctAnswer']) {
                      buttonColor = Colors.green; // Warna hijau jika jawaban benar
                    } else if (answer == _selectedAnswer) {
                      buttonColor = Colors.red; // Warna merah jika jawaban salah
                    }
                  }

                  return ElevatedButton(
                      onPressed: !_answered ? () => _submitAnswer(answer) : null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttonColor),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      child: Text(answer),
                    );
                })
                .toList(),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
