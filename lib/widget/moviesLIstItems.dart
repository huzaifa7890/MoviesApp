import 'package:flutter/material.dart';

class MoviesListItem extends StatefulWidget {
  const MoviesListItem({super.key,});



  @override
  State<MoviesListItem> createState() => _MoviesListItemState();
}

class _MoviesListItemState extends State<MoviesListItem> {
  int _selectedCategoryIndex = 0;
  final List<List<String>> _categoryItems = [
    ['For You 1', 'For You 2', 'For You 3'], // Items for 'For You'
    ['Following 1', 'Following 2', 'Following 3'], // Items for 'Following'
    ['Popular 1', 'Popular 2', 'Popular 3'], // Items for 'Popular'
  ];
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        children: [
          Container(height: 350,
            width: double.infinity,
            color: Colors.red,),
          // Category Tabs
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:5,
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
                      'bilal',
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
                children: _categoryItems[_selectedCategoryIndex]
                    .map(
                      (item) => Container(
                    width: 160,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}