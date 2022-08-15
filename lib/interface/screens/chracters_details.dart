import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Constants/MyColors.dart';
import 'package:flutter_application_1/data/models/chracters.dart';

class ChracterDetailsScreen extends StatelessWidget {
  final Character character;
  const ChracterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo(
                    'Job : ',
                    character.jobs.join(' / '),
                  ),
                  buildDivider(333),
                  characterInfo(
                    'Appeard In : ',
                    character.catogryForSeries,
                  ),
                  buildDivider(282),
                  characterInfo(
                    'Seasons : ',
                    character.appreanceOfSeasons.join(" / "),
                  ),
                  buildDivider(300),
                  characterInfo(
                    'Status : ',
                    character.statusIfDeadOrAlive,
                  ),
                  buildDivider(315),
                  character.appreanceOfBetterCallSau.isEmpty
                      ? Container()
                      : characterInfo(
                          'Better Call Saul Seasons : ',
                          character.appreanceOfBetterCallSau.join(' / '),
                        ),
                  character.appreanceOfBetterCallSau.isEmpty
                      ? Container()
                      : buildDivider(200),
                  characterInfo(
                    'Actor : ',
                    character.actorName,
                  ),
                  buildDivider(323),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 500,
            )
          ]))
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      // elevation: 0.5,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "${character.nickName}",
          style: TextStyle(color: MyColors.MyWhite),
          // textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.MyWhite,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.MyWhite,
              // fontWeight: FontWeight.,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Color.fromARGB(255, 213, 231, 15),
      endIndent: endIndent,
      height: 25,
      thickness: 3,
    );
  }
}
