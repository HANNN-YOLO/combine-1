import 'package:flutter/material.dart';
import '../custom/satu_tombol.dart';
import '../custom/custom_listtile_delete.dart';

class Landingpage extends StatelessWidget {
  int angka = 0;
  static const arah = "/Landing";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Halaman Utama", style: TextStyle(color: Colors.white)),
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
                  Navigator.of(context).pushReplacementNamed('/Buat');
                },
                icon: Icon(Icons.add, color: Colors.white),
              );
            },
          ),
        ],
      ),

      body:
          angka == 0
              ? Center(
                child: SatuTombol(
                  warna: Colors.cyan,
                  fungsi: () {
                    Navigator.of(context).pushReplacementNamed('/Buat');
                  },
                  label: "Tambah Data",
                ),
              )
              : Container(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: angka,
                  itemBuilder: (context, index) {
                    return CustomListtileDelete(
                      label: "Data Atas",
                      label1: "Data Bawah",
                      fungsitap: () {
                        Navigator.of(context).pushReplacementNamed('/Edit');
                      },
                    );
                  },
                ),
              ),
    );
  }
}
