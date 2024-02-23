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
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173583893467779184/Screenshot_2023-11-13-16-29-43-114_com.instagram.android-edit.jpg?ex=65e5af2c&is=65d33a2c&hm=bc5fbd24ec5e85db405046fdcef557ea0d7b024dffc021298fdbec07559a17b2&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173583932164415548/Screenshot_2023-11-13-16-31-23-104_com.instagram.android-edit.jpg?ex=65e5af35&is=65d33a35&hm=b945a9dac35980abc2e977a582270e7326798b9acf57994369147cfdc393dddc&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173583907124412486/Screenshot_2023-11-13-16-30-16-598_com.instagram.android-edit.jpg?ex=65e5af2f&is=65d33a2f&hm=5c32f9255c7f889a9539dc725866f2b4a1bb2bad80c5781de35e40eeec55f97c&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173583921737388032/Screenshot_2023-11-13-16-30-54-817_com.instagram.android-edit.jpg?ex=65e5af33&is=65d33a33&hm=f6ccd11650dc73a197b2856af7d8707e097c153939d8e65a2da2b9836354de9b&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173627358436151327/Anuj1_1.gif?ex=65e5d7a7&is=65d362a7&hm=57e6c908aa94226f21fc4bd35a99b8078849be7b867c9373974cdac52945a04f&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173635521193451630/Screenshot_2023-11-13-20-17-22-131_com.instagram.android-edit.jpg?ex=65e5df41&is=65d36a41&hm=569d884e52e7a347a24f93bc09add7bda76b653f696cb03a49aedcb0a4e0bb8c&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1178601624269234186/Screenshot_2023-11-27_131137.png?ex=65e57b4c&is=65d3064c&hm=51656534679389b0a6d66a3ade0d6f03ad75e61f2b5918092e45591260e0c250&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1178601644892626964/Screenshot_2023-11-27_124725.png?ex=65e57b51&is=65d30651&hm=52edb7715495f5b86eaca46c8b4707d5af39b2b951f04ea9c6da3eaa0b72b35d&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1178702339935314030/photo1701094709.jpeg?ex=65e5d919&is=65d36419&hm=d81d3eb4f0f5eab18cc74cf1be17b64384eb04989756bb70d7c952ccc8eab335&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1178921833626611722/photo1701094823.jpeg?ex=65e6a584&is=65d43084&hm=64c9d2040da283079be630eebc27b82027c9299d6d72fe7b45c2f4a46493aa2e&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1187054705818480842/533b09af-871c-47bf-bd47-e52c08fbca97.jpeg?ex=65e88c58&is=65d61758&hm=0ef16de393fee8603180efdeff8b78c54313fccf0b30dc4943cb0ef571a76ce5&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1187424005272109086/6828fbdc-c439-4c39-8ea1-999c6db36bca.jpeg?ex=65e9e448&is=65d76f48&hm=92dd73c7ef83d16bf2c751710e79939d52c2102f275e159133103a69504f6181&',
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
          child: Image.network(
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
          child: Image.network(
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
          child: Image.network(
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
          child: Image.network(
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
          child: Image.network(
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
          child: Image.network(link4),
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
          child: Image.network(
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
          child: Image.network(
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
          child: Image.network(
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
          child: Image.network(
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
          child: Image.network(
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
          child: Image.network(
            link12,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    ],
  );
}
