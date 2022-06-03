import 'package:flutter/material.dart';
import 'package:haberuygulamasi/galeri.dart';
import 'package:haberuygulamasi/haberler.dart';
import 'package:haberuygulamasi/hakkimizda.dart';
import 'package:haberuygulamasi/iletisim.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haber Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        primaryColor: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _aktifSayfa = 0; //Anasayfa

  //menü butonlara basıldıkça içeri yüklenecek sayfafar
  static const List<Widget> _sayfalar = <Widget>[
    Haberler(),
    Galeri(),
    Hakkimizda(),
    Iletisim()
  ];

  //menü butonlara basıldıkça değişecek başlıklar
  static const List<String> _sayfaBaslgi = <String>[
    "Anasayfa",
    "Galeri",
    "Hakkımızda",
    "İletişim"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_sayfaBaslgi.elementAt(_aktifSayfa)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Haberler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'Galeri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Hakkımızda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'İletişim',
          ),
        ],
        currentIndex: _aktifSayfa, //New
        onTap: (int index) {
          setState(() {
            _aktifSayfa = index;
          });
        },
      ),
      body: Center(
        child: _sayfalar.elementAt(_aktifSayfa),
      ),
    );
  }
}
