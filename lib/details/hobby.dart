import 'package:anuj_yadav/design/constants/app_animations.dart';
import 'package:anuj_yadav/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rive/rive.dart';

class Hobbies extends StatefulWidget {
  const Hobbies({super.key});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text("Hobbies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w / 50))),
      body: Column(
        children: [
          Expanded(
            child: _buildPage(
                "",
                _buildStaggeredGridView(
                  Colors.white,
                  'assets/demos/hobby/boy.png',
                  'assets/demos/hobby/good.png',
                  'assets/demos/hobby/dan.png',
                  'assets/demos/hobby/baud.png',
                  'assets/demos/hobby/self.gif',
                  'assets/demos/hobby/gaddis.png',
                  'assets/demos/hobby/poetry-1.png',
                  'assets/demos/hobby/poetry-2.png',
                  'assets/demos/hobby/jap.png',
                  'assets/demos/hobby/angel.png',
                  'assets/demos/hobby/net.png',
                  'assets/demos/hobby/anuj.png',
                )),
          ),
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
  Color color1,
  String link1,
  String link2,
  String link3,
  String link4,
  String link5,
  String link6,
  String link7,
  String link8,
  String link9,
  String link10,
  String link11,
  String link12,
) {
  return StaggeredGrid.count(
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: [
      //lighthouse boy
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 2,
        child: Container(
          color: color1,
          child: Image.asset(
            link1,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      //anuj
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.25,
        child: Container(
          color: color1,
          child: Image.asset(
            link5,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      //gaddis
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.25,
        child: Container(
          color: color1,
          child: Image.asset(
            link6,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      //the good
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 1,
        child: Container(
          color: color1,
          child: Image.asset(
            link2,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      //plainview
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: Container(
          color: color1,
          child: Image.asset(
            link3,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      //baudelaire
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: Container(
          color: color1,
          child: Image.asset(link4),
        ),
      ),
      //living room
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 0.75,
        child: Container(
          color: color1,
          child: const SizedBox(
            width: 300,
            height: 300,
            child: RiveAnimation.asset(
              AppAnimations.livingRoomAnimation,
            ),
          ),
        ),
      ),
      //poem
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 2,
        child: Container(
          color: color1,
          child: Image.asset(
            link7,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      //poem
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 2,
        child: Container(
          color: color1,
          child: Image.asset(
            link8,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      //jap mythic creature
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 1.5,
        child: Container(
          color: color1,
          child: Image.asset(
            link9,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      //angel
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 1.5,
        child: Container(
          color: color1,
          child: Image.asset(
            link10,
            fit: BoxFit.cover,
          ),
        ),
      ),
      //indra's net
      StaggeredGridTile.count(
        crossAxisCellCount: 3,
        mainAxisCellCount: 1.5,
        child: Container(
          color: color1,
          child: Image.asset(
            link11,
            fit: BoxFit.cover,
          ),
        ),
      ),

      //self portrait
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.5,
        child: Container(
          color: color1,
          child: Image.asset(
            link12,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    ],
  );
}
