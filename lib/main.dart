import 'package:flutter/material.dart';
import 'pages/main/landingpage.dart';
import 'pages/main/buat.dart';
import 'pages/main/edit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'providers/crud_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => CrudProvider(),
      builder: (context, child) {
        return App();
      },
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/Landing': (context) => Landingpage(),
        '/Buat': (context) => Buat(),
        '/Edit': (context) => Edit(),
      },
      initialRoute: "/Landing",
    );
  }
}
