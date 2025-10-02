import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseApiConfig {
  static get masterurl => dotenv.env['SUPABASE_URL'] ?? "";
  static get apikey => dotenv.env['SUPABASE_ANON_KEY'] ?? "";
}
