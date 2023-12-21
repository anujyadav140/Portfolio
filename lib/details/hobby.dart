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
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173583893467779184/Screenshot_2023-11-13-16-29-43-114_com.instagram.android-edit.jpg?ex=65647c2c&is=6552072c&hm=a8a80d7ebf70b36d584962dc5923a5c2d33e251414247fe898c929f51c0aa94b&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173583932164415548/Screenshot_2023-11-13-16-31-23-104_com.instagram.android-edit.jpg?ex=65647c35&is=65520735&hm=811b625a007278f42fd1ea16b329a7d38a942ffd3bd9cded24375bc342b116ad&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173583907124412486/Screenshot_2023-11-13-16-30-16-598_com.instagram.android-edit.jpg?ex=65647c2f&is=6552072f&hm=773af78117cf82854f3c20b9f75f0cc577a49e2828c146548d4205a570ce9fbc&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173583921737388032/Screenshot_2023-11-13-16-30-54-817_com.instagram.android-edit.jpg?ex=65647c33&is=65520733&hm=f10b836a273b9cca9bc4aec1317b513209c5b091fa0fba9319d6ccb506b32193&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173627358436151327/Anuj1_1.gif?ex=6564a4a7&is=65522fa7&hm=d3c9011675c034583ebdb0e79c8773a785b7df72b7d1dcc7bbc1f0661f7b6690&',
                  'https://cdn.discordapp.com/attachments/889189690052325396/1173635521193451630/Screenshot_2023-11-13-20-17-22-131_com.instagram.android-edit.jpg?ex=6564ac41&is=65523741&hm=95087c06b137179f9d59a057e31e8ab1513ae2de80c7ea828f2be3c0cea075c7&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1178601644892626964/Screenshot_2023-11-27_124725.png?ex=6576bd51&is=65644851&hm=41a3d5211197b6474f1afa0d80686996bed5e72d0cd8ce3d02542ecfb5bad556&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1178601624269234186/Screenshot_2023-11-27_131137.png?ex=6576bd4c&is=6564484c&hm=bfd153b8116c9a30387c0cff04cdc9cc2dac0d2c9874a3dab1f4e8511349c2d0&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1178702339935314030/photo1701094709.jpeg?ex=65771b19&is=6564a619&hm=731a7bb20cb517f8bd531687f1922b3a30b240cbbde47fc8b7bc2b535ff62dbf&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1178921833626611722/photo1701094823.jpeg?ex=6577e784&is=65657284&hm=3451933b1d48e4589b742688256789b1639e4f4ebf23176e505faf66c3e632e4&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1187054705818480842/533b09af-871c-47bf-bd47-e52c08fbca97.jpeg?ex=65957dd8&is=658308d8&hm=d8e59935d3163e437fc1ea1573087b34df5a0c8918037e38001955db36b6cc1b&',
                  'https://cdn.discordapp.com/attachments/1178553564235321384/1187424005272109086/6828fbdc-c439-4c39-8ea1-999c6db36bca.jpeg?ex=6596d5c8&is=658460c8&hm=52ffe1af0e8a68d1af2c278ef36f6821eaf28e5e6edb2ea18d3831bcfc408c53&',
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
