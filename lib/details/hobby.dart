import 'package:anuj_yadav/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Hobbies extends StatefulWidget {
  const Hobbies({super.key});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _totalPages = 3; // Set the total number of pages here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hobbies")),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildPage(
                    "My Drawings",
                    _buildStaggeredGridView(
                        Colors.black, Colors.white, Colors.yellow, Colors.red)),
                _buildPage(
                    "My Poems",
                    _buildStaggeredGridView(Colors.blue, Colors.green,
                        Colors.orange, Colors.purple)),
                _buildPage(
                    "My Animations",
                    _buildStaggeredGridView(Colors.grey, Colors.blueGrey,
                        Colors.grey.shade300, Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: _currentPage > 0,
            child: FloatingActionButton.extended(
              heroTag: "back",
              backgroundColor: AppColors.navBarColor,
              onPressed: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              label: const Text(
                "Back",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              icon: const Icon(Icons.navigate_before_sharp,
                  size: 30, color: Colors.white),
            ),
          ),
          const SizedBox(width: 25),
          Visibility(
            visible: _currentPage < _totalPages - 1,
            child: FloatingActionButton.extended(
              heroTag: "next",
              backgroundColor: AppColors.navBarColor,
              onPressed: () {
                if (_currentPage < _totalPages - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              label: const Text("Next",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              icon: const Icon(Icons.navigate_next_sharp,
                  size: 30, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPage(String title, Widget content) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 40),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
            child: content,
          ),
        ],
      ),
    );
  }
}

Widget _buildStaggeredGridView(
    Color color1, Color color2, Color color3, Color color4) {
  return StaggeredGrid.count(
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: [
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 2,
        child: Container(
          color: color1,
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 1,
        child: Container(
          color: color2,
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: Container(
          color: color3,
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: Container(
          color: color4,
        ),
      ),
    ],
  );
}
