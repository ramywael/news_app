import 'package:flutter/material.dart';

import 'views/news_view.dart';
void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewView(),
    );
  }
}