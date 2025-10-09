import 'package:flutter/material.dart';
import 'package:tiktok/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: Scaffold(
        appBar: AppBar(title: const Text('TikTok Clone')),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}

