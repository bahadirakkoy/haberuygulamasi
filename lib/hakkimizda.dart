import 'package:flutter/material.dart';

class Hakkimizda extends StatelessWidget {
  const Hakkimizda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
          child: Text(
              "Uludağ Üniversitesi bilgisayar programcılığı öğrencisi Halit Bakır tarafından okul projesi için yapılmıştır.")),
    );
  }
}
