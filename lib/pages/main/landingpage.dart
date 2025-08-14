import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  static const arah = "/Landing";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Halaman Utama", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
