import 'package:flutter/material.dart';
import '../custom/satu_tombol.dart';
import '../custom/custom_listtile_delete.dart';
import '../custom/showdialog_eror.dart';
import 'package:provider/provider.dart';
import '../../providers/crud_provider.dart';

class Landingpage extends StatelessWidget {
  static const arah = "/Landing";
  @override
  Widget build(BuildContext context) {
    final penghubung = Provider.of<CrudProvider>(context);

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
          penghubung.semuanya == 0
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
                  itemCount: penghubung.semuanya,
                  itemBuilder: (context, index) {
                    return CustomListtileDelete(
                      label: "${penghubung.mydata[index].apapun}",
                      label1: "${penghubung.mydata[index].angka}",
                      fungsitap: () {
                        Navigator.of(context).pushReplacementNamed(
                          '/Edit',
                          arguments: penghubung.mydata[index].id!,
                        );
                      },
                      fungsi: () async {
                        try {
                          await penghubung.Deletedata(
                            penghubung.mydata[index].id!,
                          );
                        } catch (e) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ShowdialogEror(label: "${e.toString()}");
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
    );
  }
}
