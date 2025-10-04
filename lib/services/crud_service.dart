import 'dart:convert';
import '../configs/supabase_api_config.dart';
import '../models/crud_models.dart';
import 'package:http/http.dart' as htpp;

class CrudService {
  final _link = "${SupabaseApiConfig.masterurl}";
  final _key = "${SupabaseApiConfig.apikey}";

  Future<void> createData(String apapun, int angka) async {
    var url = Uri.parse("${_link}/rest/v1/rest_supabasev1");

    final isian = CrudModels(apapun: apapun, angka: angka);

    var pengisian = await htpp.post(
      url,
      headers: {'Content-Type': 'application/json', 'apikey': _key},
      body: json.encode(isian.toJson()),
    );

    if (pengisian.statusCode == 200 || pengisian.statusCode == 201) {
      print("done ${pengisian.body}");
    } else {
      throw "Gagal Tersimpan ${pengisian.body}";
    }
  }

  Future<List<CrudModels>> readData() async {
    var url = Uri.parse("${_link}/rest/v1/rest_supabasev1");

    var simpan = await htpp.get(
      url,
      headers: {'Content-Type': 'application/json', 'apikey': _key},
    );

    if (simpan.statusCode == 200 || simpan.statusCode == 201) {
      List<CrudModels> hasilnya = [];
      final ambil = json.decode(simpan.body) as List<dynamic>;
      ambil.forEach((item) {
        var jsonitem = CrudModels.fromJson(item);
        hasilnya.add(jsonitem);
      });
      return hasilnya;
    } else {
      throw "Gagal Mengambil data ${simpan.body}";
    }
  }

  Future<void> deleteData(int id) async {
    var url = Uri.parse("$_link/rest/v1/rest_supabasev1?id=eq.$id");

    var hapus = await htpp.delete(
      url,
      headers: {'Content-Type': 'application/json', 'apikey': _key},
    );

    if (hapus.statusCode == 204) {
      print("done");
    } else {
      throw "Gagal menghapus ${hapus.body}";
    }
  }

  Future<void> updateData(int id, String apapun, int angka) async {
    var url = Uri.parse("$_link/rest/v1/rest_supabasev1?id=eq.$id");

    final pembaruan = CrudModels(apapun: apapun, angka: angka);

    var editan = await htpp.patch(
      url,
      headers: {'Content-Type': 'application/json', 'apikey': _key},
      body: json.encode(pembaruan.toJson()),
    );

    if (editan.statusCode == 204) {
      print("Done ${editan.body}");
    } else {
      throw "Gagal memperbarui data ${editan.body}";
    }
  }
}
