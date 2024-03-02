import 'package:flutter/material.dart';
import 'package:moviesapp/Screen/Movies.dart';

import 'package:moviesapp/prac.dart';
import 'package:moviesapp/Screen/Movies.dart';
import 'package:moviesapp/data/moviedData.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Movies app',
       home: MoviesScreen(),
     );
  }
}


