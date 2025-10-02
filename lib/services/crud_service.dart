import '../configs/supabase_api_config.dart';
import '../models/crud_models.dart';

class CrudService {
  final _link = "${SupabaseApiConfig.masterurl}";
  final _key = "${SupabaseApiConfig.apikey}";

  Future<void> createData(String apapun, int angka, DateTime buat) async {}

  Future<List<CrudModels>> readData() async {
    List<CrudModels> hasilnya = [];
    return hasilnya;
  }

  Future<void> deleteData(String id) async {}

  Future<void> updateData(
    String id,
    String apapun,
    int angka,
    DateTime editan,
  ) async {}
}
