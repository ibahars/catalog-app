import 'package:flutter/material.dart';
import 'screens/discover_screen.dart'; 

void main() => runApp(const CatalogApp());

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true, 
      ),
      home: const DiscoverScreen(), 
    );
  }
}