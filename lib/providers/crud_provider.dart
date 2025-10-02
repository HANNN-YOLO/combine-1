import 'package:flutter/material.dart';
import '../models/crud_models.dart';
import '../services/crud_service.dart';

class CrudProvider with ChangeNotifier {
  List<CrudModels> _mydata = [];
  List<CrudModels> get mydata => _mydata;
  int get semuanya => _mydata.length;
  final CrudService _tembak = CrudService();

  Future<void> Createdata(String apapun, int angka) async {
    final buat = DateTime.now().toIso8601String();

    try {
      await _tembak.createData(apapun, angka, DateTime.parse(buat));
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  Future<void> Readdata() async {
    try {
      final hasil = await _tembak.readData();
      _mydata = hasil;
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  Future<void> Deletedata(String id) async {
    try {
      await _tembak.deleteData(id);
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  Future<void> Updatedata(String id, String apapun, int angka) async {
    final edit = DateTime.now().toIso8601String();

    try {
      await _tembak.updateData(id, apapun, angka, DateTime.parse(edit));
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }
}
