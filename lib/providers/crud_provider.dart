import 'package:flutter/material.dart';
import '../models/crud_models.dart';
import '../services/crud_service.dart';

class CrudProvider with ChangeNotifier {
  List<CrudModels> _mydata = [];
  List<CrudModels> get mydata => _mydata;
  int get semuanya => _mydata.length;
  final CrudService _tembak = CrudService();

  Future<void> Createdata(String apapun, int angka) async {
    try {
      await _tembak.createData(apapun, angka);
    } catch (e) {
      print(e);
      throw e;
    }
    await Readdata();
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

  Future<void> Deletedata(int id) async {
    try {
      await _tembak.deleteData(id);
    } catch (e) {
      throw e;
    }
    await Readdata();
    notifyListeners();
  }

  Future<void> Updatedata(int id, String apapun, int angka) async {
    try {
      await _tembak.updateData(id, apapun, angka);
    } catch (e) {
      throw e;
    }
    await Readdata();
    notifyListeners();
  }

  CrudProvider() {
    Readdata();
  }
}
