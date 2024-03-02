import 'package:flutter/material.dart';
import 'package:moviesapp/widget/moviesLIstItems.dart';
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
              child: Container(
                color: Colors.black,
                child: MoviesListItem(),
              ),
            )


    );
  }
}
