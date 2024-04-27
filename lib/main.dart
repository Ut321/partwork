import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:partwork/presentation/pages/quotes_screen.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuotesScreen(),
    );
  }
}
