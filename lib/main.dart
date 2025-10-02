import 'package:flutter/material.dart';
import 'pages/main/landingpage.dart';
import 'pages/main/buat.dart';
import 'pages/main/edit.dart';
// import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/Landing': (context) => Landingpage(),
        '/Buat': (context) => Buat(),
        '/Edit': (_) => Edit(),
      },
      initialRoute: "/Landing",
    );
  }
}
