import 'package:flutter/material.dart';
import 'package:moviesapp/data/moviedData.dart';
import 'package:moviesapp/model/movie.dart';

class MoviesListItem extends StatefulWidget {
  const MoviesListItem({
    super.key,
  });

  @override
  State<MoviesListItem> createState() => _MoviesListItemState();
}

class _MoviesListItemState extends State<MoviesListItem> {
  final List<Movie> myMovies = dummyMovies;
  int _selectedCategoryIndex = 0;
  final List<Category> categories = Category.values;
  String _selectedImageUrl = "";

  List<Movie> getFilteredMovies() {
    return myMovies
        .where((movie) => movie.category == categories[_selectedCategoryIndex])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          width: double.infinity,
          color: Colors.red,
          child: _selectedImageUrl.isNotEmpty
              ? Image.network(
                  _selectedImageUrl,
                  fit: BoxFit.cover,
                )
              : Center(child: Text("No Movie Selected")),
        ),
        // Category Tabs
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: _selectedCategoryIndex == index
                      ? Colors.blueAccent
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    categories[index].toString().split('.').last.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _selectedCategoryIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Horizontal List for Selected Category
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: getFilteredMovies()
                  .map(
                    (movie) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImageUrl = movie.movieimageurl;
                        });
                      },
                      child: Container(
                        width: 160,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              movie.movieimageurl,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                            Text(
                              movie.title,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
