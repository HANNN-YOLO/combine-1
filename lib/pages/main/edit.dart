import 'package:flutter/material.dart';
import '../custom/textfield_1baris_full.dart';
import '../custom/satu_tombol.dart';
import '../custom/showdialog_eror.dart';
import 'package:provider/provider.dart';
import '../../providers/crud_provider.dart';

class Edit extends StatelessWidget {
  static const arah = "/Edit";
  @override
  Widget build(BuildContext context) {
    final TextEditingController apapun = TextEditingController();
    final TextEditingController angka = TextEditingController();

    final terima = ModalRoute.of(context)?.settings.arguments as int;
    final pakai = Provider.of<CrudProvider>(
      context,
    ).mydata.firstWhere((elementr) => elementr.id == terima);
    final penghubung = Provider.of<CrudProvider>(context);

    apapun.text = "${pakai.apapun}";
    angka.text = "${pakai.angka}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Halaman Update", style: TextStyle(color: Colors.white)),
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
                    await penghubung.Updatedata(
                      // int.parse(pakai.id),
                      pakai.id!,
                      apapun.text,
                      int.parse(angka.text),
                    );
                    Navigator.of(context).pushReplacementNamed('/Landing');
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ShowdialogEror(label: "${e.toString()}");
                      },
                    );
                  }
                },
                label: "Perbarui Data",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
