import 'package:flutter/material.dart';
import '../custom/textfield_1baris_full.dart';
import '../custom/satu_tombol.dart';
import '../custom/showdialog_eror.dart';
import 'package:provider/provider.dart';
import '../../providers/crud_provider.dart';

class Buat extends StatelessWidget {
  static const arah = "/Buat";
  @override
  Widget build(BuildContext context) {
    final TextEditingController apapun = TextEditingController();
    final TextEditingController angka = TextEditingController();

    final penghubung = Provider.of<CrudProvider>(context);

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

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 10),
            Textfield1barisFull(
              jenis: TextInputType.name,
              bk: TextCapitalization.words,
              ketikan: apapun,
              tulis: false,
              label: "Masukkan Input",
            ),
            SizedBox(height: 20),
            Textfield1barisFull(
              jenis: TextInputType.number,
              bk: TextCapitalization.none,
              ketikan: angka,
              tulis: false,
              label: "Masukkan Integer",
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SatuTombol(
                warna: Colors.cyan,
                fungsi: () async {
                  try {
                    await penghubung.Createdata(
                      apapun.text,
                      int.parse(angka.text),
                    );
                    await Navigator.of(
                      context,
                    ).pushReplacementNamed('/Landing');
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ShowdialogEror(label: "${e.toString()}");
                      },
                    );
                  }
                },
                label: "Tambah Data",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
