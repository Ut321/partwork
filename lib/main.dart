import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:partwork/usingGetx/view/binance_screen.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binance Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // if You want see using GETX then use BinanceDataScreen and if you see using Bloc then Call the  QuotesScreen .
      home: BinanceDataScreen(),
    );
  }
}