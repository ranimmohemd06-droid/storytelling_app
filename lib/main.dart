import 'package:flutter/material.dart';
import 'package:storytelling_app/screens/story_selection_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StorySelectionScreen(),
    );
  }
}