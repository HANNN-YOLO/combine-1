import 'package:flutter/material.dart';

class Buat extends StatelessWidget {
  static const arah = "/Buat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Halaman Buat", style: TextStyle(color: Colors.white)),
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/1200x/60/00/8a/60008a92a920172636c91365906681d0.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/Landing");
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              );
            },
          ),
        ],
      ),
    );
  }
}
